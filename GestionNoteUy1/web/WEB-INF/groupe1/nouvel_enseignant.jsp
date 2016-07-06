<%-- 
    Author     : groupe 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Nouvel enseignant</title>
    </head>
    <body>
        <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvel enseignant</title>
    </head>
    <body>
      <div class="container col-lg-5">
        <form method="post" class=" row form-horizontal">
            <div id="success" class="has-success" style="display:none">
                <p>Enseignant correctement ajouté</p> 
            </div>
            <div id="error" class="has-error" style="display:none">
                <p> Un problème est survenu lors de la sauvegarde</p>
            </div>
            <div class="form-group">
                <label for="matricule">Matricule</label> 
                <input type="text" name="matricule" id="matricule" required="" class="form-control" />
            </div>
            <div class="form-group">
               <label for="nom">Nom</label>
               <input type="text" name="nom" id="nom" required="" />
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
            <label for="lieunaiss">Lieu de naissance</label>
            <input type="text" name="lieunaiss" id="lieunaiss"  required="" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="sexe">Sexe</label>
            <select name="sexe" id="sexe" >
                <option selected="selected">F</option>
                <option>M</option>
            </select>
        </div>
        <div class="form-group">
           <label for="grade">Grade</label> 
            <select name="grade" id="grade" >
                <option selected="selected">Docteur</option>
                <option>Maître de conférence</option>
                <option>Professeur</option>
                <option>Assistant</option>
            </select>
        </div>
        <div class="form-control">
           <label for="specialite">Spécialité</label>
            <select name="specialite" id="specialite" >
                <option>Genie logiciel</option>
                <option>Anatomie moléculaire</option>
                <option>Système d'information</option>
                <option>Physique Quantique</option>
                <option>Mathématiques discrète</option>
            </select>
        </div>
        <div class="form-group">
            <label for="numtel">Numero Telephone</label>
            <input type="text" name="numtel" required="" id="numtel" class="form-control"/>
        </div>  
        <button type="reset" class="pull-left btn">Annuler</button> 
        <button type="submit" id="valider" class="pull-left btn ">Valider</button>
        </form>
      </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_enseignant.js"></script>
    </body>
</html>
