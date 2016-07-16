<%@page import="entities.Requete"%>
<%@page import="java.util.Vector"%>

        <title>Requetes</title>

        <!-- start: Header -->    
        <jsp:include page="../../header.jsp"></jsp:include>
        
                        <div class="row-fluid sortable">

                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>REQUETES</h2>
                                    <div class="box-icon">

                                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                    </div>
                                </div>
                                <div class="box-content" >
                                    <table class="table table-bordered table-striped table-condensed bootstrap-datatable datatable" style='margin:3% 0% 0% 0%' >
                                        <thead>
                                            <tr>
                                                <th>matricule etudiant</th>
                                                <th>objet</th>
                                                <th>Status</th>
                                                <th>voir</th>
                                            </tr>
                                        </thead>   
                                        <tbody>

                                        <%  Vector<Requete> listeRequete = (Vector) request.getAttribute("listeRequete");
                                            Requete donnees = null;
                                        %>

                   <% if (listeRequete != null) {
                           if (!listeRequete.isEmpty()) {
                                for (Requete r : listeRequete) {
                                    out.println("<tr> ");
                                    out.println("<td>"+r.getMatricule().getMatricule()+"</td>");                                                                                                             
                                    out.println("<td class=center>"+r.getObjet()+"</td>");                                                      
                                    out.println("<td class=center>"+"<span class=label label-success>"+r.getEtat()+ "</span>"+"</td>");
                                    out.println("<td class=center><a href=traiterRequete?id="+r.getIdrequete()+"><button class=btn btn-info><i class=halflings-icon white edit></i></button></a>");                           
                                    out.println("</td>");
                                    out.println("</tr>");
                                                    }

                                                } else {
                                                    out.println("<span class=label label-success> vous n'avez pas de requete" + listeRequete.size());

                                                                }
                                                            }%>

                                    </tbody>
                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->


                <!-- end: Content -->



            <script src="assets/js/jquery-1.9.1.min.js"></script>
            <script src="assets/js/jquery-migrate-1.0.0.min.js"></script>

            <script src="assets/js/jquery-ui-1.10.0.custom.min.js"></script>

            <script src="assets/js/jquery.ui.touch-punch.js"></script>

            <script src="assets/js/bootstrap.min.js"></script>
            <script src='assets/js/jquery.dataTables.min.js'></script>

            <script src="assets/js/excanvas.js"></script>
            <script src="assets/js/jquery.flot.js"></script>
            <script src="assets/js/jquery.flot.pie.js"></script>
            <script src="assets/js/jquery.flot.stack.js"></script>
            <script src="assets/js/jquery.flot.resize.min.js"></script>

            <script src="assets/js/jquery.chosen.min.js"></script>

            <script src="assets/js/jquery.uniform.min.js"></script>

            <script src="assets/js/jquery.cleditor.min.js"></script>

            <script src="assets/js/jquery.elfinder.min.js"></script>

            <script src="assets/js/jquery.raty.min.js"></script>

            <script src="assets/js/jquery.iphone.toggle.js"></script>

            <script src="assets/js/jquery.uploadify-3.1.min.js"></script>

            <script src="assets/js/custom.js"></script>
            <!-- end: JavaScript-->



    </body>
</html>
