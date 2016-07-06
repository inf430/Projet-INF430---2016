<%-- 
  @author groupe1
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
        <label for="code">Code de la matière</label> : <input type="text" name="code" id="code">
	<label for="examens">Cochez les examens</label>
        <select multiple="multiple" name="examens" id="examens">
            
        </select>
        <input type="button" value="Annuler" />
        <input type="submit" value="Valider" />
      </form>
    </body>
</html>
