<%-- 
    Document   : add_classe
    Created on : 9 juil. 2016, 22:23:37
    Author     : Groupe 1
--%>

<%@page import="entities.Niveau"%>
<%@page import="java.util.List"%>
<%@page import="entities.Filiere"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nouvelle classe</title>
    </head>
    <body>
        <div class="container row">

            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>nouvelle classe</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Classe correctement ajoutée
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display: none">
                    Une classe de même nom existe déjà
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="idfiliere">Filière</label>
                    <div class="col-lg-9">
                        <select name="idfiliere" id="idfiliere" required class="form-control"> 
                            <%
                                List<Filiere> liste_f = (List<Filiere>) request.getAttribute("liste_filieres");
                                for (Filiere f : liste_f) {
                                    out.println("<option value=\"" + f.getIdfiliere() + "\">" + f.getCode() + "</option> </tr>");
                                }
                            %>
                        </select>
                    </div>
                </div><br>
                <div class="row form-group">

                    <label class="control-label col-lg-3" for="niveau">Niveau</label>
                    <div class="col-lg-9">
                        <select name="niveau" id="niveau" required class="form-control">
                            <%
                                List<Niveau> liste_n = (List<Niveau>) request.getAttribute("liste_niveaux");
                                for (Niveau n : liste_n) {
                                    out.println("<option value=\"" + n.getNiveau() + "\">" + n.getNiveau() + "</option> </tr>");
                                }
                            %>
                        </select>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="nom">Nom</label>
                    <div class="col-lg-9">
                        <input type="text" name="nom" id="nom" required class="form-control"/>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                <button type="reset" class="btn btn-primary">Annuler</button>
                <button type="submit" id="valider" class="btn btn-primary">Valider</button>
                </div>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_classe.js"></script>
    </body>
</html>
