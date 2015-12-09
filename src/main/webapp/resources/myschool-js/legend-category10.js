function drawLegendCategory10(domComp, data, svgWidth, svgHeight) {
    var colors = d3.scale.category10();
    var secLen = svgWidth / data.length;

    var svg_g = d3.select(domComp)
        .append("svg")
        .attr("width", svgWidth)
        .attr("height", svgHeight)
        .append("g");

    svg_g.append("rect")
        .attr("x", "0")
        .attr("y", "0")
        .attr("width", svgWidth)
        .attr("height", svgHeight)
        .attr("fill", "#d8d8d8")
        .attr("visibility", "visible");

    var svg_g_g = svg_g.append("g")
        .attr("zIndex", "1");

    var gs = svg_g_g.selectAll("g")
        .data(data)
        .enter()
        .append("g")
        .attr("transform", function(d, i){return "translate(" + i*secLen + ",0)";});

    gs.append("rect")
        .attr("width", 18)
        .attr("height", 18)
        .attr("x", 10)
        .attr("y", 3)
        .attr("fill", function(d, i) {return colors(i);});

    gs.append("text")
        .attr("x", 33)
        .attr("y", 15)
        .text(function(d){return d.label;});
}