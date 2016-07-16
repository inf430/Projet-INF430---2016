/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    var params = {
        "paging": true,
        "ordering": true,
        "info": true,
        "scrollY": 200,
        "scrollX": true
    };

    var liste_entetes = new Array("element1", "element2", "element3", "element4");
    var titre="liste des etudiants";
    var zone = "zone";
    $('#zone').frDatatable(liste_entetes, zone,titre);
    $('.display').dataTable(params);
});

