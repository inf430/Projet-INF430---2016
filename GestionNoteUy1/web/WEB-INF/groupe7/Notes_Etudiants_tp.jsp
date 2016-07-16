<%@page import="java.util.List"%>
<%@page import="entities.EtudiantExam"%>
<%@page import="entities.Etudiant"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Vector"%>

        <title>Notes Etudiants</title>

        <jsp:include page="../../header.jsp"></jsp:include>

          
                        <div class="row-fluid sortable">
<div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>
                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>NOTES</h2>
                                    <div class="box-icon">

                                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                    </div>
                                </div>
                                <div class="box-content" >
                                <% List<EtudiantExam> listeEtudExam=(List)request.getAttribute("etud"); %>
                                    <table class="table table-bordered table-striped table-condensed bootstrap-datatable datatable" style='margin:3% 0% 0% 0%' >
                                        <thead>
                                            <tr>
                                                <th>Matricule</th>
                                                <th>Noms et Prenoms</th>

                                                <th>Note TP /20</th>
                                               
                                            </tr>
                                        </thead>   
                                        <tbody>
                                       <%
                                           if(listeEtudExam !=null){
                                               if(!listeEtudExam.isEmpty()){
                                           for(EtudiantExam e:listeEtudExam){
                                        out.println("<tr>");
                                       out.println(" <td>");out.println(e.getMatricule().getMatricule()); out.println("</td>");
                                       out.println("<td class=center>");out.println(e.getMatricule().getIdpersonne().getNom()+" "+e.getMatricule().getIdpersonne().getPrenom());out.println("</td>");

                                           out.println(" <td class=center>");
                                                out.println("<span class=label label-important>");out.println(e.getNote());out.println("</span>");
                                            out.println("</td>");
                                           
                                       out.println(" </tr>");
    }}}
%>
                                    </tbody>
                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->


                    <div class="clearfix"></div>
                <jsp:include page="../../footer.jsp"></jsp:include>
