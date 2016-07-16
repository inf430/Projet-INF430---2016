<%-- 
    Document   : liste_etudiants
    Created on : 12 juil. 2016, 11:57:38
    Author     : Groupe 1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des étudiants</title>
    </head>
    <body>
        <div class="container row">
            <form class="row form-horizontal">
                <div class="row form-group">
                    <label class="control-label col-lg-3"  for="departement">Département</label> 
                    <div class="col-lg-9">
                        <select class="form-control" name="departement" id="departement" >
                            <option value="">--choisissez--</option>
                        </select>
                    </div>
                </div><br>

                <div class="row form-group">
                    <label class="control-label col-lg-3" for="filiere">Filière</label> 
                    <div class="col-lg-9">
                        <select class="form-control" name="filiere" id="filiere" >
                        </select>  
                    </div>
                </div><br>  
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="classe">Classe</label>
                    <div class="col-lg-9">
                        <select  name="classe" id="classe" >
                        </select>
                    </div>
                </div><br> 
            </form>
        </div>

        <div class="row container">
            <table class="display" width="100%" cellspacing="0" id="liste_etudiants">
                <thead>
                    <tr>
                        <th>Matricule</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Date de naissance</th>
                        <th>Lieu de naissance</th>
                        <th>Numéro de téléphone</th>
                        <th>Sexe</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
                <tfoot>

                </tfoot>
            </table>
        </div>

        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/liste_et.js"></script>
    </body>
</html>
