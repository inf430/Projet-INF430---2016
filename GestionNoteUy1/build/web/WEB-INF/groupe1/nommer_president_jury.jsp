<%-- 
    Document   : nommer_president_jury
    Created on : 11 juil. 2016, 22:07:25
    Author     : Groupe 1
--%>

<%@page import="entities.Classe"%>
<%@page import="java.util.List"%>
<%@page import="entities.Enseignant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Nommer un président de jury</title>
    </head>
    <body>
        <div class="container col-lg-5">
            
            <form method="post" class="row form-horizontal">
                <div id="success" class="has-success" style="display: none">
                    Président de jury correctement nommé
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display:none">
                    L'enseignant en question est déjà président de jury de cette classe
                </div>
                <div class="form-group">
                    <label for="matricule">Enseignant</label>
                    <input name="matricule" id="matricule" required="" list="matricules"/>
                    <datalist id="matricules">
                    <%
                        List<Enseignant> liste_ens = (List<Enseignant>) request.getAttribute("liste_ens");
                        for(Enseignant ens : liste_ens){
                            out.println("<option value=\"" + ens.getMatricule() + "\">" + ens.getIdpersonne().getNom() + ' ' + ens.getIdpersonne().getPrenom() + "</option> </tr>");
                        }
                    %>
                    </datalist>
                </div>
                <div class="form-group">
                    <label for="idclasse">Classe</label>
                    <select name="idclasse" id="idclasse" required class="form-control">
                    <%
                        List<Classe> liste_c = (List<Classe>) request.getAttribute("liste_classes");
                        for(Classe c : liste_c){
                            out.println("<option value=\"" + c.getIdclasse() + "\">" + c.getNom() + "</option> </tr>");
                        }
                    %>
                    </select>
                </div>
                <button type="reset">Annuler</button>
                <button type="submit" id="valider">Valider</button>
            </form>
       </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/nommer_president_jury.js"></script>
    </body>
    </body>
</html>
