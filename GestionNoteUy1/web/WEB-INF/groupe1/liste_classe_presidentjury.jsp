<%-- 
    Document   : liste_classe_presidentjury
    Created on : 11 juil. 2016, 14:23:39
    Author     : Groupe 1
--%>

<%@page import="java.util.List"%>
<%@page import="entities.EnseignantClasseJury"%>
<%@page import="entities.Enseignant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Liste classes president jury</title>
    </head>
    <body>
        <div class="container col-lg-10">
            <table class="table table-bordered table-striped table-responsive"/>
            <caption> Classes où vous êtes président de jury </caption>
                <tr>
                    <th>Nom</th>
                </tr>
                <%
                    List<EnseignantClasseJury> liste_ej = (List<EnseignantClasseJury>) request.getAttribute("liste_classes_ens");
                    
                    try{ liste_ej.get(0);
                    for(EnseignantClasseJury ej : liste_ej){
                        out.println("<tr class=\"active\">" + "<td>" + ej.getIdclasse().getNom() + " </td>" + " </tr>");
                    }
                    } catch(Exception e) {
                         out.println("<tr><td>Vous n'êtes président de jury dans aucune classe</td></tr>");
                    }
                             
                %>
            </table>
        </div>
    </body>
</html>
