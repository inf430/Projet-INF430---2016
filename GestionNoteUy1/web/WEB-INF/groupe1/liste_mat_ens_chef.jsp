<%-- 
    Document   : liste_mat_ens_chef
    Created on : 12 juil. 2016, 00:23:44
    Author     : Groupe 1
--%>

<%@page import="entities.MatiereUe"%>
<%@page import="entities.Classe"%>
<%@page import="entities.EnseignantMat"%>
<%@page import="entities.Enseignant"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.css"/>
        <title>Liste des matières de l'enseignant</title>
    </head>
    <body>
        <div class="container col-lg-10">
            <button id="ajouter_fil" class="btn btn-primary">Ajouter une matière à cet enseignant</button><br/>
            <form  method="post" class="row form-horizontal" style="display: none" id="m_form">
                <div id="success" class="has-success" style="display: none">
                    Matière correctement affectée à l'enseignant
                </div>
                <div id="error" class="has-error" style="display: none">
                    Un problème est survenu lors de la sauvegarde
                </div>
                <div id="exist" style="display: none">
                    Cette matière est déjà enseignée par cet enseignant
                </div>
                <div class="form-group">
                    <label for="idmatiere">Code de la matière</label>
                    <select name="idmatiere" id="idmatiere" required class="form-control">
                    <%
                        List<MatiereUe> liste_m = (List<MatiereUe>) request.getAttribute("liste_matieres");
                        for(MatiereUe m : liste_m){
                            out.println("<option value=\"" + m.getIdmatiere().getIdmatiere() + "\">" + m.getIdmatiere().getLibelle() + " (" + m.getIdmatiere().getCode() + ")</option> </tr>");
                        }
                    %>
                    </select>
                </div>
                
                <input type="text" name="matricule" id="matricule" value="${mat}" style="display: none" />
                <button type="reset" class="btn btn-primary">Annuler</button>
                <button type="submit" id="valider" class="btn btn-primary">Valider</button>
            </form>
            <table class="table table-bordered table-striped table-responsive"/>
            <caption> Matières de l'enseignant <% Enseignant ens = (Enseignant)request.getAttribute("ens"); out.println(" " + ens.getIdpersonne().getNom() + " " + ens.getIdpersonne().getPrenom() + " (" + ens.getMatricule() + ")"); %> </caption>
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
                         out.println("<tr><td>Cet enseignant n'a aucune matière</td></tr>");
                    }
                             
                %>
            </table>
        </div>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/groupe1/associate_mat_ens_chef.js"></script>
    </body>
</html>
