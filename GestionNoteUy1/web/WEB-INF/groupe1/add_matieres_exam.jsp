<%-- 
    Document   : add_matieres_exam
    Created on : 4 juil. 2016, 06:30:04
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter une matière à des examens</title>
    </head>
    <body>
      <form method="get">
        <p><label for="code">Code de la matière</label> : <input type="text" name="code" id="code"></p>
	<p><label for="examens">Cochez les examens</label> : <select name="examens" id="examens"></select></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
