<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouveau département</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>nouveau departement</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Departement correctement ajouté
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display: none">
                    Un département de même code existe déjà
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="code">Code</label>
                    <div class="col-lg-9">
                        <input type="text" name="code" id="code" required="" class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="Libelle">Libellé</label>
                    <div class="col-lg-9">
                        <input type="text" name="libelle" id="libelle" required="" class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button type="reset" class="btn btn-primary">Annuler</button>
                    <button type="submit" id="valider" class="btn btn-primary">Valider</button>
                </div><br>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_departement.js"></script>
    </body>
</html>




