<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvelle Annee</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>nouvelle annee accademique</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Annee correctement ajoutée
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>

                <div class="row form-group">
                    <div id="erreur" style="display:none">
                        Erreur sur le format , ex: 2015 correspond à 2015-2016
                    </div>
                    <div id="exist" style="display:none">
                        Annee déjà existante
                    </div>
                    <label class="control-label col-lg-3" for="annee">Annee Academique</label>
                    <div class="col-lg-9">
                        <input type="text"   name="annee" id="annee" required="" class="form-control" size="4" maxlength="4"/>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button class="btn btn-primary" type="reset">Annuler</button>
                    <button class="btn btn-primary" type="submit" id="valider">Valider</button>
                </div><br>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_annee.js"></script>
    </body>
</html>





