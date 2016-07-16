/** 
 * @author  groupe1
 */


function getListeDepartement() {
    var listeDeptartement = {
        objet: "departement"
    };
    
    $.ajax({
        url: 'liste',
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
        url: 'liste',
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
        url: 'liste',
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

function getListeUE(id) {
    var listeUe = {
        objet: "ue",
        idclasse: id
    };
    
    $.ajax({
        url: 'liste',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeUe}),
        dataType: 'JSON',
        success: function (data) {
            $("#ueliste").empty();
            $.each(data, function (key, val) {
                $("#ueliste").append('<tr><td><a href="matiereue?ue='+val.code+'">'+val.code+'</a></td><td>'+val.libelle+'</td></tr>');
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
       var id = $("#departement").val();
       getListeFiliere(id);
    });
    
    $("#filiere").on("change",function(e){
       e.preventDefault();
       var id = $("#filiere").val();
       getListeClasse(id);
    });
    
    $("#classe").on("change",function(e){
       e.preventDefault();
       var id = $("#classe").val();
       getListeUE(id);
    });

    getListeDepartement();
});