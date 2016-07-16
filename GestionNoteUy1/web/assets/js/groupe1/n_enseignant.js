/** 
 * @author  groupe1
 */

var expressionReguliereNumero = /^[0-9][0-9]+$/;
var expressionReguliereDate = /[0-9][0-9]\-[0-9][0-9]\-[0-9][0-9][0-9][0-9]/;

$(document).ready(function () {
    var objet={objet:"departement"};
    $.ajax({
       url:"listing",
       type:"Post",
       data:"params="+JSON.stringify({params:objet}),
       dataType:"json",
       success:function(data){
           $.each(data,function(key,val){
              $('#departement').append('<option value="'+val.id+'">'+val.libelle+'</option>');
           });
       },
       error:function(){
           alert('serveur non actif; veuillez recharger la page');
       }
       
    });
    $('#matricule').focusout(function(){
        $('#valider').attr("disabled","");
        $.ajax({
            url:"createteacher",
            type:"Get",
            data:"params="+JSON.stringify({params:{matricule:$('#matricule').val()}}),
            datatype:"json",
            success:function(data){
               if(data.reponse===1){
                   $('#error').show('slow');
               }else{
                   $('#error').hide('now');
                   $('#valider').removeAttr("disabled");
               } 
            },
            error:function(){
                
            }
        });
    });
    
    
    $("#datenaiss").on("keyup", function () {
        if (expressionReguliereDate.test($("#datenaiss").val())) {
            $("#datenaiss").parent().removeClass("alert-danger");
            $("#valider").removeAttr("disabled");
        } else {
            $("#datenaiss").parent().addClass("alert-danger");
            $("#valider").attr("disabled", "");
        }
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
    
    $("#valider").on("click",function(e){
       e.preventDefault();
       var params = {
         matricule: $("#matricule").val(),
         nom : $("#nom").val(),
         prenom : $("#prenom").val(),
         datenaiss : $("#datenaiss").val(),
         lieunaiss : $("#lieunaiss").val(),
         sexe : $("#sexe").val(),
         grade : $("#grade").val(),
         specialite : $("#specialite").val(),
         numtel : $("#numtel").val(),
         departement : $('#departement').val()
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


