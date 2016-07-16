<%-- 
    Document   : liste_niveaux
    Created on : 11 juil. 2016, 18:29:29
    Author     : Groupe 1
--%>

<%@page import="entities.Niveau"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des niveaux</title>
    </head>
    <body>
        <div class="container">
            <table class="display" cellspacing="0" width="100%" id="liste_niveaux"/>
            <thead>
            <th>Niveau</th>
        </thead>
        <tbody>
            <%
                List<Niveau> liste_n = (List<Niveau>) request.getAttribute("liste_niv");

                try {
                    liste_n.get(0);
                    for (Niveau n : liste_n) {
                        out.println("<tr class=\"active\">" + "<td>" + n.getNiveau() + "</td> </tr>");
                    }
                } catch (Exception e) {
                    out.println("<tr><td>Aucun niveau</td></tr>");
                }

            %>
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script>
    $(document).ready(function () {
        $('#liste_niveaux').dataTable();
    });
</script>
</body>
</html>
