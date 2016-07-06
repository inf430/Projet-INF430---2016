<%-- 
    Document   : associate_right_person
    Created on : 4 juil. 2016, 05:59:18
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donner un droit à une personne</title>
    </head>
    <body>
      <form method="get">
	<p><label for="login">Login de la personne</label> : <input type="text" name="login" id="login"></p>
	<p><label for="droit">Droit</label> : <select name="droit" id="droit"></select></p>
        <p><label for="debut">Date de début</label> : <input type="date" name="debut" id="debut"/></p>
        <p><label for="debut">Date de fin</label> : <input type="date" name="fin" id="fin"/></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
