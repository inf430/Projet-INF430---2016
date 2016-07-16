<%-- 
    Document   : liste_matieres
    Created on : 11 juil. 2016, 19:16:57
    Author     : Groupe 1
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Matiere"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des matières</title>
    </head>
    <body>
        <div class="container col-lg-10">
            <table class="display" id="liste_matiere" cellspacing="0" width="100%"/>
            <thead>  
                <tr>
                    <th>Code</th>
                    <th>Libelle</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Matiere> liste_m = (List<Matiere>) request.getAttribute("liste_m");

                    try {
                        liste_m.get(0);
                        for (Matiere m : liste_m) {
                            out.println("<tr>" + "<td>" + m.getCode() + "</td> <td>" + m.getLibelle() + "</td> </tr>");
                        }
                    } catch (Exception e) {
                        out.println("<tr><td>Aucune matière</td></tr>");
                    }

                %>
            </tbody>
        </table>
    </div>
</body>
<script src="assets/js/groupe1/jquery.js"></script>
<script>
    $(document).ready(function () {
        $('#liste_matiere').dataTable(
                {
                    "scrollY": 370,
                    "scrollX": true
                });
        });
</script>
</html>
