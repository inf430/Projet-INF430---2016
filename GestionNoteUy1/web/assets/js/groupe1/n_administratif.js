/** 
 * @author  groupe1
 */

var expressionReguliereNumero = /^[0-9][0-9]+$/;
var expressionReguliereDate = /[0-9][0-9]\-[0-9][0-9]\-[0-9][0-9][0-9][0-9]/;

$(document).ready(function () {
    $("#datenaiss").on("keyup", function () {
        if (expressionReguliereDate.test($("#datenaiss").val())) {
            $("#datenaiss").parent().removeClass("alert-danger");
            $("#valider").removeAttr("disabled");
            $("#login").val($("#nom").val()+$("#datenaiss").val()); 
            $("#password").val($("#nom").val()+$("#datenaiss").val());
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
    
    $("#nom").on("keyup",function(){
       $("#login").val($("#nom").val()+$("#datenaiss").val()); 
       $("#password").val($("#nom").val()+$("#datenaiss").val()); 
    });
    
    $("#valider").on("click",function(e){
       e.preventDefault();
       var params = {
         nom : $("#nom").val(),
         prenom : $("#prenom").val(),
         datenaiss : $("#datenaiss").val(),
         lieunaiss : $("#lieunaiss").val(),
         sexe : $("#sexe").val(),
         numtel : $("#numtel").val(),
         login : $("#login").val(),
         password : $("#password").val()
       };
       
       $.ajax({
          url : 'createadministratif',
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


