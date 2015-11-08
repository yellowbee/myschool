
function drawPieChart(domComp, dataset) {
        var svgSize = 300;
        var radius = 120;
        var legendRectSize = 18;
        var legendSpace = 4;
        var colors = d3.scale.category20();
        var pie = d3.layout.pie()
                .value(function (d) {
                    return d.count;
                })
                .sort(null);
        var arc = d3.svg.arc().outerRadius(radius);
        console.log(arc);

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