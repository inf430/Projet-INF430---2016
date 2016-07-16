<%-- 
   author : groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<html>
    <head>-->
        <title>Nouvel étudiant</title>
    <!--</head>
    <body>--
        <!--<div id="content" class="span10">-->
            <div class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header" data-original-title>
                        <h2><i class="halflings-icon picture"></i><span class="break"></span>AJOUT D'UN Etudiant</h2>
                        <div class="box-icon">
                            <a href="#" id="toggle-fullscreen" class="hidden-phone hidden-tablet"><i class="halflings-icon fullscreen"></i></a>
                            <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                            <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                        </div>
                    </div>
                    <div class="box-content">
                    <div class="container col-lg-5">
                            <form method="post" class="row form-horizontal">
                                <div id="success" class="has-success" style="display: none">
                                    Etudiant correctement ajouté
                                </div>
                                <div id="error" class="has-error" style="display: none">
                                    Un problème est survenu lors de la sauvegarde
                                </div>
                                <div class="row form-group">
                                    <div class="has-error" id="error-matricule" style="display: none">
                                        <p>ce matricule existe</p>
                                    </div>
                                    <label for="matricule" class="control-label col-lg-2">Matricule</label>
                                    <div class="col-lg-10">
                                        <input type="text" name="matricule" id="matricule" required="" class="form-control"/>
                                    </div>
                                </div><br>
                                <div class="row form-group">
                                    <label for="nom" class="control-label col-lg-2">Nom</label>
                                    <div class="col-lg-10">
                                        <input type="text" name="nom" id="nom"  required="" class="form-control"/>
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
                                    <label for="lieunais" class="control-label col-lg-2">Lieu de naissance</label>
                                    <div class="col-lg-10">
                                        <input type="text" name="lieunaiss" id="lieunaiss" required="" class="form-control"/>
                                    </div>
                                </div><br>
                                <div class="row form-group">

                                    <label for="sexe" class="control-label col-lg-2">Sexe</label>
                                    <select name="sexe" id="sexe" required="" class="form-control">
                                        <option>F</option>
                                        <option>M</option>
                                    </select>
                                </div><br>
                                <div class="row form-group">
                                    <label for="numtel" class="control-label col-lg-2">Numero Telephone</label>
                                    <div class="col-lg-10">
                                        <input type="text" name="numtel" required="" id="numtel"   class="form-control" />
                                    </div>
                                </div><br>
                                <div class="row form-group">
                                    <button type="reset" class="btn btn-primary">Annuler</button>
                                    <button type="submit" id="valider" class="btn btn-primary">Valider</button>
                                </div><br>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_etudiant.js"></script>
 
