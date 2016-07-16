<%-- 
    Document   : Acceuil_consultations
    Created on : 1 juil. 2016, 12:22:38
    Author     : fritz kenne
--%>

<%@page import="entities.Etudiant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- start: Meta -->
        <meta charset="utf-8">
        <title>Saisie requete</title>
        <meta name="description" content="Bootstrap Metro Dashboard">
        <meta name="author" content="Dennis Ji">
        <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <!-- end: Meta -->

        <!-- start: Mobile Specific -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- end: Mobile Specific -->

        <!-- start: CSS -->

        <link  href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link  href="assets/css/bootstrap.min-1.css" rel="stylesheet">
        <link id="base-style" href="assets/css/style.css" rel="stylesheet">
        <link id="base-style-responsive" href="assets/css/style-responsive.css" rel="stylesheet">


        <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon edit"></i><span class="break"></span>Form Elements</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal" method="post" action="enregistrerRequete">
						  <fieldset>
							<div class="control-group">
							  <label class="control-label" for="typeahead">ETUDIANT </label>
							  <div class="controls">
                                                              <% Etudiant etudiant=(Etudiant)request.getAttribute("etudiant");   %>
                                                              nom: <% out.println(etudiant.getIdpersonne().getNom());             %>     <br>
                                                              prenom: <% out.println(etudiant.getIdpersonne().getPrenom()); %>   <br>
                                                              matricule:<% out.println(etudiant.getMatricule()); %> <br>
                                                              <br>
                                                                
                                                              <p class="help-block">
                                                                  
                                                                  <div class="controls">Objet:
								  <select id="selectError" data-rel="chosen" name="objet">
									<option>Absence de note</option>
									<option>Erreur de note</option>
									<option>Absence de nom</option>
									<option>Absence de matricule</option>
									<option></option>
								  </select>
                                                                </div>
                                                                  
                                                              </p>
							  </div>
							</div>
							

							         
							<div class="control-group hidden-phone">
                                                          Motif:  <textarea name="motif" row="300" cols="300"> </textarea>
							</div>
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">envoyer</button>
							  <button type="reset" class="btn">annuler</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->
                        
                        
                        
                                   <!-- start: Main Menu -->
                                   
           
          
            <!-- end: Main Menu -->
            
            



                <div class="clearfix"></div>
                <jsp:include page="../../footer.jsp"></jsp:include>


