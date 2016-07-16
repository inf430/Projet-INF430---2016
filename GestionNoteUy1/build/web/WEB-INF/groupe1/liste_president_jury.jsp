<%-- 
    @author groupe1
--%>

<%@page import="java.util.Vector"%>
<%@page import="entities.EnseignantClasseJury"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste president de Jury</title>
    </head>
    <body>
        <table class ="table table-bordered table-striped tablecondensed" >
                <caption>President de Jury du Département</caption>
                <thead>
                    <tr>
                        <th id="matricule">Matricule</th>
                        <th id="idclasse">Classe</th>
                        <th id="annee">Annee</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Vector<EnseignantClasseJury> liste_president_jury = (Vector<EnseignantClasseJury>) request.getAttribute("liste_president_jury");
                        if (liste_president_jury.size() == 0) {
                                out.println("<tr>");
                                out.println("<td> Aucun Président de Jury enregistré</td>");
                                out.println("</tr>");
                        } else {
                            for (EnseignantClasseJury ens : liste_president_jury) {
                                out.println("<tr>");
                                out.println("<td>" + ens.getMatricule().getMatricule() + "</td>");
                                out.println("<td>" + ens.getIdclasse().getNom() + "</td>");
                                out.println("<td>" + ens.getAnnee().getAnnee() + "</td>");
                                out.println("</tr>");
                            }
                        }

                    %>
                </tbody>
            </table>
    </body>
</html>
