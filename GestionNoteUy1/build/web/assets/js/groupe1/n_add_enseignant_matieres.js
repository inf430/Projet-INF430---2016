/* 
 * @author: groupe 1
 */

function listerDepartement() {
    var dep = {
        objet: 'departement',
        departement: 0
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: dep}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#deps").append('<option value="' + val.id + '">' + val.libelle + '</option>');
            });
        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });
}

function listeEnseignantDuDepartement(iddept) {
    var ensdep = {
        departement: iddept,
        objet: "ensdep"
    };
    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: ensdep}),
        dataType: "JSON",
        success: function (data) {
            $.each(data, function (key, val) {
                $("#noms").append('<option value="' + val.matricule + '">' + val.nom + '  ' + val.prenom + '</option>');
            });
        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });
}

function listeClasseDuDepartement(iddept) {
    var clasdep = {
        departement: iddept,
        objet: 'clasdep'
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: clasdep}),
        dataType: "JSON",
        success: function (data) {
            $("#classes").append('<option value="vide" selected="vide">aucune selection</option>');
            $.each(data, function (key, val) {
                $("#classes").append('<option value="' + val.idclasse + '">' + val.nom + '</option>');
            });

        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });
}
function listeMatiereDeLaClasse(idclasse) {
    var matclas = {
        departement: idclasse,
        objet: "matclas"
    };
    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: matclas}),
        dataType: "JSON",
        success: function (data) {
            var i = 0;
            $.each(data, function (key, val) {
                $("#matieres").append('<option value="' + val.idmatiere + '">' + val.code + '</option>');
                $("#valider").attr("disabled", "");
                i++;
            });
            if (i !== 0)
            {
                $("#valider").removeAttr("disabled");
            }

        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });
}

function persist(matricule, idclasse, idmatiere) {
    var params = {
            matricule: matricule,
            idclasse: idclasse,
            idmatiere: idmatiere
        };

        $.ajax({
            url: 'createenseignantmatiere',
            type: 'post',
            data: "params=" + JSON.stringify({params: params}),
            dataType: 'JSON',
            success: function (data) {
                if(data.resultat === 2) {
                    $("#info_ens_mat").show("slow").delay(1000).hide("slow");
                }
                else if (data.resultat === 1) {
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

function notEmptyField(el) {
    var ok = true;
    if(el === "" || el === "rien"){
        ok = false;
    }
    
    return ok;
}
$(document).ready(function () {

    listerDepartement();

    $("#deps").on("change", function () {
        if ($("#deps").val() !== "rien") {
            $("#valider").attr("disabled", "");

            $("#noms").empty();
            $("#classes").empty();
            $("#matieres").empty();

            var id = $("#deps").val();
            listeEnseignantDuDepartement(id);
            listeClasseDuDepartement(id);
        } else {
            $("#noms").empty();
            $("#classes").empty();
            $("#matieres").empty();
        }
    });

    $("#classes").on("change", function () {

        if ($("#classes").val() !== "vide") {
            $("#valider").attr("disabled", "");
            $("#matieres").empty();
            
            var id = $("#classes").val();
            listeMatiereDeLaClasse(id);
        } else {
            $("#matieres").empty();
            $("#matieres").append('<option value="vide" selected="vide">aucune selection</option>');
        }
    });




    $("#valider").on("click", function (e) {
        e.preventDefault();
        
        var matricule = $("#noms").val().trim(),
            idclasse = $("#classes").val().trim(),
            idmatiere = $("#matieres").val().trim();
        if(notEmptyField(matricule) && notEmptyField(idclasse) && notEmptyField(idmatiere)) {
            persist(matricule, idclasse, idmatiere);
        }
        
    });
});