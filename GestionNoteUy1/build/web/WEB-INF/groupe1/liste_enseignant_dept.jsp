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
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Ajouter Matieres à un Enseignant</title>
    </head>
    <body>
        <div class="container row">
            <form class="row form-horizontal">
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="deps">Departement</label>
                    <div class="col-lg-9">
                        <select name="departement" class="form-control" id="departements">
                            <option value='departement'>aucune selection</option>
                        </select> 
                    </div>
                </div><br>
            </form>   
            <table class="display" cellspacing="0" width="100%" id="liste_enseignants">
                <thead>
                        <th>Matricule</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                </thead>
                <tbody id="enseignant">

                </tbody>
                <tfoot>

                </tfoot>
            </table>
        </div>
       
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/liste_enseignant_dept.js"></script>
        <script>
         $(document).ready(function(){
           $('#liste_enseignants').dataTable();  
         });   
        </script>
    </body>
</html>
