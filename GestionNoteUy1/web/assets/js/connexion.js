/* 
 * @author name=Groupe 3
 * @author Niveau=5
 * @author Classe=Master 1
 */
$(document).ready(function(){
    $('button').on("click",function(){
        $('#success').hide('now');
             var login = $('#username').val();
      var password = $('#password').val();
      var params={
          login:login,
          password:password
      };
      $.ajax({
            url:'connexion',
            type:'Get',
            data:"params="+JSON.stringify({params:params}),
            dataType:'json',
            success: function(data){
                if ( data.reponse === "correct"){
                    $("#form").submit();
                }else{
                   $('#success').show('slow'); 
                }
                
            },
            error: function(){
               alert('echec de la requete, possibilite de passivite du serveur'); 
            }
              
        });
    });
   
});

