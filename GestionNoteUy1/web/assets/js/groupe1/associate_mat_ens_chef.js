/** 
 * @author  groupe1
 */

$(document).ready(function () {
    $("#valider").on("click",function(e){
       e.preventDefault();
       var params = {
         idmatiere : $("#idmatiere").val(),
         matricule : $("#matricule").val()
       };
       
       $.ajax({
          url : 'liste-matieres-ens-chef',
          type: 'post',
          data: "params="+JSON.stringify({params:params}),
          dataType : 'JSON',
          success : function(data){
              if ( data.resultat === 1){
                  $("#success").show("slow").delay(1000).hide("slow");
                  location.reload();
              }else{
                  $("#error").show("slow").delay(1000).hide("slow");                  
              }
          },
          error : function(){
              alert("Erreur d'envoi de la requete , possibilite de passivite du serveur");
          }
       });
    });
    $("#ajouter_fil").on("click",function(e){
       e.preventDefault();
       $("#m_form").show("slow");
    });  
});


