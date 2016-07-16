<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvelle matière</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>nouvelle matiere</center></fieldset>
                </div>
                <div id="success" class="has-success" style="display: none">
                    Matiere correctement ajoutée
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display: none">
                    Une matière de même code existe déjà
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="code">Code de la matière</label> 
                    <div class="col-lg-9">
                        <input type="text" name="code" id="code"  required="" class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="Libelle">Libellé de la matière</label>
                    <div class="col-lg-9">
                        <input type="text" name="libelle" id="libelle" required="" class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button class="btn btn-primary" type="reset" id="reset">Annuler</button>
                    <button class="btn btn-primary" type="submit" id="valider">Valider</button>
                </div><br>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_matiere.js"></script>
    </body>
</html>



