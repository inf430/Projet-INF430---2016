<%-- 
  @author groupe1
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Departement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/groupe1/jquery.dataTables.css"/>
        <link rel="stylesheet" href="assets/css/groupe1/groupe1.css"/>
        <title>Liste des Departement </title>
    </head>
    <body>


        <div class="container">
        <table class ="display" cellspacing="0" width="100%" id="liste_departements" >
            <thead>
                <tr>
                    <th id="codedept">code </th>
                    <th id="libelledept">libelle </th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Departement> departListe = (List<Departement>) request.getAttribute("listeDepartement");
                    if (departListe.size() == 0) {
                        out.println("<tr>");
                        out.println("<td> Aucun departement  enrégistrée pour l'instant dans cette UE</td>");
                        out.println("</tr>");
                    } else {
                        for (Departement depart : departListe) {
                            out.println("<tr>");
                            out.println("<td><a href=\"nouvellefilieredep?menu=nouvelle_filiere&iddep=" + depart.getIddepartement() + "\">" + depart.getCode() + "</a></td>");
                            out.println("<td>" + depart.getLibelle() + "</td>");
                            out.println("</tr>");
                        }
                    }

                %>
            </tbody>
        </table>
    </div>
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script src = "assets/js/bootstrap-multiselect.js" ></script>
<script>
    $(document).ready(function(){
        $('#liste_departements').dataTable();
    });
</script>
</body>
</html>
