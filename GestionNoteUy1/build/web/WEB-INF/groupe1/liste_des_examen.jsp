<%-- 
   @author groupe1
--%>

<%@page import="entities.Examen"%>
<%@page import="java.util.List"%>
<%@page import="entities.EnseignantMat"%>
<%@page import="entities.EnseignantMat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Matiere"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des examens </title>
    </head>
    <body>
        <div class="container">
            <table class ="display" cellspacing="0" width="100%" id="liste_examens" >
                <thead>
                        <th>date examen</th>
                        <th>type examen</th>
                </thead>
                <tbody>
                    <%
                        List<Examen> examenListe = (List<Examen>) request.getAttribute("listeExamen");
                        if (examenListe.size() == 0) {
                                out.println("<tr>");
                                out.println("<td> Aucun examen enrégistré pour l'instant</td>");
                                out.println("</tr>");
                        } else {
                            for (Examen examen1 : examenListe) {
                                out.println("<tr>");
                                out.println("<td>" + examen1.getDateExam() + "</td>");
                                out.println("<td>" + examen1.getTypeExam() + "</td>");
                                out.println("</tr>");
                            }
                        }

                    %>
                </tbody>
            </table>
        </div>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/n_nouvelles_matieres.js"></script>
        <script>
            $(document).ready(function(){
              $('#liste_examens').dataTable(); 
            });
        </script>
    </body>
</html>
