<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/header.jsp"></c:import>
<div class="row-fluid sortable" style="alignment-adjust: rigth;">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon calendar"></i><span class="break"></span>Modification des profils</h2>
        </div>
        <div class="box-content">
            <div id="external-events" class="span3 hidden-phone hidden-tablet">
                <h4>Matricule de l'étudiant</h4>
                <form action="#" method="post">
                    <input id="appendedInputButton" size="16" type="text" value="<c:out value="${etudiant.matricule}" /> "><br/>
                    <button type="submit" class="btn btn-primary">Rechercher</button>
                </form>
            </div>



            <div class="clearfix" style="width: 75%; float: right;">



                <ul class="nav nav-tabs" >
                    <li class="active"><a data-toggle="tab" href="#home">Informations Personnelles</a></li>
                    <li><a data-toggle="tab" href="#menu1">Matières de l'étudiant</a></li>
                </ul>

                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">

                        <div class="box-content">
                            <form class="form-horizontal" method="Post" action="">


                                <div class="control-group">
                                    <label class="control-label" for="focusedInput">Nom :</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="nom" type="text" value="<c:out value="${etudiant.idpersonne.nom}" />" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="focusedInput">Prenom :</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="prenom" type="text" value="<c:out value="${etudiant.idpersonne.prenom}"/>" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="disabledInput">Matricule</label>
                                    <div class="controls">
                                        <input class="input-xlarge disabled" id="matricule" type="text" disabled="true" value="<c:out value="${etudiant.matricule}"/>" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="date01">Date de Naissance</label>
                                    <div class="controls">
                                        <input type="text" class="input-xlarge datepicker" id="dateNaiss" value="14/04/94">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="focusedInput">Lieu :</label>
                                    <div class="controls">
                                        <input class="input-xlarge focused" id="lieuNaiss" type="text" value="<c:out value="${etudiant.idpersonne.lieunaiss}"/>" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Sexe</label>
                                    <div class="controls">
                                        <label class="radio">
                                            <input type="radio" name="optionsRadios" id="Masculin" value="option1" checked="">
                                            Masculin
                                        </label>
                                        <div style="clear:both"></div>
                                        <label class="radio">
                                            <input type="radio" name="optionsRadios" id="Feminin" value="option2">
                                            Feminin
                                        </label>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="disabledInput">Login</label>
                                    <div class="controls">
                                        <input class="input-xlarge disabled" id="login" type="text" placeholder="admin" disabled="trues">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="disabledInput">Mot de passe</label>
                                    <div class="controls">
                                        <input class="input-xlarge disabled" id="password" type="text" placeholder="password" disabled="trues">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="disabledInput">Statut</label>
                                    <div class="controls">
                                        <input class="input-xlarge disabled" id="statut" type="text" placeholder="Etudiant" disabled="trues">
                                    </div>
                                </div>


                                <button type="submit" class="btn btn-primary">Sauvégarder les changements</button>
                                <button class="btn">Annuler les changements</button>



                            </form>

                        </div>



                    </div>
                    <div id="menu1" class="tab-pane fade">

                        <form method="Post" action="#">
                            <div class="box span4 noMargin" onTablet="span12" onDesktop="span4" style="width: 48%; float: left;">
                                <div class="box-header">
                                    <h2><i class="halflings-icon check"></i><span class="break"></span>Semestre1</h2>
                                    <div class="box-icon">
                                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    </div>
                                </div>
                                <div class="box-content">
                                    <div class="todo">
                                        <ul class="todo-list">
                                            <% for (int i = 0; i < 8; i++) {%>
                                            <li>
                                                INF-408 Système d'exploitation 
                                                <span class="todo-actions">
                                                    <input type="checkbox" id="INF-408" value="INF-408">
                                                </span>
                                            </li>
                                            <% }%>

                                        </ul>
                                    </div>	
                                </div>
                            </div>

                            <div class="box span4 noMargin" onTablet="span12" onDesktop="span4" style="width: 48%; float: right;">
                                <div class="box-header">
                                    <h2><i class="halflings-icon check"></i><span class="break"></span>Semestre2</h2>
                                    <div class="box-icon">
                                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    </div>
                                </div>
                                <div class="box-content">
                                    <div class="todo">
                                        <ul class="todo-list">
                                            <% for (int i = 0; i < 8; i++) {%>
                                            <li>
                                                INF-419 Algorithmique de NGUEMA
                                                <span class="todo-actions">
                                                    <input type="checkbox" id="INF-419" value="INF-419">
                                                </span>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>	
                                </div>
                            </div

                            <div class="form-actions">
                                <center><button type="submit" class="btn btn-primary">Sauvégarder les changements</button>
                                    <button class="btn">Annuler les changements</button></center>
                            </div>
                        </form>
                    </div>
                </div>



            </div>
        </div>
    </div>
</div>
<c:import url="/footer.jsp"></c:import>