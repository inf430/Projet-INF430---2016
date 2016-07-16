<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvelle filière</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>nouvelle filiere</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Filiere correctement ajoutée
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display: none">
                    Ce code de filière est déjà utilisé
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="departement">Departement</label>
                    <div class="col-lg-9">
                        <select class="form-control" type="text" name="departement" id="departement"> </select>
                    </div>
                    <div class="row form-group">
                        <label class="control-label col-lg-3" for="Code">Code</label>
                        <div class="col-lg-9">
                            <input type="text" name="code" id="code"  required="" class="form-control"/>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label class="control-label col-lg-3" for="Libelle">Libelle</label>
                        <div class="col-lg-9">
                            <input type="text" name="libelle" id="libelle" required="" class="form-control"/>
                        </div>
                    </div><br>
                    <div class="row form-group" align="center">
                        <button type="reset" class="btn btn-primary">Annuler</button>
                        <button type="submit" class="btn btn-primary" id="valider">Valider</button>
                    </div>
            </form>
        </div>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_filiere.js"></script>
    </body>
</html>
