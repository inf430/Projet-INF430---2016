<%-- 
    Document   : liste_enseignant_dept
    Created on : 4 janv. 1980, 15:29:18
    Author     : Groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouveau chef de département</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>nommer un chef de departement</center></fieldset>
                </div><br>
                <div id="success" style="display: none">
                    <p> Nomination correctement effectuée</p>
                </div>
                <div id="erreur" style="display:none">
                    <p> Un problème est survenu lors de la souvegarde</p>
                </div>
                <div id="exist" style="display: none">
                    <p> Cet enseignant est déjà chef de ce départment pour l'année courante</p>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="deps">Departement</label>
                    <div class="col-lg-9">
                        <select name="departement" class="form-control" id="departements">
                            <option value="departement">aucune selection</option>
                        </select>  
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="enseignant">Enseignant</label>
                    <div class="col-lg-9">
                        <select class="form-control" name="enseignant" id="enseignant"></select>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button type="reset" class="btn btn-primary">Annuler</button>
                    <button type="button" class="btn btn-primary" id="valider">Valider</button>
                </div><br>
            </form>
        </div>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/nouveau_chef_departement.js"></script>
    </body>
</html>
