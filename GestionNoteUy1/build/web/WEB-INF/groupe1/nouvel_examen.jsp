<%-- 
   @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvel examen</title>
    </head>
    <body>
        <div class="container row">
            <form method="post" class="form-horizontal row">
                <div class="row form-group">
                    <fieldset><center>nouvel examen</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display:none">
                    <p>Examen correctement ajouté</p> 
                </div>
                <div id="error" class="has-error" style="display:none">
                    <p> Un problème est survenu lors de la sauvegarde</p>
                </div>
                <div id="exist" style="display: none">
                    Un tel examen existe déjà dans le système
                </div>
                <div class="row form-group">
                    <label class="control-label" for="type">Type</label>
                    <div class="col-lg-9">
                        <input type="text" name="type" id="type" required="" class="form-control">
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="dateexam">Date Examen</label>
                    <div class="col-lg-9">
                        <input type="date" name="dateexam" id="dateexam" class="form-control" required=""/>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button class="btn btn-primary" type="reset">Annuler</button>
                    <button class="btn btn-primary" type="submit" id="valider">Valider</button>
                </div><br>
            </form>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery-1.9.1.min.js"></script>
            <script src="assets/js/groupe1/n_examen.js"></script>
        </div>
    </body>
</html>
