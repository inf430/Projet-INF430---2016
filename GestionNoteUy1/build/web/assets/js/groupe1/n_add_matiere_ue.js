/**
 * @author groupe1
 */

$(document).ready(function () {
    var listeMatieres = {
        objet: "matiere"
    };

    var listeUes = {
        objet: "ue"
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
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeUes}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#code").append('<option value="' + val.code + '">' + val.code + '</option>');
            });
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });

    $("#matiere").on("change", function () {
        $("#valider").attr("disabled", "");
        var assoc = {
            code: $("#code").val(),
            matiere: $("#matiere").val()
        };
        $.ajax({
            url: 'matiereue',
            type: 'get',
            data: "params=" + JSON.stringify({params: assoc}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 1) {
                    $("#erreur-mat").show("slow");
                } else {
                    $("#erreur-mat").hide("now");
                    $("#valider").removeAttr("disabled");
                }
            },
            error: function () {

            }
        });
    });

    $("#code").on("change", function () {
        $("#valider").attr("disabled", "");
        var assoc = {
            code: $("#code").val(),
            matiere: $("#matiere").val()
        };
        $.ajax({
            url: 'matiereue',
            type: 'get',
            data: "params=" + JSON.stringify({params: assoc}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 1) {
                    $("#erreur-mat").show("slow");
                } else {
                    $("#erreur-mat").hide("now");
                    $("#valider").removeAttr("disabled");
                }
            },
            error: function () {

            }
        });
    });

    $("#valider").on("click", function () {
        var assoc = {
            code: $("#code").val(),
            matiere: $("#matiere").val()
        };
        $.ajax({
            url: 'matiereue',
            type: 'get',
            data: "params=" + JSON.stringify({params: assoc}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 1) {
                    $("#erreur-mat").show("slow");
                } else {
                    var params = {
                        code: $("#code").val(),
                        matiere: $("#matiere").val(),
                        credit: $("#credit").val()
                    };

                    $.ajax({
                        url: 'matiereue',
                        type: 'post',
                        data: "params=" + JSON.stringify({params: params}),
                        dataType: "post",
                        success: function (data) {
                            if (data.resultat === 1) {
                                $("#success").show("slow").delay(1000).hide("slow");
                                location.reload();
                            } else {
                                $("#error").show("slow").delay(1000).hide("slow");
                            }
                        },
                        error: function () {
                            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
                        }
                    });
                }
            },
            error: function () {

            }
        });


    });

});


