function drawPieChart(domComp, dataset, size, pieRadius) {
    var svgSize = size;
    var radius = pieRadius;
    var legendRectSize = 18;
    var legendSpace = 4;
    var colors = d3.scale.category20();
    var pie = d3.layout.pie()
        .value(function (d) {
            return d.count;
        })
        .sort(null);
    var arc = d3.svg.arc().outerRadius(radius);

    var svg = d3.select(domComp).append("svg")
        .attr("id", "pie")
        .attr("width", svgSize)
        .attr("height", svgSize);
    var pieG = svg.append("g")
        .attr("transform", "translate(" + svgSize / 2 + "," + svgSize / 2 + ")");
    var chart = pieG.selectAll("path")
        .data(pie(dataset))
        .enter()
        .append("path")
        .attr("d", arc)
        .style("fill", function (d, i) {
            return colors(i);
        });
    // add a hidden tooltip dom on the page
    var tooltip = d3.select(domComp).append("div")
        .attr("id", "tooltip");
    tooltip.append("p").attr("id", "label");
    tooltip.append("p").attr("id", "count");
    // setup mouse event on pie chart to popup the tooltip dom just added
    chart.on("mouseover", function (d) {
        var tooltip = d3.select("#tooltip")
            .style("left", d3.event.clientX + "px")
            .style("top", d3.event.clientY + "px")
            .style("opacity", 1);
        console.log(d3.event);
        tooltip.select("p#label")
            .text(d.data.label);
        tooltip.select("p#count")
            .text(d.data.count);
    });
    chart.on("mouseout", function () {
        // Hide the tooltip
        d3.select("#tooltip")
            .style("opacity", 0);
    });
    // add legends
    var legendG = svg.append("g");
    var legend = legendG.selectAll(".legend")
        .data(dataset)
        .enter()
        .append("g")
        .attr("class", "legend")
        .attr('transform', function (d, i) {
            var height = legendRectSize + legendSpace;
            var horz = legendSpace;
            var vert = legendSpace + i * height;
            return 'translate(' + horz + ',' + vert + ')';
        });
    legend.append('rect')
        .attr('width', legendRectSize)
        .attr('height', legendRectSize)
        .style('fill', function (d, i) {
            return colors(i);
        });
    legend.append('text')
        .attr('x', legendRectSize + legendSpace)
        .attr('y', legendRectSize - legendSpace)
        .text(function (d) {
            return d.label;
        });
}