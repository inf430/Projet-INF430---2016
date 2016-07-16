$(document).ready(function () {
    getListeDepartement();

    $("#departements").on("change", function (e) {
        e.preventDefault();
        var iddept = $("#departements").val();
        if (iddept !== "departement") {
            getListeEnseignant(iddept);
        } else {
            $("#enseignant").empty();
            $("#valider").attr("disabled", "");
        }
    });

    $("#valider").on("click", function () {
        var test = {
            departement: $("#departements").val(),
            matricule: $("#enseignant").val()
        };

        $.ajax({
            url: 'addchefdepartement',
            type: "get",
            data: "params="+JSON.stringify({params: test}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 1) {
                    $("#exist").show("slow").delay(1000).hide("slow");
                } else {
                    $.ajax({
                        url: 'addchefdepartement',
                        type: "post",
                        data: "params=" + JSON.stringify({params: test}),
                        dataType: "json",
                        success: function (reponse) {
                            if (reponse.resultat === 1) {
                                $("#success").show("slow").delay(1000).hide("slow");
                            } else {
                                $("#erreur").show("slow").delay(1000).hide("slow");
                            }
                        },
                        error: function ( ) {
                            alert("erreur de requête , possibilité de passivité du serveur");
                        }
                    });
                }
            },
            error: function ( ) {
                alert("erreur de requête , possibilité de passivité du serveur");
            }
        });
    });
});

function getListeDepartement() {
    var listeDepartement = {
        objet: "departement"
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeDepartement}),
        dataType: 'JSON',
        success: function (data) {
            $("#departements").empty();
            $("#departements").append('<option value="">--choisissez--</option>');
            $.each(data, function (key, val) {
                $("#departements").append('<option value="' + val.id + '">' + val.libelle + '</option>');
            });

        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}



function getListeEnseignant(id) {
    var params = {
        objet: "enseignant",
        iddept: id
    };
    $.ajax({
        url: 'listeenseignantdept',
        type: 'post',
        data: "params=" + JSON.stringify({params: params}),
        dataType: 'JSON',
        success: function (data) {
            $("#enseignant").empty();
            $.each(data, function (key, val) {
                $("#enseignant").append('<option value="' + val.matricule + '">' + val.nom + ' ' + val.prenom + '</option>');
            });
            $("#valider").removeAttr("disabled");
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}
