/** 
 * @author  groupe1
 */



$(document).ready(function () {

    var liste = {
        objet: "departement"
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: liste}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#departement").append('<option value="' + val.id + '">' + val.libelle + '</option>');
            });
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });

    $("#valider").on("click", function (e) {
        e.preventDefault();
        var params = {
            departement: $("#departement").val(),
            code: $("#code").val(),
            libelle: $("#libelle").val()
        };

        $.ajax({
            url: 'createfiliere',
            type: 'get',
            data: "params=" + JSON.stringify({params: params}),
            dataType: 'JSON',
            success: function (data) {
                if (data.resultat === 1) {
                    $("#exist").show("slow").delay(1000).hide("slow");
                } else {
                    $("#valider").on("click", function (e) {
                        e.preventDefault();
                        var params = {
                            departement: $("#departement").val(),
                            code: $("#code").val(),
                            libelle: $("#libelle").val()
                        };

                        $.ajax({
                            url: 'createfiliere',
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
                    });
                }
            },
            error: function () {
                alert("Erreur d'envoi de la requete , possibilite de passivite du serveur");
            }
        });
    });
});


