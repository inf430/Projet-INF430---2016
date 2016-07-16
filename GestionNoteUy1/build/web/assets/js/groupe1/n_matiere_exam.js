/**
 * @author groupe1
 */



$(document).ready(function () {
    var listeMatieres = {
        objet: 'matiere'
    };

    var listeExamens = {
        objet: 'examen'
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeMatieres}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#matiere").append('<option value="' + val.id + '">' + val.code + '</option>');
            });
        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeExamens}),
        dataType: "JSON",
        success: function (data) {
            $.each(data, function (key, val) {
                $("#examen").append('<option value="' + val.id + '">' + val.type + '</option>');
            });
        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });

    $("#matiere").on("change", function () {

    });


    $("#valider").on("click", function (e) {
        e.preventDefault();
        $("#valider").attr("disabled", "");
        var params = {
            matiere: $("#matiere").val(),
            examen: $("#examen").val()
        };
        $.ajax({
            url: 'addexammatter',
            type: 'get',
            data: "params=" + JSON.stringify({params: params}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 1) {
                    $("#erreur-assoc").show("slow");
                } else {
                    $("#erreur-assoc").hide("now");
                    $("#valider").removeAttr("disabled");
                    var params = {
                        matiere: $("#matiere").val(),
                        examen: $("#examen").val(),
                        pourcentage: $("#pourcentage").val()
                    };

                    $.ajax({
                        url: 'addexammatter',
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

            }
        });
    });
});





