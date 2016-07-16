<%-- 
   auteur : groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Nouvel administratif</title>
 
        <div class="container row">
            <form method="post" class="form-horizontal row">
                <div id="success" class="has-success" style="display:none">
                    <p>Administratif correctement ajouté</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="nom">Nom</label>
                    <div class="col-lg-9" >
                        <input class="form-control" type="text" name="nom" id="nom" required=""/>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3"  for="prenom">Prénom</label>
                    <div class="col-lg-9" >
                    <input class="form-control" type="text" name="prenom" id="prenom" required="" />
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3"  for="datenaiss">Date de naissance</label>
                    <div class="col-lg-9" >
                    <input class="form-control" type="date" name="datenaiss" id="datenaiss" required="" />
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3"  for="lieunaiss">Lieu de naissance</label>
                    <div class="col-lg-9" >
                    <input class="form-control" type="text" name="lieunaiss" id="lieunaiss" required="" />
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3"  for="sexe">Sexe</label>
                    <div class="col-lg-9" >
                    <select class="form-control" name="sexe" id="sexe">
                        <option>F</option>
                        <option>M</option>
                    </select>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="login">Login</label>
                    <div class="col-lg-9" >
                    <input class="form-control" type="text" name="login" id="login" readonly />
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="password">Mot de passe</label>
                    <div class="col-lg-9" >
                        <input class="form-control" type="text" name="password" id="password" readonly="true" />
                    </div>
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3"  for="numtel">Numero Telephone</label>
                    <div class="col-lg-9" >
                        <input class="form-control" type="text" name="numtel" required="" id="numtel" />
                    </div>
                </div>
                <div class="row form-group" align="center">
                <button class="btn btn-primary" type="reset">Annuler</button>
                <button class="btn btn-primary" type="submit" id="valider">Valider</button>
                </div>
            </form>
        </div>
    <script src="assets/js/groupe1/n_administratif.js"></script>

