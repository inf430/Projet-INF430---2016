<%-- 
    Document   : add_role_person
    Created on : 4 juil. 2016, 00:57:20
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter rôle à une personne</title>
    </head>
    <body>
      <form method="get">
	<p><label for="login">Login de la personne</label> : <input type="text" name="login" id="login"></p>
	<p><label for="role">Rôle</label> : <select name="role" id="role"></select></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
        
    </body>
</html>
