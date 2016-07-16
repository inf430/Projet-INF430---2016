/** 
 * @author  groupe1
 */



$(document).ready(function () {

    var liste = {
        objet: "semestre"
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: liste}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#semestre").append('<option value="' + val.id + '">' + val.libelle + '</option>');
            });
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });

    $("#valider").on("click", function (e) {
        e.preventDefault();
        var test = {
            code: $("#code").val()
        };
        $.ajax({
            url: 'createue',
            type: 'get',
            data: "params=" + JSON.stringify({params: test}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 1) {
                   $("#exist").show("slow").delay(1000).hide("slow");
                } else {
                    var params = {
                        semestre: $("#semestre").val(),
                        code: $("#code").val(),
                        libelle: $("#libelle").val()
                    };

                    $.ajax({
                        url: 'createue',
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

            }
        });
    });
});


