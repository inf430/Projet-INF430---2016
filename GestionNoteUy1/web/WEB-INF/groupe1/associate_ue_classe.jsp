<%-- 
    Document   : associate_ue_classe
    Created on : 10 juil. 2016, 00:05:01
    Author     : Groupe 1
--%>

<%@page import="entities.Classe"%>
<%@page import="java.util.List"%>
<%@page import="entities.Ue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Associer une Ue à une classe</title>
    </head>
    <body>
        <div class="container row">

            <form method="post" class="row form-horizontal">
                <div class="row form-group">
                    <fieldset><center>ue-classe</center></fieldset>
                </div><br>
                <div id="success" class="has-success" style="display: none">
                    Ue correctement associée à la classe
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display:none">
                    Cette matière et cette Ue sont déjà associées pour l'année courante
                </div>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="codeue">UE</label>
                    <div class="col-lg-9">
                        <select name="codeue" id="codeue" required class="form-control">
                            <%
                                List<Ue> liste_u = (List<Ue>) request.getAttribute("liste_ues");
                                for (Ue u : liste_u) {
                                    out.println("<option value=\"" + u.getCode() + "\">" + u.getCode() + "</option> </tr>");
                                }
                            %>
                        </select>
                    </div>
                </div><br>
                <div class="row form-group">
                    <label class="control-label col-lg-3" for="idclasse">Classe</label>
                    <div class="col-lg-9">
                        <select name="idclasse" id="idclasse" required class="form-control">
                            <%
                                List<Classe> liste_c = (List<Classe>) request.getAttribute("liste_classes");
                                for (Classe c : liste_c) {
                                    out.println("<option value=\"" + c.getIdclasse() + "\">" + c.getNom() + "</option> </tr>");
                                }
                            %>
                        </select>
                    </div>
                </div><br>
                <div class="row form-group" align="center">
                    <button type="reset" class="btn btn-primary" id="reset">Annuler</button>
                    <button type="submit" class="btn btn-primary" id="valider">Valider</button>
                </div>
            </form>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/associate_ue_classe.js"></script>
    </body>
</html>
