$(document).ready(function () {
    getListeDepartement();
    
    $("#departements").on("change",function(e){
       e.preventDefault();
        var iddept=$("#departements").val();
        getListeEnseignant(iddept);
    });
});

function getListeDepartement() {
        var listeDepartement = {
            objet: "departement",
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
                    $("#enseignant").append('<tr><td> ' + val.matricule + '</td><td> ' + val.nom + '</td><td>' + val.prenom + '</td></tr>');
                });
            },
            error: function () {
                alert('erreur lors de la requête, possibilité de passivité du serveur');
            }
        });
    }
