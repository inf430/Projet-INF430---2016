<%@page import="entities.Departement"%>
<%@page import="entities.UeClasse"%>
<%@page import="entities.MatiereUe"%>
<%@page import="entities.Ue"%>
<%@page import="entities.Filiere"%>
<%@page import="entities.Niveau"%>
<%@page import="java.util.Vector"%>
<%@page import="entities.Classe"%> 
<%@page import="entities.AnneeAcademique"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <jsp:include page="../../header.jsp"></jsp:include>
            <!-- start: Header -->

            <div class="container-fluid-full">
                <div class="row-fluid">
                    <!-- start: Main Menu -->
             
                <!-- start: Content -->
                <div id="content" class="span10" style="background-color:#149bdf">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="#">Acceuil</a> 
                            <i class="icon-angle-right"></i>
                            <% String p = (String) session.getAttribute("type");
                                if (p != null) {
                                    if (p.equals("etudiant")) {
                                        out.print("Etudiant");
                                    } else if (p.equals("enseignant")) {
                                        out.print("enseignant");
                                    } else {
                                        out.print("personnel administratif");
                                    }
                                }
                            %>

                        </li>
                    </ul>                        

                    <!--modal-->
                    <div class="modal fade" id="infos" tabindex="-1" role="dialog" 
                         aria-labelledby="myModalLabel" aria-hidden="true" >
                        <div class="modal-dialog" >
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close"
                                            data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" align="center">
                                        <strong>Consulter</strong>
                                    </h4>
                                </div>

                                <div class="modal-body">
                                    <form method="post" action="consulterDecanat">
                                        <table>
                                            <tr style="margin-top: 10px">
                                                <td style="margin-right: 30px">
                                                    Que voulez-vous consulter ? 
                                                </td>
                                                <td style="margin-left: 30px">
                                                    <select name="lister" id="lister">
                                                        <option value="0" selected="selected" disabled="disabled" >Choisir ...</option>
                                                        <option value="1" onclick="showdepart()">Enseignants</option>
                                                        <option value="2" onclick="showfiliereniveauannee()">Etudiants</option>
                                                        <option value="3" onclick="showfiliereniveauannee()">Matieres</option>
                                                        <option value="cc" onclick="showmatiereannee()">Notes CC</option>
                                                        <option value="tp" onclick="showmatiereannee()">Notes TP</option>
                                                        <option value="pv_par_matiere" onclick="showmatiereannee()">PV par matiere</option>
                                                        <option value="7" onclick="showfiliereniveauannee()">PV recap</option>
                                                        <option value="8" onclick="showfiliereniveauannee()">Admis</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="filieres">
                                                <td>
                                                    Choisir la filiere:
                                                </td>
                                                <td>
                                                    <select name="filiere" id="filiere">
                                                        <%
                                                            Vector<Filiere> filieres = (Vector) session.getAttribute("filieres");
                                                            if (filieres != null) {
                                                                for (int i = 0; i < filieres.size(); i++) {
                                                                    out.println("<option value=" + filieres.get(i).getCode() + ">" + filieres.get(i).getLibelle() + "</option>");
                                                                }
                                                            } else {
                                                                out.println("aucun element dans la BD");
                                                            }
                                                        %>
                                                    </select> 
                                                </td> 
                                            </tr>
                                            <tr style="margin-top: 10px" id="niveaux">
                                                <td style="margin-right: 30px">
                                                    Choisir le Niveau:
                                                </td>
                                                <td>
                                                    <select name="niveau" id="niveau">
                                                        <%
                                                            Vector<Niveau> niveaux = (Vector) session.getAttribute("niveaux");
                                                            if (niveaux != null) {
                                                                for (int i = 0; i < niveaux.size(); i++) {
                                                                    out.println("<option value=" + niveaux.get(i).getNiveau() + ">" + niveaux.get(i).getNiveau() + "</option>");
                                                                }
                                                            } else {
                                                                out.println("aucun element dans la BD");
                                                            }
                                                        %>
                                                    </select> 
                                                </td>
                                            </tr>

                                            <tr style="margin-top: 10px" id="matieres">
                                                <td style="margin-right: 30px">
                                                    Choisir la matiere 
                                                </td>
                                                <td style="margin-left: 30px">
                                                    <select name="matiere">
                                                        <%
                                                            Vector<UeClasse> uecl = (Vector) session.getAttribute("matue");
                                                            if (uecl != null) {
                                                                for (int i = 0; i < uecl.size(); i++) {
                                                                    out.println("<option value=" + uecl.get(i).getCode().getCode() + ">" + uecl.get(i).getCode().getLibelle() + " -- " + uecl.get(i).getIdclasse().getNom() + "</option>");
                                                                }
                                                            } else {
                                                                out.println("aucun element dans la BD");
                                                            }
                                                        %>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr style="margin-top: 10px" id="departements">
                                                <td style="margin-right: 30px">
                                                    Choisir le departement 
                                                </td>
                                                <td style="margin-left: 30px">
                                                    <select name="departement">
                                                        <%
                                                            Vector<Departement> deps = (Vector) session.getAttribute("departements");
                                                            if (uecl != null) {
                                                                for (int i = 0; i < deps.size(); i++) {
                                                                    out.println("<option value=" + deps.get(i).getCode() + ">" + deps.get(i).getLibelle() + "</option>");
                                                                }
                                                            } else {
                                                                out.println("aucun element dans la BD");
                                                            }
                                                        %>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr style="margin-top: 10px" id="annees">
                                                <td style="margin-right: 30px">
                                                    Année academique:
                                                </td>
                                                <td style="margin-left: 30px">
                                                    <select name="annee">
                                                        <%
                                                            Vector<AnneeAcademique> annee = (Vector) session.getAttribute("annees");
                                                            if (annee != null) {
                                                                for (int i = 0; i < annee.size(); i++) {
                                                                    out.println("<option value=" + annee.get(i).getAnnee() + ">" + annee.get(i).getAnnee() + "</option>");
                                                                }
                                                            } else {
                                                                out.println("aucun element dans la BD");
                                                            }
                                                        %>
                                                    </select>
                                                </td>
                                            </tr>

                                        </table>



                                        <div align="right"> 
                                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-top: 10px">Close</button>
                                            <input type="submit" class="btn btn-primary" style="margin-top: 10px" value="valider">
                                        </div> 

                                    </form>
                                </div>
                                <div class="modal-footer"></div>
                            </div>
                        </div>
                    </div>
                </div><!--/span10-->
                </div><!--/span10-->
                </div><!--/span10-->
                 <div class="clearfix"></div>
             
           
            <jsp:include page="../../footer.jsp"></jsp:include>
            
 
            <script type="text/javascript">
     $(document).ready(function(){
            hidedata();
           
        });
        
        function showmatiere() {
            $(matieres).show();  
            $(filieres).hide();
             $(niveaux).hide();
             $(departements).hide();
        }
        function showdepart(){
            $(matieres).hide();  
            $(filieres).hide();
             $(niveaux).hide();
            $(departements).show();
        }
        function showfiliereniveau(){
             $(filieres).show();
             $(niveaux).show();
             $(matieres).hide();
             $(departements).hide();
        }
        function hidedata() {
           $(departements).hide();
           $(matieres).hide(); 
           $(filieres).hide();
           $(niveaux).hide();
        }
        </script>
            <!-- end: JavaScript-->

           