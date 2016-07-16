<%-- 
  @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter une matière à des examens</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="form-horizontal row">
                <div class="row form-group">
                    <fieldset><center>association de matieres aux examens</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display:none">
                    <p>Nouvelle association matière-examen faite</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div id="erreur-assoc" style="display:none">
                    Cet examen est déjà associé à cette matière
                </div>
                <div class="row form-group">
                    <label class='control-label col-lg-3' for="matiere">Matière</label>
                    <div class="col-lg-9">
                        <select class="form-control" name="matiere" id="matiere">
                        </select>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class='control-label col-lg-3' for="examen">Examen</label>
                    <div class="col-lg-9">
                        <select class='form-control' id="examen">
                        </select>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="pourcentage">Pourcentage</label>
                    <div class="col-lg-9">
                        <input type="number" name="pourcentage" id="pourcentage" required="" class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group" align='center'>
                    <button class="btn btn-primary" type="button">Annuler</button>
                    <button class="btn btn-primary" type="submit" id="valider">Valider</button>
                </div><br>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-2.3.1.min.js"></script>
        <script src="assets/js/groupe1/n_matiere_exam.js"></script>
    </body>
</html>
