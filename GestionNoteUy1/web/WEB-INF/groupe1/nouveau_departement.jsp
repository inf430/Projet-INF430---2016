<%-- 
    Document   : nouveau_departement
    Created on : 4 juil. 2016, 07:14:04
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouveau département</title>
    </head>
    <body>
      <form method="get">
    	<p><label for="code">Code du département</label> : <input type="text" name="code" id="code"></p>
	<p><label for="libelle">Libellé du département</label> : <input type="text" name="libelle" id="libelle"></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
