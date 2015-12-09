function getIntByDollarAmount(dollarAmount) {
    return parseInt(dollarAmount.replace("$", "").replace(",", ""));
}

function drawMixedBarChart(domComp, data, svgWidth, svgHeight) {
    var colors = d3.scale.category10();
    var sumTextLen = 120;
    var sumCount = d3.sum(data, function(d){return +getIntByDollarAmount(d.count);});
    var x = d3.scale.linear().domain([0, sumCount/3, sumCount]).range([0, (svgWidth-sumTextLen)/2, svgWidth-sumTextLen]);

    var svg_g = d3.select(domComp)
        .append("svg")
        .attr("width", svgWidth)
        .attr("height", svgHeight)
        .append("g");

    svg_g.selectAll("rect")
        .data(data)
        .enter()
        .append("rect")
        .attr("width", function(d) {return x(getIntByDollarAmount(d.count));})
        .attr("height", svgHeight)
        .attr("x", function(d, i){
            if (i == 0) {
                return 0;
            }
            else {
                var accum_width = 0;
                for (var idx=0; idx < i; idx++) {
                    accum_width += x(getIntByDollarAmount(data[idx].count));
                }
            }

            return accum_width + i*1;
        }).attr("fill", function(d, i) {return colors(i);});

    svg_g.selectAll("text")
        .data(data)
        .enter()
        .append("text")
        .attr("class", "count")
        .attr("x", function(d, i){

            var accum_width = 0;
            for (var idx=0; idx < i; idx++) {
                accum_width += x(getIntByDollarAmount(data[idx].count));
            }

            return accum_width + i*1;
        })
        .attr("y", 20)
        .attr("text-anchor", "center")
        .text(function(d) {return d.count;});

    var sumStr = sumCount.toString();
    if (sumStr.length >= 4) {
        sumStr = ['$', sumStr.slice(0, sumStr.length-3), ',', sumStr.slice(sumStr.length-3)].join('');
    }
    svg_g.append("text")
        .attr("class", "sum")
        .attr("x", d3.sum(data, function(d){return x(getIntByDollarAmount(d.count))}) + 5)
        .attr("y", 20)
        .text(sumStr);

}