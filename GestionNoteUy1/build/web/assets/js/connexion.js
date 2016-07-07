/* 
 * @author name=Groupe 3
 * @author Niveau=5
 * @author Classe=Master 1
 */
$(document).ready(function(){
    $('button').on("click",function(e){
      e.preventDefault();
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
                var htmlMAJ="";
                htmlMAJ+='<br/><h3 class="connexion_error_message">'+data.reponse+'</h3>';
                $('#password').after(htmlMAJ);
                
            },
            error: function(){
               alert('echec de la requete, possibilite de passivite du serveur'); 
            }
              
        });
    });
   
});

