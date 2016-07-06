<%-- 
    Document   : add_matieres_ue
    Created on : 4 juil. 2016, 06:47:34
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter des matière à une UE</title>
    </head>
    <body>
      <form method="get">
        <p><label for="code">Code de l'UE</label> : <input type="text" name="code" id="code"></p>
	<p><label for="matieres">Cochez les matières</label> : <select name="matieres" id="matieres"></select></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
