/**
 * 
 * @param {String} title
 * @param {array} datas array of object {label: string, y: number}
 * @returns {undefined}
 */
$.fn.chart = function (title, datas) {
    var chart = new CanvasJS.Chart($(this).attr("id"), {
        title: {
            text: title
        },
        data: [
            {
                type: "column",
                dataPoints: datas
            }
        ]
    });
    chart.render();
};


