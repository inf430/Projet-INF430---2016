<%-- 
    Document   : nouvelle_ue
    Created on : 4 juil. 2016, 06:53:15
    Author     : LOLITA CHEKEM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvelle UE</title>
    </head>
    <body>
      <form method="get">
        <p><label for="code">Code de l'UE</label> : <input type="text" name="code" id="code"></p>
	<p><label for="libelle">Libellé de l'UE</label> : <input type="text" name="libelle" id="libelle"></p>
        <p><label for="sem">Semestre</label> : <select name="sem" id="sem"></select></p>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
