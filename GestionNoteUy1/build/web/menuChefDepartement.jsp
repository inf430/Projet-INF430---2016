<%@page import="entities.Matiere"%>
<%@page import="javax.swing.text.html.HTML.Tag"%>
<%@page import="java.util.List"%>
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li><a href="#" class="dropmenu"><i class="icon-home"></i><span class="hidden-tablet">Chef Departement</span></a></li>
            <li><a href="#" class="dropmenu"><i class="icon-eye-open"></i><span class="hidden-tablet"> Consulter <i class="icon-caret-down" style="color: blue" ></i></span></a>
                <ul> 
                    <li><a  href="#" class="submenu" data-toggle="modal" data-target="#myModale" ><i class="icon-file-alt"></i><span >Liste Etudiants</span></a></li>
                    <li><a  href="ConsulterEnseignantsDpt" class="submenu"  ><i class="icon-file-alt"></i><span class="hidden-tablet">Liste Enseignants</span></a></li>
                    <li><a href="#" id="cc" class="submenu" data-toggle="modal" data-target="#myModal" ><i class="icon-file-alt"></i><span class="hidden-tablet">note cc </span></a></li>
                    <li><a  href="#" ><i class="icon-file-alt"></i><span class="hidden-tablet">Liste Matieres</span></a></li>
                 </ul>            
            </li>
                      
            <li><a href="#"><i class="icon-lock"></i><span class="hidden-tablet"> Deconnexion</span></a></li>
        </ul>
    </div>
</div>  

<!-- Modal-->
<div class="modal fade" id="myModale" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" align="center">
                    <strong>Choisir le Niveau d'etude</strong>
                </h4>
            </div>
            <div class="modal-body" >
                <div class="row">
                    <div align="center"> 
                        <form action="ConsulterEtudiantsClasse" >
                            <select name="classe"  class="form-control" >
                                <% List<String> classesDpt = (List<String>) request.getAttribute("classesDpt");
                                    if (classesDpt != null) {
                                        for (String c : classesDpt) { %>

                                <option><% out.print(c); %></option>
                                <% }
                                    }%>				
                            </select>
                            <button type="submit" class=" btn btn-primary ">Valider</button>
                        </form>              
                    </div>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


<!-- Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" align="center">
                    <strong>Choisir la Matiere</strong>
                </h4>
            </div>
            <div class="modal-body" >
                <div class="row">
                    <div align="center"> 
                        <form id="formMat" action="" method="post">
                            <select name="matiere"  id="matiere" class="form-control" >
                                <% List<Matiere> matsDpt = (List<Matiere>) request.getAttribute("matsDpt");
                                    if (matsDpt != null) {
                                        for (Matiere m : matsDpt) { %>                                
                                <option value="<% out.print(m.getCode()); %>"><% out.print(m.getCode()); %></option>
                                <% }
                                    }%>
                            </select>
                          
                            <button type="submit" class=" btn btn-primary ">Valider</button>
                        </form>              
                    </div>

                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
            <script src="./assets/js/jquery-2.3.1.min.js"> </script>
            <script language="javascript"> 
                   $(document).ready(function(){
                      $("#cc").on('click', function(){
                          $("#formMat").attr("action", "ConsulterNoteCC?typeExam=cc");
                      });
                       $("#tp").on('click', function(){
                          $("#formMat").attr("action", "ConsulterNoteCC?typeExam=tp");
                      });
                        
                    
                   });
                </script>