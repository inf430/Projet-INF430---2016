<%-- 
    Document   : nouvelle_matiere
    Created on : 4 juil. 2016, 06:39:47
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvelle matière</title>
    </head>
    <body>
      <form method="get">
	<p><label for="code">Code de la matière</label> : <input type="text" name="code" id="code"></p>
	<p><label for="libelle">Libellé de la matière</label> : <input type="text" name="libelle" id="libelle"></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
