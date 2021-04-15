// !preview r2d3 data=NULL, options=list(hex_size=50, hex_stroke_width=6L, flash_color="#008080", basis_color="#DCDCDC", flash_duration_secs=6L, flash_interval_secs=1L)

class Hexagon {

  constructor(center, width) {
    this.center = center;
    this.width  = width;
  }

  get radius() {
    return this.width / Math.sqrt(3);
  }

  get path() {
    const radius = this.radius;
    const width  = this.width;
    return [
      {y: radius     , x: 0          },
      {y: radius / 2 , x: width / 2  },
      {y: -radius / 2, x: width / 2  },
      {y: -radius    , x: 0          },
      {y: -radius / 2, x: -width / 2 },
      {y: radius / 2 , x: -width / 2 },
    ].map(p => {
      p.x = p.x + this.center.x;
      p.y = p.y + this.center.y;
      return p;
    });
  }

}

class HexagonMap {

  constructor(svg, hex_size, width, height) {
    this.hex = {
      size   : hex_size,
      width  : 1.5 * hex_size,
      height : Math.sqrt(3) * hex_size,
    };
    this.width   = width;
    this.height  = height;
    this.svg     = svg;
    this.render().start();
  }

  get centers() {
    const centers_x = d3.range(
      0,
      this.width,
      this.hex.width
    );
    const centers_y = d3.range(
      0,
      this.height + this.hex.height,
      this.hex.height * 0.75
    );
    return centers_y.map((y, i) => {
      if (i % 2 === 0) {
        return centers_x.map(x => {
          return {x: x, y: y};
        });
      } else {
        return centers_x.map(x => {
          return {x: x + this.hex.width / 2, y};
        });
      }
    })
    .flat(1);
  }

  get hexagons() {
    return this.centers
      .map(center => new Hexagon(center, this.hex.width));
  }

  get hexpaths() {
    return this.hexagons
      .map(h => h.path.map(d => [d.x, d.y]));
  }

  render() {
    this.hexmap = this.svg.selectAll("hex")
      .data(this.hexpaths)
      .enter()
      .append("path")
        .attr("d", d => d3.line()(d))
        .attr("fill", options.basis_color)
        .attr("stroke", "white")
        .attr("stroke-width", options.hex_stroke_width);
    return this;
  }

  get random_hex() {
    const random_hex_idx = Math.floor(Math.random() * this.hexmap.size());
    return this.hexmap
      .filter((d, i) => i === random_hex_idx);
  }

  flash_random_hex() {
    // select a random hex
    const hex = this.random_hex;
    // transition the color to blue
    hex
      .transition()
      .duration(options.flash_duration_secs * 500)
      .style("fill", options.flash_color)
      .transition()
      .duration(options.flash_duration_secs * 500)
      .style("fill", options.basis_color);
  }

  start() {
    this.timer = d3.interval(x => {
      this.flash_random_hex();
    }, options.flash_interval_secs * 1000);
  }

  stop() {
    this.timer.stop();
  }

}

HEXAGONMAP = new HexagonMap(svg, options.hex_size, width, height);
