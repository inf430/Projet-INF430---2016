/* 
 * @author: groupe 1
 */


$(document).ready(function () {
    
    $("#valider").removeAttr("disabled");
    
    var listeLogins = {
        objet: 'login'
    };

    var listeRoles = {
        objet: 'role'
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeLogins}),
        dataType: 'JSON',
        success: function (data) {
            $.each(data, function (key, val) {
                $("#logins").append('<option value="' + val.login + '">' + val.nom + ' ' + val.prenom + '</option>');
            });
        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeRoles}),
        dataType: "JSON",
        success: function (data) {
            $.each(data, function (key, val) {
                $("#role").append('<option value="' + val.id + '">' + val.role + '</option>');
            });
        },
        error: function () {
            alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
        }
    });

    $("#valider").on("click", function(){
        var params = {
            login: $("#login").val(),
            role: $("#role").val()
        };
        $.ajax({
            url: 'addroleperson',
            type: 'get',
            data: "params=" + JSON.stringify({params: params}),
            dataType: 'JSON',
            success: function (data) {
                if (data.resultat === 1) {
                    $("#erreur-role").show("slow").delay(1000).hide("slow");
                } else {
                    var params = {
                        login: $("#login").val(),
                        role: $("#role").val()
                    };

                    $.ajax({
                        url: 'addroleperson',
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
                }
            },
            error: function () {
                alert("Erreur d'envoi de la requete , possibilite de passivite du serveur");
            }
        });
    });
});