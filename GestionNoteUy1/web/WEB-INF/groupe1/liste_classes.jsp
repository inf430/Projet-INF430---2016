<%-- 
    Document   : liste_classes
    Created on : 11 juil. 2016, 18:54:52
    Author     : Groupe 1
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Classe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste classes</title>
    </head>
    <body>
        <div class="container">
            <table class="display" cellspacing="0" width="100%" id="listes_classes">
                <thead>
                    <tr>
                        <th>Nom</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Classe> liste_c = (List<Classe>) request.getAttribute("liste_cl");

                        try {
                            liste_c.get(0);
                            for (Classe c : liste_c) {
                                out.println("<tr class=\"active\">" + "<td>" + c.getNom() + "</td> </tr>");
                            }
                        } catch (Exception e) {
                            out.println("<tr><td>Aucune classe</td></tr>");
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
                $('#listes_classes').dataTable();
            });
        </script>
    </body>
</html>
