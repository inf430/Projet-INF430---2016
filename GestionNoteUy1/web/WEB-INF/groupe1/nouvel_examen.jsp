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
        <div class="container col-lg-5">
        <form method="post" class="form-horizontal row">
            <div id="success" class="has-success" style="display:none">
                <p>Enseignant correctement ajouté</p> 
            </div>
            <div id="error" class="has-error" style="display:none">
                <p> Un problème est survenu lors de la sauvegarde</p>
            </div>
            <div class="form-control">
                <label for="type">Type</label>
                <input name="type" id="type" required="">
            </div>
            <div class="form-control">
                <label for="dateexam">Date Examen</label>
                <input type="date" name="dateexam" id="dateexam" required=""/>
            </div>
            <button type="reset">Annuler</button>
            <button type="submit" id="valider">Valider</button>
        </form>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_examen.js"></script>
        </div>
    </body>
</html>
