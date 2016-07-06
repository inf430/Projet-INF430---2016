<%-- 
   @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Nouvel examen</title>
    </head>
    <body>
        <form method="get">
            <p><label for="type">Droit</label> : <select name="type" id="type"></select></p>
            <p><label for="date_prevue">Date prévue</label> : <input type="date" name="date_prevue" id="date_prevue"/></p>
            <input type="button" value="Annuler" />
            <input type="submit" value="Valider" />
        </form>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_enseignant.js"></script>
    </body>
</html>
