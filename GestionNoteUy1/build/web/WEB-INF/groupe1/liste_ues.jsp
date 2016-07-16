<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des UEs par Classe</title>
    </head>
    <body>
    <center>  
        <div class="container row">
                <form class="row form-horizontal">
                    <div class="row form-group">
                        <label class="control-label col-lg-3" for="departement">Département</label>
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
                            <select class="form-control"  name="classe" id="classe" >
                            </select>
                        </div>
                    </div>
                </form>
        </div>


        <div class="container">
            <table class="display" cellspacing="0" width="100%" id="liste_ue">
                <thead>
                <th>Code</th>
                <th>Libelle</th>
                </thead>
                <tbody id="ueliste">

                </tbody>
                <tfoot>

                </tfoot>
            </table>
        </div>
    </center>
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/groupe1/n_liste_ue.js"></script>
    <script>
        $(document).ready(function () {
            $('#liste_ue').dataTable({"ScrollX": 300, "ScrollY": true});
        });
    </script>
</body>
</html>




