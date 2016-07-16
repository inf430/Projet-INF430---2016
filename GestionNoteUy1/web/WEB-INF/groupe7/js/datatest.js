(function ($) {
    $.fn.frDatatable = function (liste_entetes, idZoneAffichage,title) {
        var datatable = "";
        var nbreParams = liste_entetes.length;
        //construction des entetes
        datatable += '<table class="display" id="data_t" cellspacing="0",width="100%">';
        datatable += '<thead>';
        datatable += '<tr>';
        datatable+='<center><h4 class="titre">'+title+'</h4></center>';
        for (var i = 0; i < nbreParams; i++) {
            datatable += '<th>' + liste_entetes[i] + '</th>';
        }
        datatable += '</tr>';
        datatable += '</thead>';
        datatable += '<tbody>';
        for (var i = 0; i < 20; i++) {
            datatable += '<tr><td>kenne</td><td>Fritz</td><td>Kenne</td><td>fritzo</td></tr>';
        }
        datatable += '</tbody>';
        datatable += '<tfoot>';
        datatable += '<tr>';
        for (var i = 0; i < nbreParams; i++) {
            datatable += '<th>' + liste_entetes[i] + '</th>';
        }
        datatable += '</tr>';
        datatable += '</tfoot>';
        //affichage du datatable
        $('#' + idZoneAffichage).after(datatable);

        //initialisation du datatable

    };
})(jQuery);

//function get_liste_parametres_entete(operation) {
//    var liste_parametres = "";
//    var parametre = {nom_element: operation};
//    $.ajax(
//            {
//                url: "servlet_traitements",
//                type: 'GET',
//                data: "params=" + JSON.stringify({parametre: parametre}),
//                dataType: 'json',
//                success: function (data) {
//                    liste_parametres = data.liste_parametres;
//
//                },
//                error: function () {
//                    alert('echec de la requete de demande des entetes');
//                }
//
//            });
//    return liste_parametres;
//}
//
//function get_liste_elements(nomElement) {
//    var listeElements = "";
//    var params = {element: nomElement};
//    $.ajax(
//            {
//                url: "servlet_traitements",
//                type: "GET",
//                data: "params=" + JSON.stringify({parametre: params}),
//                dataType: 'json',
//                success:function(data){
//                    listeElements=data.listeElements;
//                },
//                error:function(){
//                    alert('echec de la requete de demande de cette liste');
//                }
//              
//
//            });
//        return listeElements;
//
//}


