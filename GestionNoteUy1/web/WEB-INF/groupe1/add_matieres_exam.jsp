<%-- 
  @author groupe1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Ajouter une matière à des examens</title>
    </head>
    <body>
     <div class="container col-lg-5">
      <form method="post" class="form-horizontal row">
        <div class="form-group">
            <label for="code">Matière</label>
            <select name="code" id="code">
            </select>
        </div>
        <div class="form-group">
	     <label for="examens">Cochez les examens</label>
             <select multiple="multiple" name="examens" id="examens">
             </select>
        </div>
          <button type="button">Annuler</button>
          <button type="submit" id="valider">Valider</button>
      </form>
     </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_matiere_exam.js"></script>
    </body>
</html>
