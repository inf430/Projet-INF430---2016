/** 
 * @author groupe1
 */

function getListeDroit() {
    var listeDroit = {
        objet: "droit"
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeDroit}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#droit").append('<option value="' + val.id + '">' + val.nom + '</option>');
            });

        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}

function getListeRole() {
    var listeRole = {
        objet: "role"
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeRole}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#role").append('<option value="' + val.id + '">' + val.role + '</option>');
            });
        },
        error: function () {
            alert('erreur lors de la requête, possibilité de passivité du serveur');
        }
    });
}

function persister() {
    var params = {
        role: $("#role").val(),
        droit: $("#droit").val()
    };


    $.ajax({
        url: 'roleright',
        type: 'post',
        data: "params=" + JSON.stringify({params: params}),
        dataType: 'JSON',
        success: function (data) {
            if (data.resultat === 2) {
                $("#info_role").show();
            } else if (data.resultat === 1) {
                $("#info_role").hide();
                $("#success").show("slow").delay(1000).hide("slow");
            } else {
                $("#info_role").hide();
                $("#error").show("slow").delay(1000).hide("slow");
            }
        },
        error: function () {
            alert("Erreur d'envoi de la requete , possibilite de passivite du serveur");
        }
    });
}
$(document).ready(function () {
    getListeRole();
    getListeDroit();
    $("#valider").on('click', function (e) {
        e.preventDefault();
        if ($("#role").val().trim() === "" || $("#droit").val().trim() === "") {
            $("#error_role").show();
        } else {
            $("#error_role").hide();
            persister();
        }
    });
});


