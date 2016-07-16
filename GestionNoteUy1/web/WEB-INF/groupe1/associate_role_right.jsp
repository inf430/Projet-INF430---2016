<%-- 
  @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter un rôle à un droit</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>attribution de droits aux roles</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Droit correctement associé
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>

                <div class="row form-group">
                    <label class="control-label col-lg-3" for="droit">Nom du droit </label>
                    <div class="col-lg-9">
                        <select class="form-control" name="droit" id="droit">
                        </select>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="role">Nom du rôle</label>
                    <div class="col-lg-9">
                        <select class="form-control" name="role" id="role">
                        </select>
                    </div>
                </div><br>
                <div class="alert-info" id="info_role" style="display: none;">
                    <p>Droit déjà associer a ce role</p>
                </div>
                <div class="alert-danger" id="error_role" style="display: none;">
                    <p>Remplir tous les champs</p>
                </div>
                <div class="row form-group" align="center">
                    <button type="reset" class="btn btn-primary">Annuler</button>
                    <button type="submit" id="valider" class="btn btn-primary">valider</button>
                </div>
            </form>
        </div>

        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_associate_role_right.js"></script>
    </body>
</html>
