/** 
 * @author  groupe1
 */



$(document).ready(function () {


    $("#valider").on("click", function (e) {
        e.preventDefault();
        var params = {
            nom: $("#nom").val()
        };
        $.ajax({
            url: 'createdroit',
            type: 'get',
            data: "params=" + JSON.stringify({params: params}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 1) {
                     $("#exist").show("slow").delay(1000).hide("slow");
                } else {
                    $.ajax({
                        url: 'createdroit',
                        type: 'post',
                        data: "params=" + JSON.stringify({params: params}),
                        dataType: 'JSON',
                        success: function (data) {
                            if (data.resultat === 1) {
                                $("#success").show("slow").delay(1000).hide("slow");
                                $("#reset").trigger("click");
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


