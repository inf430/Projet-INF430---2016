<%-- 
    @author groupe1
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des Roles </title>
    </head>
    <body>


        <div class="container">
            <table class ="display" cellspacing="0" width="100%" id="liste_roles" >
                <thead>
                    <tr>
                        <th id="role">role </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Role> roleListe = (List<Role>) request.getAttribute("listeRole");
                            for (Role role : roleListe) {
                                out.println("<tr>");
                                out.println("<td>" + role.getRole() + "</td>");
                                out.println("</tr>");
                            }%>
                </tbody>
            </table>
        </div>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src = "assets/js/bootstrap-multiselect.js" ></script>
        <script>
            $(document).ready(function(){
              $('#liste_roles').dataTable();  
            });
        </script>
    </body>
</html>
