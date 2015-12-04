/**
 * Created by kevin on 11/17/15.
 */
function drawBarChart(domComp, dataset, svgWidth, svgHeight) {
    dataset.sort(function(a, b) {return b.count - a.count;});
    var labelLen = 70;
    var countLen = 45;
    var x = d3.scale.linear().range([0, svgWidth-labelLen-countLen]);
    var y = d3.scale.ordinal().rangeRoundBands([0, svgHeight],.1);
    var yAxis = d3.svg.axis().scale(y).orient("left").tickSize(0);
    x.domain([0, d3.max(dataset, function(d) {return Number(d.count);})]);
    y.domain(dataset.map(function(d) {return d.label;}));
    var format = d3.format(",.0f");

    var svg = d3.select(domComp).append("svg")
        .attr("width", svgWidth)
        .attr("height", svgHeight)
        .append("g")
        .attr("transform", "translate(" + labelLen + ",0)");
    var bars = svg.selectAll(".bar")
        .data(dataset)
        .enter()
        .append("g")
        .attr("class", "bar")
        .attr("transform", function(d) {return "translate(0," + y(d.label) + ")";});

    bars.append("rect")
        .attr("width", function(d, i) {return x(d.count);})
        .attr("height", y.rangeBand());

    bars.append("text")
        .attr("class", "count")
        .attr("x", function(d) {return x(d.count)+3;})
        .attr("y", y.rangeBand()/2)
        .attr("dy", ".35em")
        .attr("text-anchor", "start")
        .text(function(d) {return format(d.count);});

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis);
}