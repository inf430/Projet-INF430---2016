<%-- 
   auteur : groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Nouvel administratif</title>
    </head>
    <body>
        <div class="container col-lg-5">
            <form method="post" class="form-horizontal row">
                <div id="success" class="has-success" style="display:none">
                    <p>Administratif correctement ajouté</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <input type="text" name="nom" id="nom" required=""/>
                </div>
                <div class="form-group">
                    <label for="prenom">Prénom</label>
                    <input type="text" name="prenom" id="prenom" required="" />
                </div>
                <div class="form-group">
                    <label for="datenaiss">Date de naissance</label>
                    <input type="date" name="datenaiss" id="datenaiss" required="" />
                </div>
                <div class="form-group">
                    <label for="lieunaiss">Lieu de naissance</label>
                    <input type="text" name="lieunaiss" id="lieunaiss" required="" />
                </div>
                <div class="form-group">
                    <label for="sexe">Sexe</label>
                    <select name="sexe" id="sexe">
                        <option>F</option>
                        <option>M</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="login">Login</label>
                    <input type="text" name="login" id="login" readonly />
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <input type="text" name="password" id="password" readonly />
                </div>
                <div class="form-group">
                    <label for="numtel">Numero Telephone</label>
                    <input type="text" name="numtel" required="" id="numtel" class="form-control"/>
                </div> 
                <button class="btn" type="reset">Annuler</button>
                <button class="btn" type="submit" id="valider">Valider</button>
            </form>
        </div>
    </body>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/groupe1/n_administratif.js"></script>
</html>
