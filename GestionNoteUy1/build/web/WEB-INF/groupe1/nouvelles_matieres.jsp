<%-- 
  @author : groupe1
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entities.Matiere"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Nouvelles matières</title>
    </head>
    <body>


        <div class="container col-lg-8">
            <button id="list_mat_ajout" type="button" class="btn btn-primary">Ajouter une matiere</button>
            <div id="ajouter" class="is_ajouter"style="display:none">
                <form method="post" class="form_ajout_class">
                    <div id="success" class="has-success" style="display:none">
                        Matiere correctement ajoutée à l'UE
                    </div>
                    <div id="error" class="has-error" style="display:none">
                        Un problème est survenu lors de l'ajout
                    </div>
                    <% out.println("<input value=\"" + request.getAttribute("ue") + "\" type=\"hidden\" id=\"code\" />"); %>
                    <div id="erreur-mat" style="display: none">
                        Cette matière est déjà associée à cette Ue
                    </div>
                    <div class="form-group">
                        <label for="examens">Matière</label>
                        <select name="matiere" id="matiere">
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="credit">Credit</label>
                        <input type="number" name="credit" id="credit" required="" class="form-control"/>
                    </div> 

                    <button type="reset" class="btn btn-primary">Annuler</button>
                    <button type="button" class="btn btn-primary" id="valider">Valider</button>
                </form>
            </div>
            <table class ="table table-bordered table-striped tablecondensed" >
                <caption>Matieres de l'UE <% out.println(request.getAttribute("ue")); %></caption>
                <thead>
                    <tr>
                        <th id="codeMat">code</th>
                        <th id="libelleMat">Libele</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Matiere> listeMatiere = (ArrayList<Matiere>) request.getAttribute("listeMatiere");
                        if (listeMatiere.size() == 0) {
                                out.println("<tr>");
                                out.println("<td> Aucune matière enrégistrée pour l'instant dans cette UE</td>");
                                out.println("</tr>");
                        } else {
                            for (Matiere matiere : listeMatiere) {
                                out.println("<tr>");
                                out.println("<td>" + matiere.getCode() + "</td>");
                                out.println("<td>" + matiere.getLibelle() + "</td>");
                                out.println("</tr>");
                            }
                        }

                    %>
                </tbody>
            </table>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_nouvelles_matieres.js"></script>
    </body>
</html>
