 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>

        <title>Acceuil Administration</title>
        <!-- end: Mobile Specific -->

  
            
            <div class="container col-lg-5">
                <form method="post" class=" row form-horizontal">
                    <div id="success" class="has-success" style="display:none">
                        <p>Enseignant correctement ajouté</p> 
                    </div>
                    <div id="error" class="has-error" style="display:none">
                        <p> Un problème est survenu lors de la sauvegarde</p>
                    </div>
                    <div class="row form-group" >
                        <div class="has-error" id="error" style="display: none">
                            <p>ce matricule existe</p>
                        </div>
                        <label for="matricule" class="control-label col-lg-2">Matricule</label> 
                        <div class="col-lg-10">
                            <input type="text" class="form-control" name="matricule" id="matricule" required="" class="form-control" />
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="nom" class="control-label col-lg-2">Nom</label>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" name="nom" id="nom" required="" />
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="prenom" class="control-label col-lg-2">Prénom</label>
                        <div class="col-lg-10">
                            <input type="text" name="prenom" id="prenom" required="" class="form-control"/>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="datenaiss" class="control-label col-lg-2">Date de naissance</label>
                        <div class="col-lg-10">
                            <input type="date" name="datenaiss" id="datenaiss" required="" class="form-control"/>
                        </div>
                    </div><br>	
                    <div class="row form-group">
                        <label for="lieunaiss" class="control-label col-lg-2">Lieu de naissance</label>
                        <div class="col-lg-10">
                            <input type="text" name="lieunaiss" id="lieunaiss"  required="" class="form-control"/>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="sexe" class="control-label col-lg-2">Sexe</label>
                        <div class="col-lg-10">
                            <select name="sexe" id="sexe" class="form-control" >
                                <option selected="selected">F</option>
                                <option>M</option>
                            </select>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="departement" class="control-label col-lg-2">departement</label>
                        <div class="col-lg-10">
                            <select name="departement" id="departement" class="form-control" >
                                 
                            </select>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="grade" class="control-label col-lg-10">Grade</label> 
                        <div class="col-lg-10">
                            <select name="grade" id="grade" class="form-control" >
                                <option selected="selected">Docteur</option>
                                <option>Maître de conférence</option>
                                <option>Professeur</option>
                                <option>Assistant</option>
                            </select>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="specialite" class="control-label col-lg-2">Spécialité</label>
                        <div class="col-lg-10">
                            <select class="form-control" name="specialite" id="specialite" >
                                <option>Genie logiciel</option>
                                <option>Anatomie moléculaire</option>
                                <option>Système d'information</option>
                                <option>Physique Quantique</option>
                                <option>Mathématiques discrète</option>
                            </select>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label for="numtel" class="control-label col-lg-2">Numero Telephone</label>
                        <div class="col-lg-10">
                            <input type="text" name="numtel" required="" id="numtel" class="form-control"/>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <button type="reset" class=" btn btn-primary" id="annuler">Annuler</button> 
                        <button type="submit" id="valider" class=" btn btn-primary ">Valider</button>
                    </div>
                </form>
            </div>

            <!-- start: JavaScript-->
            <script src="assets/js/groupe1/n_enseignant.js"></script>
           