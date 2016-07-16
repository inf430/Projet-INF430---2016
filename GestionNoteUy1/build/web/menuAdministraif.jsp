<%@page import="entities.AnneeAcademique"%>
<%@page import="entities.Departement"%>
<%@page import="entities.Matiere"%>
<%@page import="entities.Niveau"%>
<%@page import="entities.Filiere"%>
<%@page import="java.util.Vector"%>
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li><a href="createadministratif" class="dropmenu"><i class="icon-home" id='b1'></i><span class="hidden-tablet">Acceuil Personnel administratifs</span></a></li>
            
            <li><a href="#" class="dropmenu" onclick="hidedata()" data-toggle="modal" data-target="#infos"><i class="icon-eye-open"></i><span class="hidden-tablet">consultations</span></a> </li>
            
            <li><a href="createadministratif" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">ANNEE ACADEMIQUE</span></a>
                <ul>
                    <li><a class="submenu" href="createannee?menu=nouvelle annee"><i class="icon-file-alt"></i><span class="hidden-tablet">creer une annee academique</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">MATIERES<i class="icon-caret-down" id="b1"></i></a>
                <ul>
                    <li><a class="submenu" href="liste-matieres?menu=liste des matieres"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des matieres</span></a></li>
                    <li><a class="submenu" href="creatematiere?menu=Nouvelle matiere"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter une matiere</span></a></li>
                    <li><a class="submenu" href="addexammatter?menu=Associer matiere-examen"><i class="icon-file-alt"></i><span class="hidden-tablet">associer un examen</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">UNITES D'ENSEIGNEMENT</span><i class="icon-caret-down" id="b2"></i></a>
                <ul>
                    <li><a class="submenu" href="liste?menu=liste des ues"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des UEs</span></a></li>
                    <li><a class="submenu" href="createue?menu=Nouvelle unite d'enseignement"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter une UE</span></a></li>
                    <li><a class="submenu" href="matiereue?menu=Ajout de matiere a l'ue"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter une matiere a l'ue</span></a></li>
                    <li><a class="submenu" href="associerueclasse?menu=associer ue-classe"><i class="icon-file-alt"></i><span class="hidden-tablet">associer une classe</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">ETUDIANTS</span><i class="icon-caret-down" id="b2"></i></a>
                <ul>
                    <li><a class="submenu" href="liste-etudiants?menu=liste des etudiants"><i class="icon-file-alt"></i><span class="hidden-tablet">liste  des etudiants</span></a></li>
                    <li><a class="submenu" href="etudiantclasse?menu=inscription etudiant"><i class="icon-file-alt"></i><span class="hidden-tablet">inscrire un etudiant dans une classe</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">ENSEIGNANTS</span><i class="icon-caret-down" id="b2"></i></a>
                <ul>
                    <li><a class="submenu" href="listeenseignantdept?menu=liste des enseignants"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des enseignants</span></a></li>
                    <li><a class="submenu" href="addexammatter?menu=attribution de matiere"><i class="icon-file-alt"></i><span class="hidden-tablet">attribution de matiere</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">EXAMENS</span><i class="icon-caret-down" id="b2"></i></a>
                <ul>
                    <li><a class="submenu" href="liste-exam?menu=liste des examens"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des examens</span></a></li>
                    <li><a class="submenu" href="createexam?menu=Ajout d'un examen"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter un examen</span></a></li>

                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">DEPARTEMENTS</span><i class="icon-caret-down" id="b2"></i></a>
                <ul>
                    <li><a class="submenu" href="createdepartement?menu=nouveau departement"><i class="icon-file-alt"></i><span class="hidden-tablet">nouveau departement</span></a></li>
                    <li><a class="submenu" href="listedepartement?menu=liste des departements"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des departements</span></a></li>
                     <li><a class="submenu" href="addchefdepartement?menu=nouveau chef de departement"><i class="icon-file-alt"></i><span class="hidden-tablet">nommer un chef de departement</span></a></li>
                    <li><a class="submenu" href="createfiliere?menu=ajouter une filiere"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter une filiere</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">NIVEAUX</span><i class="icon-caret-down" id="b2"></i></a>
                <ul>
                    <li><a class="submenu" href="listeniveaux?menu=liste des niveaux"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des niveaux</span></a></li>
                    <li><a class="submenu" href="createniveau?menu=nouveau niveau"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter un niveau</span></a></li>
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">CLASSES</span><i class="icon-caret-down" id="b2"></i></a>
                <ul>
                    <li><a class="submenu" href="liste-classes?menu=liste des classes"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des classes</span></a></li>
                    <li><a class="submenu" href="nouvelleclasse?menu=nouvelle classe"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter une classe</span></a></li>
                </ul>
            </li> 
            <li><a href="deconnexion"><i class="icon-lock" id='b1'></i><span class="hidden-tablet"> Deconnexion</span></a></li>
        </ul>
    </div>
</div>


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
                                        Vector<Matiere> matieres = (Vector) session.getAttribute("matieres");
                                        if (matieres != null) {
                                            for (int i = 0; i < matieres.size(); i++) {
                                                out.println("<option value=" + matieres.get(i).getIdmatiere() + ">" +matieres.get(i).getCode()+"----"+ matieres.get(i).getLibelle() + "</option>");
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
                                        if (deps != null) {
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
