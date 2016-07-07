/**
 * @author groupe1
 */

/** 
 * @author  groupe1
 */


$(document).ready(function () {
    var listeMatieres = {
        objet : 'matiere'
    };
    
    var listeExamens = {
        objet : 'examen'
    };
    
    $.ajax({
        url : 'listing',
        type: 'post',
        data : "params="+JSON.stringify({params:listeMatieres}),
        dataType : 'JSON',
        success : function(data){
            $.each( data, function(key , val){
                $("#code").append('<option value="'+ val.code +'">'+ val.libelle + '</option>');
            });
        },
        error : function(){
            
        }
    });
    
    $.ajax({
       url : 'listing',
       type : 'post',
       data : "params="+JSON.stringify({params:listeExamens}),
       dataType : "JSON",
       success : function(data){
           $.each( data , function(key , val){
              $("#examens").append('<option value="' + val.code + '">' + val.type + '</option>' ); 
           });
       },
       error : function(){
           alert("erreur lors de l'envoi de la requête, possibilité de passivité du serveur");
       }
    });
   
    $("#valider").on("click",function(e){
       e.preventDefault();
       var params = {
         
       };
       
       $.ajax({
          url : 'createteacher',
          type: 'post',
          data: "params="+JSON.stringify({params:params}),
          dataType : 'JSON',
          success : function(data){
              if ( data.resultat === 1){
                  $("#success").show("slow").delay(1000).hide("slow");
              }else{
                  $("#error").show("slow").delay(1000).hide("slow");                  
              }
          },
          error : function(){
              alert("Erreur d'envoi de la requete , possibilite de passivite du serveur");
          }
       });
    });
});





