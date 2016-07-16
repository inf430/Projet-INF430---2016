
        <title>Notes Etudiants</title>


        <jsp:include page="../../header.jsp"></jsp:include>

                        <div class="row-fluid sortable">

            
                        <div class="panel-heading"  >
                            <label><strong>Filiere:</strong> INFORMATIQUE </label>
                            <label><strong>Niveau:</strong> Master 1 </label>
                            <label><strong>Libelle:</strong> Architecture </label>                                       
                            <label><strong>Code Matiere:</strong> INF 407 </label>                                      
                        </div>
                        <div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>

                            <div class="box span12"   >
                                <div class="box-header" data-original-title style='height:0%'>
                                    <h2><i class="icon-align-justify"></i><span class="break"></span>PV</h2>
                                    <div class="box-icon">

                                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                    </div>
                                </div>

                                <div class="box-content" >                                   

                                    <table class="table table-bordered table-striped table-condensed bootstrap-datatable datatable" style='margin:3% 0% 0% 0%' >
                                        <thead>
                                            <tr>
                                                <th>Matricule</th>
                                                <th>Noms et Prenoms</th>

                                                <th>Note CC /20</th>
                                                <th>Exam /50</th>
                                                <th>Note TP /30</th>
                                                <th>Total /100</th>
                                                <th>MGP /4</th>
                                                <th>Decision</th>
                                            </tr>
                                        </thead>   
                                        <tbody>
                                        <% for (int i = 0; i < 14; i++) {%>
                                        <tr>
                                            <td>15U5784</td>
                                            <td>KAMDEM pascal miguel</td>
                                            <td><span class="label ">20</span></td>
                                            <td><span class="label ">25</span></td>
                                            <td><span class="label ">25</span></td>
                                            <td><span class="label label-success">70</span></td>
                                            <td><span class="label label-success">3.3</span></td>
                                            <td><span class="label label-success">CA</span></td>
                                        </tr><%}%>

                                    </tbody>
                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->
    <div class="clearfix"></div>
                <jsp:include page="../../footer.jsp"></jsp:include>

