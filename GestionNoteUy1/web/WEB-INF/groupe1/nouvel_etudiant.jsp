<%-- 
   author : groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Nouvel étudiant</title>
    </head>
    <body>
        <div class="container col-lg-5">
            <form method="post" class="row form-horizontal">
                <div id="success" class="has-success" style="display: none">
                    Etudiant correctement ajouté
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div class="form-group">
                    <label for="matricule">Matricule</label>
                    <input type="text" name="matricule" id="matricule" required="" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input type="text" name="nom" id="nom"  required="" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="prenom">Prénom</label>
                    <input type="text" name="prenom" id="prenom" required="" class="form-control"/>	
                </div>
                <div class="form-group">
                    <label for="datenaiss">Date de naissance</label>
                    <input type="date" name="datenaiss" id="datenaiss" required="" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="lieunais">Lieu de naissance</label>
                    <input type="text" name="lieunaiss" id="lieunaiss" required="" class="form-control"/>
                </div>
                <div class="form-group">

                    <label for="sexe">Sexe</label>
                    <select name="sexe" id="sexe" required="">
                        <option>F</option>
                        <option>M</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="numtel">Numero Telephone</label>
                    <input type="text" name="numtel" required="" id="numtel"   class="form-control" />
                </div> 
                <button type="reset">Annuler</button>
                <button type="submit" id="valider">Valider</button>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_etudiant.js"></script>
    </body>
</html>
