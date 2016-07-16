
        <title>Liste des etudiants</title>


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
                            <li><a href="#">Liste des Enseignants</a></li>
                        </ul>

                       
                        <div align="right"> <button class="btn btn-default" style="margin-bottom:1%"><i class="icon-print">imprimer</i></button> </div>
                        

                        <div class="row-fluid sortable">

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
                                        <thead>
                                            <tr>
                                                <th>N²</th>
                                                <th>Matricule</th>
                                                <th>Noms et Prenoms</th>                                         
                                            </tr>
                                        </thead>   

                                    <% for (int i = 0; i < 14; i++) {%>
                                    <tr>                                       
                                        <td><%out.print(i + 1);%>  </td>                                            
                                        <td>15U5784</td>                                            
                                        <td>KAMDEM pascal miguel</td>
                                    </tr>   
                                    <%}%>


                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->


                <div class="clearfix"></div>
                <jsp:include page="../../footer.jsp"></jsp:include>

