<%@page import="java.util.Vector"%>
<%@page import="entities.Etudiant"%>
<%@page import="entities.Classe"%>

        <title>Liste des etudiants</title>

        <jsp:include page="../../header.jsp"></jsp:include>

            <!-- start: Header -->	

            <div class="container-fluid-full">
                <div class="row-fluid">	
                    <!-- start: Content -->
                    <div id="content" class="span10" >   
                        <% String code=(String)request.getAttribute("code");
                        Vector<Etudiant> listeEtudiant=(Vector)request.getAttribute("listeEtudiant");
                        %>

                        <ul class="breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index.html">Accueil</a> 
                                <i class="icon-angle-right"></i>
                            </li>
                            <li><a href="#">Liste des etudiants</a></li>
                        </ul>

                        <div class="panel-heading"  >
                           
                        </div>
                        <div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>
                        

                        <div class="row-fluid sortable">

                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>Liste des etudiants pour la matiere:<% if(code !=null)out.println(code);%></h2>
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
      
                                            if(listeEtudiant!=null){
                                                if(!listeEtudiant.isEmpty()){
                                            for(int i=0;i<listeEtudiant.size();i++){
                                              out.println("<tr>");
                                              out.println("<td>"+listeEtudiant.get(i).getMatricule()+"</td>");
                                              out.println("<td>"+listeEtudiant.get(i).getIdpersonne().getNom()+" "+listeEtudiant.get(i).getIdpersonne().getPrenom()+"</td>");
                                              out.println("<td>"+listeEtudiant.get(i).getIdpersonne().getSexe()+"</td>");
                                              out.println("<td>"+listeEtudiant.get(i).getIdpersonne().getDatenaiss()+"</td>");
                                              out.println("<td>"+listeEtudiant.get(i).getIdpersonne().getLieunaiss()+"</td>");
                                              out.println("</tr>");
                                            }
                                                }else{
                                                     out.println("<td>vous n'avez pas d'etudiant pour cette matiere</td>");
                                                }
                                            }
                                      out.println("</tbody>");
                                    %>
                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->

                <div class="clearfix"></div>
                <jsp:include page="../../footer.jsp"></jsp:include>





