/** 
 * @author  groupe1
 */

var expressionReguliereAnnee = /[0-9][0-9][0-9][0-9]/;

$(document).ready(function () {

    $("#annee").on("keyup", function () {
        console.log("annee");
        if (expressionReguliereAnnee.test($('#annee').val())) {
            $('#erreur').hide('now');
            $('#valider').removeAttr("disabled");
        } else {
            $('#erreur').show('slow');
            $('#valider').attr("disabled", "");
        }
    });


    $("#valider").on("click", function (e) {
        e.preventDefault();
        var entier = parseInt($("#annee").val());
        var params = {
            annee: $("#annee").val() + "-" + entier
        };

        $.ajax({
            url: 'createannee',
            type: 'get',
            data: "params=" + JSON.stringify({params: params}),
            dataType: 'JSON',
            success: function (data) {
                if (data.resultat === 1) {
                    $("#exist").show("slow").delay(1000).hide("slow");
                } else {
                    var entier = parseInt($("#annee").val());
                    var params = {
                        annee: $("#annee").val() + "-" + entier
                    };

                    $.ajax({
                        url: 'createannee',
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


