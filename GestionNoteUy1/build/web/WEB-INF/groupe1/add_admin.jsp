<%-- 
   @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajout d'un nouveau admin</title>
    </head>
    <body>
        <div class="container row"> 
            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>nouvel administrateur</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Admin correctement ajouté
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display: none">
                    Ce login n'est pas disponible
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="login">Login</label>
                    <div class="col-lg-9">
                        <input type="text" name="login" id="login" required="" class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class='control-label col-lg-9' for="nom">Password</label>
                    <div class="col-lg-9">
                        <input type="password" name="password" id="password"  required="" class="form-control"/>
                    </div>
                </div>
                <div class="row form-group" align="center">
                    <button class="btn btn-primary" type="reset" id="reset">Annuler</button>
                    <button class="btn btn-primary" type="submit" id="valider">Valider</button>
                </div>
            </form>

        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_admin.js"></script>
    </body>
</html>
