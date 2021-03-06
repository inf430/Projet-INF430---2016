/**
 * @author groupe1
 */


var expressionReguliereNumero = /^[0-9][0-9]+$/;
var expressionReguliereDate = /[0-9][0-9]\-[0-9][0-9]\-[0-9][0-9][0-9][0-9]/;

$(document).ready(function () {
    $("#datenaiss").on("keyup", function () {
        if (expressionReguliereDate.test($("#datenaiss").val())) {
            $("#datenaiss").parent().removeClass("alert-danger");
            $("#valider").removeAttr("disabled");
        } else {
            $("#datenaiss").parent().addClass("alert-danger");
            $("#valider").attr("disabled", "");
        }
    });

    $('#matricule').focusout(function () {
        $("#valider").attr("disabled", "");
        $.ajax({
            url: "createstudent",
            type: "Get",
            data: "params=" + JSON.stringify({params: {matricule: $('#matricule').val()}}),
            dataType: 'json',
            success: function (data) {
                if (data.resultat === 1) {
                   $('#matricule').parent().addClass('has-error');
                   $('#error-matricule').show('slow');
                } else {
                    $('#matricule').parent().removeClass('has-error');
                    $("#valider").removeAttr("disabled");
                    $('#error-matricule').hide('now');
                    
                }

            },
            error: function () {
            }
        });

    });

    $("#numtel").on("keyup", function () {
        if (expressionReguliereNumero.test($("#numtel").val())) {
            $("#numtel").parent().removeClass("alert-danger");
            $("#valider").removeAttr("disabled");
        } else {
            $("#numtel").parent().addClass("alert-danger");
            $("#valider").attr("disabled", "");
        }
    });

    $("#valider").on("click", function (e) {
        e.preventDefault();
        var params = {
            matricule: $("#matricule").val(),
            nom: $("#nom").val(),
            prenom: $("#prenom").val(),
            datenaiss: $("#datenaiss").val(),
            lieunaiss: $("#lieunaiss").val(),
            sexe: $("#sexe").val(),
            numtel: $("#numtel").val()
        };

        $.ajax({
            url: 'createstudent',
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
    });
});





