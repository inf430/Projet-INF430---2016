<%-- 
  @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap-multiselect.css"/>
        <title>Ajouter un nouveau niveau</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="form-horizontal row">
                <div class="row form-group">
                    <fieldset><center>nouveau niveau</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Niveau correctement ajouté
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display: none">
                    Ce niveau existe déjà dans le système
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="niveau">Niveau</label>
                    <div class="col-lg-9">
                        <input type="text" name="niveau" id="niveau" required="" class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="cycle">cycle</label>
                    <div class="col-lg-9">
                        <select class="form-control" name="cycle" id="cycle">
                            <option value="L">L</option>
                            <option value="M">M</option>
                            <option value="D">D</option>
                        </select>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button type="reset" class="btn btn-primary">Annuler</button>
                    <button type="submit" id="valider" class="btn btn-primary">Valider</button>
                </div>
            </form>
        </div>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_niveau.js"></script>
        <script src="assets/js/bootstrap-multiselect.js"></script>
    </body>
</html>
