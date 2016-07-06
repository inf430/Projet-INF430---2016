<%-- 
    Document   : associate_role_right
    Created on : 4 juil. 2016, 05:52:36
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter un rôle à un droit</title>
    </head>
    <body>
        <form method="get">
            <p><label for="droit">Nom du droit</label> : <select name="droit" id="droit"></select></p>
            <p><label for="role">Nom du rôle</label> : <select name="role" id="role"></select></p>
            <input type="button" value="Annuler" />
            <input type="submit" value="Valider" />
        </form>
    </body>
</html>
