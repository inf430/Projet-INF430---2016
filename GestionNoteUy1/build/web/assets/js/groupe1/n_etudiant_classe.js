$(document).ready(function () {
    var listeEtudiant = {
        objet: "etudiant"
    };

    var listeClasse = {
        objet: "classe"
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeEtudiant}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#etudiants").append('<option value="' + val.matricule + '">' + val.nom + ' ' + val.prenom + '</option>');
            });

        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeClasse}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#classe").append('<option value="' + val.id + '">' + val.nom + '</option>');
            });
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });

    $("#valider").on("click", function () {
        var params = {
            matricule: $("#etudiant").val(),
            classe: $("#classe").val()
        };

        $.ajax({
            url: 'etudiantclasse',
            type: 'get',
            data: "params=" + JSON.stringify({params: params}),
            dataType: "json",
            success: function (data) {
                if (data.resultat === 1) {
                    $("#exist").show("slow").delay(1000).hide("now");
                } else {
                    $("#valider").on("click", function () {
                        var params = {
                            matricule: $("#etudiant").val(),
                            classe: $("#classe").val()
                        };

                        $.ajax({
                            url: 'etudiantclasse',
                            type: 'post',
                            data: "params=" + JSON.stringify({params: params}),
                            dataType: "json",
                            success: function (data) {
                                if (data.resultat === 1) {
                                    $("#success").show("slow").delay(1000).hide("slow");
                                } else {
                                    $("#error").show("slow").delay(1000).hide("slow");
                                }
                            },
                            error: function () {
                                alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
                            }
                        });

                    });
                }
            },
            error: function () {
                alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
            }
        });

    });

});
