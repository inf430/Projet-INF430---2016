<%-- 
  author : groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <link rel="stylesheet" href="assets/css/jquery-ui.css"/>
        <title>Donner un droit à une personne</title>
        
        <style>
            .errordate{
                border: 1px solid #ff0000 !important;
            }
        </style>
    </head>
    <body>
        <div class="container col-lg-5">
            <form method="get" class="row form-horizontal">
                <div id="success" class="has-success" style="display: none">
                    Droit correctement associé
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div class="form-group">
                    <label for="login">Nom de la personne</label>
                    <input list="valeurs" type="text" name="login" id="login" class="form-control">
                    <datalist id="valeurs"><option value="rien">Aucun choix</option></datalist>
                </div>
                <div class="form-group">
                    <label for="droit">Droit:</label>
                    <select name="droit" id="droit" class="form-control"></select>
                </div>
                <div id="error-debut" style="display: none;color: red;">
                    Erreur sur le format format: dd-mm-AAAA
                </div>
                <div class="form-group">
                    <label for="debut">Date de début</label>
                    <input type="date" name="debut" id="debut" class="form-control"/>
                </div>
                <div id="error-fin" style="display: none;color: red;">
                    Erreur sur le format format: dd-mm-AAAA
                </div>
                <div class="form-group">
                    <label for="fin">Date de fin</label>
                    <input type="date" name="fin" id="fin" class="form-control"/>
                </div>
                <div id="error-debfin" style="display: none;color: red;">
                    Erreur la date de debut doit être plus petite
                </div>
                <br />
                <div id="error-attr" style="display: none;color: red;">
                    Cette attribution de droit a déjà été faite
                </div>
                <button type="reset" class="btn btn-primary">Annuler</button>
                <button type="submit" id="valider" class="btn btn-primary">Valider</button>
            </form>
        </div>

        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/jquery-ui.js"></script>
        <script src="assets/js/groupe1/n_associate_right_person.js"></script>
    </body>
</html>
