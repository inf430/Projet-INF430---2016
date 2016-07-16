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
        <title>Ajouter Matieres à un Enseignant</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class=" row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>attribution de matieres aux enseignants</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display:none">
                    <p>Association de Matieres correctement effectuée</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div id="erreur-role" style="display: none">
                    Cet enseignant enseigne déjà cette matiere
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="deps">Departement</label>
                    <div class="col-lg-9">
                        <select name="deps" class="form-control" id="deps">
                            <option value='rien' selected="selected">aucune selection</option>
                        </select> 
                    </div>
                </div><br>  
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="noms">Nom de l'enseignant</label>
                    <div class="col-lg-9">
                        <select name="noms" class="form-control" id="noms"></select> 
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="classes">Classe</label>
                    <div class="col-lg-9">
                        <select name="classes" class="form-control" id="classes">
                            <option value='vide' selected="vide">aucune selection</option>
                        </select> 
                    </div>
                </div><br> 
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="matieres">Matiere</label> 
                    <div class="col-lg-9">
                        <select class="form-control" name="matieres" id="matieres"></select>
                    </div>
                </div><br>

                <div class="alert-info" id="info_ens_mat" style="display: none;">
                    <p>Cet enseignant enseigne déjà cette matière</p>
                </div><br>
                <div class="row form-group" align="center">
                <button type="reset" class="btn btn-primary">Annuler</button> 
                <button type="submit" id="valider" class="btn btn-primary ">Valider</button>
                </div><br>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_add_enseignant_matieres.js"></script>
    </body>
</body>
</html>



