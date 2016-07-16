<%-- 
    @author groupe1
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Droit"%>
<%@page import="entities.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des Droits </title>
    </head>
    <body>


        <div class="container">
            </div>
            <table class ="display" cellspacing="0" width="100%" id="liste_droits">
                <thead>
                    <tr>
                        <th id="droi">droit </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Droit> droitListe = (List<Droit>) request.getAttribute("listeDroit");
                            for (Droit droit : droitListe) {
                                out.println("<tr>");
                                out.println("<td>" + droit.getNom() + "</td>");
                                out.println("</tr>");
                            }

                    %>
                </tbody>
                <tfoot>
                    
                </tfoot>
            </table>
        </div>
            <script src="assets/js/jquery-1.9.1.min.js"></script>
            <script src = "assets/js/bootstrap-multiselect.js" ></script>
            <script>
                $(document).ready(function(){
                  $('#liste_droits').dataTable();  
                });
            </script>
    </body>
</html>
