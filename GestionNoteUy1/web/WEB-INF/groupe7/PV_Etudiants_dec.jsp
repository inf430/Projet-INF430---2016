<%@page import="java.util.Vector"%>
<%@page import="entities.Etudiant"%>
<%@page import="entities.Classe"%>
<%@page import="entities.Matiere"%>
<%@page import="entities.EtudiantExam"%>
<%@page import="java.util.List"%>
<%@page import="entities.UeClasse"%>
<%@page import="entities.MatiereUe"%>

 <jsp:include page="../../header.jsp"></jsp:include>
        <meta charset="utf-8">
        <title>Notes Etudiants</title>

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
        <!-- end: CSS -->

                     
                        <div class="row-fluid sortable">
  <div class="panel-heading"  >
                            <%
                                Matiere matiere = (Matiere)request.getAttribute("mat");
                                Classe classe = (Classe)request.getAttribute("classe");
                                String annee = (String)request.getAttribute("annee");
                                //String type = (String)request.getAttribute("type");
                                //out.println("<h2>Proces verbal recapitulatif</h2>");
                                out.println("<label><strong>Filiere:</strong>"+ classe.getIdfiliere().getLibelle()+ "</label>");
                                out.println("<label><strong>Niveau:</strong>"+ classe.getNiveau().getNiveau() +"</label>");                       
                                out.println("<label><strong>Libelle:</strong>"+ matiere.getLibelle() +"</label>");                                      
                                out.println("<strong>Code Matiere:</strong>"+ matiere.getCode()+"");    
                                out.println("<label><strong>Annee academique:</strong>  "+ annee +"</label> ");
                            %>
                        </div>
                        <div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>

                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>Proces verbal recapitulatif</h2>
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
                                                  out.println("<th class='text-center'>Note CC</th>");
                                                  out.println("<th class='text-center'>Note EX</th>");
                                                  out.println("<th class='text-center'>Note/100</th>");
                                                  out.println("<th class='text-center'>MGP</th>");
                                                  out.println("<th class='text-center'>Decision</th>");
                                              out.println("</tr>");
                                            out.println("</thead>");
                                            
                                            out.println("<tbody>");
                                            List<EtudiantExam> notesExams = (List<EtudiantExam>)request.getAttribute("notesExams");
                                            List<EtudiantExam> notesCCs = (List<EtudiantExam>)request.getAttribute("notesCCs");
                                            for(int i=0;i<notesExams.size();i++){
                                                out.println("<tr>");
                                                out.println("<td>"+notesExams.get(i).getMatricule().getMatricule()+"</td>");
                                                out.println("<td>"+notesExams.get(i).getMatricule().getIdpersonne().getNom()+" "+notesExams.get(i).getMatricule().getIdpersonne().getPrenom()+"</td>");
                                                float noteCC =  notesCCs.get(i).getNote()*3/2;
                                                out.println("<td>"+noteCC+"</td>");
                                                float noteEx =  notesExams.get(i).getNote()*7/2;
                                                out.println("<td>"+noteEx+"</td>");
                                                float noteTotal = noteCC+noteEx;
                                                out.println("<td>"+noteTotal +"</td>");
                                                if(noteTotal<=35 && noteTotal<45){
                                                    out.println("<td>1</td>");
                                                }else if(noteTotal>=45 && noteTotal<50){
                                                    out.println("<td>1.3</td>");
                                                }else if(noteTotal>=50 && noteTotal<55){
                                                    out.println("<td>1.7</td>");
                                                }else if(noteTotal>=55 && noteTotal<60){
                                                    out.println("<td>2</td>");
                                                }else if(noteTotal>=60 && noteTotal<65){
                                                    out.println("<td>2.3</td>");
                                                }else if(noteTotal>=65 && noteTotal<70){
                                                    out.println("<td>2.7</td>");
                                                }else if(noteTotal>=70 && noteTotal<75){
                                                    out.println("<td>3</td>");
                                                }else if(noteTotal>=75 && noteTotal<80){
                                                    out.println("<td>3.3</td>");
                                                }else if(noteTotal>=80 && noteTotal<85){
                                                    out.println("<td>3.7</td>");
                                                }else if(noteTotal>=85 && noteTotal<=100){
                                                    out.println("<td>4</td>");
                                                }else{
                                                   out.println("<td></td>"); 
                                                }

                                                if(noteTotal>=35 && noteTotal<50){
                                                    out.println("<td class='label label-warning'>CANT</td>");
                                                }else if(noteTotal>=50){
                                                    out.println("<td class='label label-success'>AC</td>"); 
                                                }else if(noteTotal<35){
                                                    out.println("<td class='label label-important'>NA</td>"); 
                                                }
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
