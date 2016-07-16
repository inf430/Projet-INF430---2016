<%-- 
    Document   : add_etudiant_classe
    Created on : 11 juil. 2016, 10:25:48
    Author     : ALI IBRAHIM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter un etudiant dans une classe</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class=" row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>inscription etudiant</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display:none">
                    <p>Etudiant correctement inscrit</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div id="exist" style="display: none">
                    L'étudiant est déjà inscrit dans cette classe pour l'année courante
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="etudiant">Nom de l'étudiant </label>
                    <div class="row form-group">
                        <input  list="etudiants" name="etudiant" class="form-control" id="etudiant" required=""/>
                    </div>
                    <div class="row form-group">
                        <datalist class="form-control" id="etudiants"></datalist>
                    </div>

                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="classe">Classe </label>
                    <div class="col-lg-9">
                        <select  class="form-control" name="classe" id="classe" required=""/></select>
                    </div>
                </div><br>

                <div class="row form-group" align="center">
                    <button type="reset" class=" btn btn-primary" id="annuler">Annuler</button> 
                    <button type="button" id="valider" class=" btn btn-primary ">Valider</button>
                </div>
            </form>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery-2.3.1.min.js"></script>
            <script src="assets/js/groupe1/n_etudiant_classe.js"></script>
        </div>
    </body>
</html>
