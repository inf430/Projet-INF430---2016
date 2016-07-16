<%@page import="java.util.List"%>
<%@page import="entities.Enseignant"%>
<%@page import="entities.Etudiant"%>

        <title>Liste des etudiants</title>


        <jsp:include page="../../header.jsp"></jsp:include>
                       
                   
                        

                        <div class="row-fluid sortable">
     <div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>
                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>Liste des etudiants de <% out.print(request.getAttribute("classe")); %></h2>
                                    <div class="box-icon">

                                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                    </div>
                                </div>

                                <div class="box-content" >                                   
                                <% List<Etudiant> list = (List<Etudiant>) request.getAttribute("etuds");
                                   if (!list.isEmpty() && list != null ) { %>
                                <table class="table table-bordered table-striped table-condensed bootstrap-datatable datatable" style='margin:3% 0% 0% 0%' >
                                    <thead>
                                        <tr>
                                            <th>N°</th>
                                            <th>Matricule</th>
                                            <th>Nom</th>                                         
                                            <th>Prénoms</th>                                         
                                            <th>Classe</th>                                         
                                        </tr>
                                    </thead>   

                                    <%
                                        Integer i = 0;
                                        for (Etudiant etud : list) {
                                            i++;
                                    %>
                                    <tr>                                       
                                        <td><%out.print(i);%>  </td>                                            
                                        <td><%out.print(etud.getMatricule());%>  </td>                                            
                                        <td><% out.print(etud.getIdpersonne().getNom()); %> </td>
                                        <td><% out.print(etud.getIdpersonne().getPrenom()); %> </td>
                                        <td><% out.print(request.getAttribute("classe")); %> </td>
                                    </tr>  
                                    <% } %>
                                    </table> 
                                     <% } else{ out.print("il n'existe aucun etudiant dans cette classe");}%> 
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->

   

                <div class="clearfix"></div>
                <jsp:include page="../../footer.jsp"></jsp:include>
