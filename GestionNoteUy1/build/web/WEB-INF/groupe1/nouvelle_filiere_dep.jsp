<%-- 
    Document   : nouvelle_filiere_dep
    Created on : 4 juil. 2016, 07:17:54
    Author     : Groupe 1
--%>

<%@page import="entities.Departement"%>
<%@page import="java.util.List"%>
<%@page import="entities.Filiere"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Nouvelle filière</title>
    </head>
    <body>
        <div class="container row">
            <button id="ajouter_fil" type="button" class="btn btn-primary">Ajouter des filières</button>
            <div id="m_form" style="display: none">
                <form  method="post" class="row form-horizontal" >
                    <div id="success" class="has-success" style="display: none">
                        Filière correctement ajoutée
                    </div>
                    <div id="error" class="has-error" style="display: none">
                        Un problème est survenu lors de la sauvegarde
                    </div>
                    <div id="exist" style="display:none">
                        Une filière porte déjà ce code
                    </div>
                    <div class="row form-group">
                        <label class="control-label col-lg-3" for="code">Code de la filière</label>
                        <div class="col-lg-9">
                            <input type="text" name="code" id="code" required class="form-control"/>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <label class="control-label col-lg-3" for="libelle">Libellé de la filiere</label>
                        <div class="col-lg-9">
                            <input type="text" name="libelle" id="libelle" required class="form-control"/>
                        </div>
                    </div><br>
                    <div class="row form-group">
                        <input class="form-control" type="text" name="iddep" id="iddep" value="${iddep}" style="display: none" />
                    </div><br>
                    <div class="row form-group" align="center"> 
                        <button type="reset" class="btn btn-primary" >Annuler</button>
                        <button type="submit" id="valider" class="btn btn-primary">Valider</button>
                    </div>
                </form>
            </div>
            <table class="display" cellspacing="0" width="100%" id="liste">
                <caption>Filières du département <% Departement dep = (Departement) request.getAttribute("departement");
                    out.println(dep.getLibelle()); %></caption>
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Libellé</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Filiere> liste_f = (List<Filiere>) request.getAttribute("liste_filieres");
                        for (Filiere f : liste_f) {
                            out.println("<tr>" + "<td>" + f.getCode() + " </td>" + "<td>" + f.getLibelle() + "</td> </tr>");
                        }


                    %>
                </tbody>
                <tfoot>

                </tfoot>
            </table>
        </div>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_filiere_dep.js"></script>
        <script>
            $(document).ready(function () {
                $('#liste').dataTable();
            });
        </script>

    </body>
</html>
