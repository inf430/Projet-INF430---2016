<%-- 
    Document   : liste_mat_ens
    Created on : 11 juil. 2016, 10:04:07
    Author     : Groupe 1
--%>

<%@page import="entities.Enseignant"%>
<%@page import="java.util.List"%>
<%@page import="entities.EnseignantMat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Matieres enseignant</title>
    </head>
    <body>
        <div class="container col-lg-10">
            <table class="table table-bordered table-striped table-responsive"/>
            <caption> Vos matières </caption>
                <tr>
                    <th>Code</th>
                    <th>Libellé</th>
                    <th>Classe</th>
                </tr>
                <%
                    List<EnseignantMat> liste_em = (List<EnseignantMat>) request.getAttribute("liste_mat_ens");
                    
                    try{ liste_em.get(0);
                    for(EnseignantMat em : liste_em){
                        out.println("<tr class=\"active\">" + "<td>" + em.getIdmatiere().getCode() + " </td>" + "<td>" + em.getIdmatiere().getLibelle() + "</td> </tr>");
                    }
                    } catch(Exception e) {
                         out.println("<tr><td>Vous n'avez aucune matière</td></tr>");
                    }
                             
                %>
            </table>
        </div>
    </body>
</html>
