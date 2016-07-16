<%@page import="entities.MatiereUe"%>
<%@page import="entities.UeClasse"%>
<%@page import="java.util.List"%>
<%@page import="entities.Classe"%>
<%@page import="entities.Ue"%>
<%@page import="java.util.Vector"%>

        <title>Liste des matieres</title>
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
           $("#matieres").show(); 
           $("#filieres").show();
           $("#niveaux").show();
           $("#annees").show();
        }        
            </script>

        <!-- start: Header -->


        <jsp:include page="../../header.jsp"></jsp:include>

           

                        <div class="row-fluid sortable">
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
                                                  out.println("<th class='text-center'>Code</th>");
                                                  out.println("<th class='text-center'>Libelle</th>");
                                                  out.println("<th class='text-center'>Semestre</th>");
                                              out.println("</tr>");
                                            out.println("</thead>");
                                            out.println("<tbody>");
      
                                            List<MatiereUe> matues = (List<MatiereUe>)request.getAttribute("matues");
                                            for(int i=0;i<matues.size();i++){
                                              out.println("<tr>");
                                              out.println("<td>"+matues.get(i).getIdmatiere().getCode()+"</td>");
                                              out.println("<td>"+matues.get(i).getIdmatiere().getLibelle()+"</td>");
                                              out.println("<td>"+matues.get(i).getCode().getIdsemestre().getSemestre()+"</td>");
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
                <jsp:include page="../../footer.jsp"></jsp:include>

