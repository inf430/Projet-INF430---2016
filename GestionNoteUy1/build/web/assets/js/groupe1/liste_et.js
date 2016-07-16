/** 
 * @author  groupe1
 */

function getListeDepartement() {
    var listeDeptartement = {
        objet: "departement"
    };
    
    $.ajax({
        url: 'liste-etudiants',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeDeptartement}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#departement").append('<option value="' + val.id + '">' +val.libelle+ '</option>');
            });
            
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}

function getListeFiliere(id) {
    var listeFiliere = {
        objet: "filiere",
        iddept: id
    };
    
    $.ajax({
        url: 'liste-etudiants',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeFiliere}),
        dataType: 'JSON',
        success: function (data) {
            $("#filiere").empty();
            $("#filiere").append('<option value="">--choisissez--</option>');
            $.each(data, function (key, val) {
                $("#filiere").append('<option value="' + val.id + '">' +val.libelle+ '</option>');
            });
            
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}

function getListeClasse(id) {
    var listeClasse = {
        objet: "classe",
        idfiliere: id
    };
    
    $.ajax({
        url: 'liste-etudiants',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeClasse}),
        dataType: 'JSON',
        success: function (data) {
            $("#classe").empty();
            $("#classe").append('<option value="">--choisissez--</option>');
            $.each(data, function (key, val) {
                $("#classe").append('<option value="' + val.id + '">' +val.nom+ '</option>');
            });
            
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}

function getListeEtudiants(id) {
    var listeEtudiants = {
        objet: "etudiant",
        idclasse: id
    };
    
    $.ajax({
        url: 'liste-etudiants',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeEtudiants}),
        dataType: 'JSON',
        success: function (data) {
            $("#liste_et").empty();
            $.each(data, function (key, val) {
                $("#liste_et").append('<tr><td><a href="etudiantclasse?classe='+val.matricule+'">'+val.matricule+'</a></td><td>'+val.nom+'</td><td>'+val.prenom+'</td><td>'+val.datenaiss+'</td><td>'+val.lieunaiss+'</td><td>'+val.numtel+'</td><td>'+val.sexe+'</td></tr>');
            });
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}

$(document).ready(function () {

    $("#departement").on("change",function(e){
       e.preventDefault();
       if ( $("#departement").val() !== ""){
           var id = $("#departement").val();
           getListeFiliere(id);
       }else{
           $("#filiere").empty();
           $("#classe").empty();
       }
    });
    
    $("#filiere").on("change",function(e){
       e.preventDefault();
       if ( $("#filiere").val() !== ""){
            var id = $("#filiere").val();
            getListeClasse(id);
       }else{
           $("#classe").empty();
       }
    });
    
    $("#classe").on("change",function(e){
       e.preventDefault();
       if ( $("#classe").val() !== ""){
           var id = $("#classe").val();
           getListeEtudiants(id);
       }
       
    });

    getListeDepartement();
});

