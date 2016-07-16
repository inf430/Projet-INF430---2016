<%-- 
    Document   : add_role_person
    Created on : 8 juil. 2016, 00:57:20
    Author     : GROUPE 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter rôle à une personne</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class=" row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>Attribution d'un role</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display:none">
                    <p>Association de rôle correctement effectuée</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div id="erreur-role" style="display: none">
                    Cette personne a déjà ce role
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="login">Nom de la personne</label>
                    <div class="col-lg-9">
                        <input list="logins" class="form-control" type="text" name="login" id="login">
                        <datalist id="logins">
                        </datalist>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="role">Rôle</label> 
                    <div class="col-lg-9">
                        <select class="form-control" name="role" id="role"></select>
                    </div>
                </div>
                <div class="row form-group" align='center'>
                    <button type="reset" class="btn btn-primary">Annuler</button> 
                    <button type="button" id="valider" class="btn btn-primary ">Valider</button>
                </div>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_add_role_person.js"></script>
    </body>
</body>
</html>
