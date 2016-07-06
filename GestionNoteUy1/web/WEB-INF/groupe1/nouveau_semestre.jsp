<%-- 
    @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Nouveau semestre</title>
    </head>
    <body>
        <div class="container col-lg-5">
            <form method="post" class="form-horizontal row">
                <div id="success" class="has-success" style="display:none">
                    <p>Semestre correctement ajouté</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div class="form-group">
                    <label for="code">Code du semestre</label>
                    <input type="text" name="code" id="code">
                </div>
                <button type="reset">Annuler</button>
                <button type="submit" id="valider">Valider</button>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_semestre.js"></script>
    </body>
</html>
