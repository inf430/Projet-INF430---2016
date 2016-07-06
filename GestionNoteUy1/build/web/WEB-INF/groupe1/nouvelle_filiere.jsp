<%-- 
    Document   : nouvelle_filiere
    Created on : 4 juil. 2016, 07:11:36
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvelle filière</title>
    </head>
    <body>
      <form method="get">
        <p><label for="code">Code de la filière</label> : <input type="text" name="code" id="code"></p>
	<p><label for="libelle">Libellé de la filiere</label> : <input type="text" name="libelle" id="libelle"></p>
	<p><label for="dep">Département</label> : <select style="width: 100px" name="dep" id="dep"></select></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
