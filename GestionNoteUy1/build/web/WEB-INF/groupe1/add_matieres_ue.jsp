<%-- 
  @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter des matière à une UE</title>
    </head>
    <body>
        <div class="container row">
            <form class="row form-horizontal row" method="post">
                 <div class="row form-group">
                     <fieldset><center>association des matieres aux UES</center></fieldset>
                 </div><br>
                <div id="success" class="has-success" style="display:none">
                    Matiere correctement ajoutée à l'UE
                </div>
                <div id="error" class="has-error" style="display:none">
                    Un problème est survenu lors de l'ajout
                </div>
                <div id="erreur-mat" style="display: none">
                    Cette matière est déjà associée à cette Ue
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="code">Ue</label>
                    <div class="col-lg-9">
                        <select  name="code" class="form-control" id="code"></select>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="matiere">Matière</label>
                    <div class="col-lg-9">
                        <select class="form-control" name="matiere" id="matiere"></select>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="credit">Credit</label>
                    <div class="col-lg-9">
                        <input type="number" name="credit" required="" class="form-control" id="credit"/>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button type="reset" class="btn btn-primary">Annuler</button>
                    <button type="button" class="btn btn-primary" id="valider">Valider</button>
                </div><br>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-2.3.1.min.js"></script>
        <script src="assets/js/groupe1/n_add_matiere_ue.js"></script>
    </body>
</html>
