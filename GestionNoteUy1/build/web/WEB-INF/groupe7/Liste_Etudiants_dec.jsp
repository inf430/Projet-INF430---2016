<%@page import="java.util.Vector"%>
<%@page import="entities.Etudiant"%>
<%@page import="entities.Classe"%>

        <title>Liste des etudiants</title>

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
           $("#departements").hide();
           $("#matieres").hide(); 
           $("#filieres").show();
           $("#niveaux").show();
           $("#annees").show();
        }
        </script>

        <!-- end: CSS -->


    </head>

    <body>

        <!-- start: Header -->


        <jsp:include page="../../header.jsp"></jsp:include>

            <!-- start: Header -->	

            <div class="container-fluid-full">
                <div class="row-fluid">	
                    <!-- start: Content -->
                    <div id="content" class="span10" >                       

                        <ul class="breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index.html">Accueil</a> 
                                <i class="icon-angle-right"></i>
                            </li>
                            <li><a href="#">Liste des etudiants</a></li>
                        </ul>

                        <div class="panel-heading"  >
                            <%
                                Classe classe = (Classe)request.getAttribute("classe");
                                String annee = (String)request.getAttribute("annee");
                                out.println("<label><strong>Filiere:</strong>  "+ classe.getIdfiliere().getLibelle() +"</label>");
                                out.println("<label><strong>Niveau:</strong>  "+ classe.getNiveau().getNiveau() +"</label> "); 
                                out.println("<label><strong>Annee academique: </strong>  "+ annee +"</label> "); 
                             %>
                        </div>
                        <div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>
                        

                        <div class="row-fluid sortable">

                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>Liste des etudiants</h2>
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
                                                  out.println("<th class='text-center'>Matricule</th>");
                                                  out.println("<th class='text-center'>Nom et prenom</th>");
                                                  out.println("<th class='text-center'>Sexe</th>");
                                                  out.println("<th class='text-center'>Date de naissance</th>");
                                                  out.println("<th class='text-center'>Lieu de naissance</th>");
                                              out.println("</tr>");
                                            out.println("</thead>");
                                            out.println("<tbody>");
      
                                            Vector<Etudiant> etudiants = (Vector)request.getAttribute("etudiants");
                                            for(int i=0;i<etudiants.size();i++){
                                              out.println("<tr>");
                                              out.println("<td>"+etudiants.get(i).getMatricule()+"</td>");
                                              out.println("<td>"+etudiants.get(i).getIdpersonne().getNom()+" "+etudiants.get(i).getIdpersonne().getPrenom()+"</td>");
                                              out.println("<td>"+etudiants.get(i).getIdpersonne().getSexe()+"</td>");
                                              out.println("<td>"+etudiants.get(i).getIdpersonne().getDatenaiss()+"</td>");
                                              out.println("<td>"+etudiants.get(i).getIdpersonne().getLieunaiss()+"</td>");
                                              out.println("</tr>");
                                            }
                                      out.println("</tbody>");
                                    %>
                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->

                <div class="clearfix"></div>
   