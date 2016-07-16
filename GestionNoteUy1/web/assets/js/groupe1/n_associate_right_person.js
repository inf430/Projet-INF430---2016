/**
 * @author groupe1
 */

var expressionReguliereDate = /[0-9][0-9]\-[0-9][0-9]\-[0-9][0-9][0-9][0-9]/;

function getListeLogins() {
    var listePersonne = {
        objet: 'login'
    };

    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listePersonne}),
        dataType: "JSON",
        success: function (data) {
            $("#valeurs").empty();
            $.each(data, function (key, val) {
                $("#valeurs").append('<option value="' + val.login + '">' + val.nom + ' ' + val.prenom + '</option>');
            });
        },
        error: function () {
            alert(" erreur de la requête , possibilité du serveur ");
        }
    });
}

function getListeDroits() {
    var listeDroit = {
        objet: 'droit'
    };


    $.ajax({
        url: 'listing',
        type: 'post',
        data: "params=" + JSON.stringify({params: listeDroit}),
        dataType: "JSON",
        success: function (data) {
            $("#droit").empty();
            $("#droit").append('<option value="">--choisissez--</option>');
            $.each(data, function (key, val) {
                $("#droit").append('<option value="' + val.id + '">' + val.nom + '</option>');
            });
        },
        error: function () {
            alert(" erreur de la requête , possibilité du serveur ");
        }
    });
}

function validateDate(dateStr) {
    var dateArr = dateStr.split('-');
    var newDate = new Date(dateArr[2], parseInt(dateArr[1], 10) - 1, parseInt(dateArr[0], 10));
    return newDate.getMonth() === parseInt(dateArr[1], 10) - 1;
}

function verifRegex(el, type) {
    var date = new Date($(el).val());
    if (validate($(el).val())) {
        $(el).removClass("errordate");
        $("#error-" + type).hide('slow');
    } else {
        $(el).addClass("errordate");
        $("#error-" + type).show('now');
    }
}

function checkDebutFin(debut, fin) {
    var tabdeb = (debut.val().split('-'));
    var tabfin = (fin.val().split('-'));
    var Odeb = new Date(tabdeb[2], tabdeb[1], tabdeb[0]);
    var Ofin = new Date(tabfin[2], tabfin[1], tabfin[0]);
    if (Odeb > Ofin) {
        alert('La fin ne doit pas être antérieure au début.');
        debut.focus();
        debut.style.backgroundColor = '#fee';
        return false;
    }
}
$(document).ready(function () {
    var params = {
        altField: "#datepicker",
        closeText: 'Fermer',
        prevText: 'Précédent',
        nextText: 'Suivant',
        currentText: 'Aujourd\'hui',
        monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
        monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
        dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
        dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
        dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
        weekHeader: 'Sem.',
        dateFormat: 'dd-mm-yy'
    };
    $("#debut").datepicker(params);
    $("#fin").datepicker(params);

    getListeLogins();
    getListeDroits();

    $("#debut").on("keyup", function () {
        verifRegex(this, "debut");
    });

    $("#fin").on("keyup", function () {
        verifRegex(this, "fin");
    });

    $("#valider").on("click", function (e) {
        e.preventDefault();
        var debut = $("#debut");
        var fin = $("#fin");
        checkDebutFin(debut, fin);

        var assoc = {
            login: $("#login").val(),
            droit: $("#droit").val(),
            debut: $("#debut").val(),
            fin: $("#fin").val()
        };
        
        $.ajax({
            url: 'rightperson',
            type: 'post',
            data: "params=" + JSON.stringify({params: assoc}),
            dataType: "JSON",
            success: function (data) {
                if (data.resultat === 2) {
                    $("#erreur-attr").show("now");
                }
                else if (data.resultat === 1) {
                    $("#erreur-mat").show("slow");
                    $("#erreur-attr").hide("now");
                } else {
                    $("#erreur-attr").hie("now");
                    $("#erreur-mat").hide("now");
                    $("#valider").removeAttr("disabled");
                }
            },
            error: function () {
                alert(" erreur de la requête , possibilité du serveur ");
            }
        });
    });
});


