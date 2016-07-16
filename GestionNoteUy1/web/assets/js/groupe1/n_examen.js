/** 
 * @author  groupe1
 */

var expressionReguliereNumero = /^[0-9][0-9]+$/;
var expressionReguliereDate = /[0-9][0-9]\-[0-9][0-9]\-[0-9][0-9][0-9][0-9]/;

$(document).ready(function () {
    $("#dateexam").on("keyup", function () {
        if (expressionReguliereDate.test($("#dateexam").val())) {
            $("#dateexam").parent().removeClass("alert-danger");
            $("#valider").removeAttr("disabled");
        } else {
            $("#dateexam").parent().addClass("alert-danger");
            $("#valider").attr("disabled", "");
        }
    });

    $("#valider").on("click", function (e) {
        e.preventDefault();
        var params = {
            type: $("#type").val()
        };

        $.ajax({
            url: 'createexam',
            type: 'get',
            data: "params=" + JSON.stringify({params: params}),
            dataType: 'JSON',
            success: function (data) {
                if (data.resultat === 1) {
                    $("#exist").show("slow").delay(1000).hide("slow");
                } else {
                    var params = {
                        type: $("#type").val(),
                        dateexam: $("#dateexam").val()
                    };

                    $.ajax({
                        url: 'createexam',
                        type: 'post',
                        data: "params=" + JSON.stringify({params: params}),
                        dataType: 'JSON',
                        success: function (data) {
                            if (data.resultat === 1) {
                                $("#success").show("slow").delay(1000).hide("slow");
                            } else {
                                $("#error").show("slow").delay(1000).hide("slow");
                            }
                        },
                        error: function () {
                            alert("Erreur d'envoi de la requete , possibilite de passivite du serveur");
                        }
                    });
                }
            },
            error: function () {
                alert("Erreur d'envoi de la requete , possibilite de passivite du serveur");
            }
        });
    });
});


