<%@page import="entities.Departement"%>
<%@page import="java.util.Vector"%>
<%@page import="entities.Enseignant"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- start: Meta -->
        <meta charset="utf-8">
        <title>Liste des enseignants</title>
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

<script type="text/javascript">
    $(document).ready(function(){
            hidedata();
           
        });
        
        function showannee(){
            $("#matieres").hide();  
            $("#filieres").hide();
             $("#niveaux").hide();
             $("#departements").hide();
             $("#annees").show();
        }
        function showmatiereannee() {
            $("#matieres").show();  
            $("#filieres").show();
             $("#niveaux").show();
             $("#departements").hide();
             $("#annees").show();
        }
        function showdepart(){
            $("#matieres").hide();  
            $("#filieres").hide();
             $("#niveaux").hide();
            $("#departements").show();
            $("#annees").hide();
        }
        function showfiliereniveauannee(){
             $("#filieres").show();
             $("#niveaux").show();
             $("#annees").show();
             $("#matieres").hide();
             $("#departements").hide();
        }
        function hidedata() {
           $("#departements").show();
           $("#matieres").hide(); 
           $("#filieres").hide();
           $("#niveaux").hide();
           $("#annees").hide();
        
        }
        </script>
        <!-- end: CSS -->


    </head>

    <body>

        <!-- start: Header -->


        <jsp:include page="../../header.jsp"></jsp:include>

            <!-- start: Header -->	

                        <div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>
                        

                        <div class="row-fluid sortable">
                                <div class="panel-heading"  >
                            <%
                                Departement departement = (Departement)request.getAttribute("departement");
                                out.println("<label><strong>Departement:</strong>  "+ departement.getLibelle()+"</label>");
                             %>
                        </div>
                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>Liste des Enseignants</h2>
                                    <div class="box-icon">

                                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                    </div>
                                </div>

                                <div class="box-content" >                                   

                                    <table class="table table-bordered table-striped table-condensed bootstrap-datatable datatable" style='margin:3% 0% 0% 0%' >
                                       <%
                                                out.println("<thead>");
                                                  out.println("<tr>");
                                                      out.println("<th class='text-center'>Matricules</th>");
                                                      out.println("<th class='text-center'>Noms et prenoms</th>");
                                                      out.println("<th class='text-center'>Téléphone</th>");
                                                      out.println("<th class='text-center'>Sexe</th>");
                                                      out.println("<th class='text-center'>Grade</th>");
                                                      out.println("<th class='text-center'>Specialité</th>");
                                                  out.println("</tr>");
                                                out.println("</thead>");
                                                out.println("<tbody>");
                                            Vector<Enseignant> enseignants = (Vector)request.getAttribute("enseignants");
                                            for(int i=0;i<enseignants.size();i++){
                                                out.println("<tr>");
                                                out.println("<td>"+enseignants.get(i).getMatricule()+"</td>");
                                                out.println("<td>"+enseignants.get(i).getIdpersonne().getNom()+" "+enseignants.get(i).getIdpersonne().getPrenom()+"</td>");
                                                out.println("<td>"+enseignants.get(i).getIdpersonne().getNumtel()+"</td>");
                                                out.println("<td>"+enseignants.get(i).getIdpersonne().getSexe()+"</td>");
                                                out.println("<td>"+enseignants.get(i).getGrade()+"</td>");
                                                out.println("<td>"+enseignants.get(i).getSpecialite()+"</td>");
                                                out.println("</tr>");
                                            }
                                         %>

                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->
        

                <div class="clearfix"></div>
                <jsp:include page="../../footer.jsp"></jsp:include>

