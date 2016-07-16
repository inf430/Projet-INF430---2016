<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Matiere"%>
<%@page import="java.util.Vector"%>
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        
        <ul class="nav nav-tabs nav-stacked main-menu">

            <li><a href="#"  data-toggle="modal" data-target="#myModal" ><i class="icon-home"></i><span class="hidden-tablet">Acceuil Enseignant</span></a></li>
            <li><a href="#" class="dropmenu"><i class="icon-eye-open"></i><span class="hidden-tablet"> Consulter <i class="icon-caret-down" style="color: blue"></i></span></a>
                <ul>
                    <li><a href="listeMatiere" class="submenu" ><i class="icon-file-alt"></i><span class="hidden-tablet">ma liste de matiere</span></a></li>
                    
                    <li><a href="#" class="submenu" data-toggle="modal" data-target="#code" ><i class="icon-file-alt"></i><span class="hidden-tablet">note cc </span></a></li>
                    <li><a href="#" class="submenu" data-toggle="modal" data-target="#code4" ><i class="icon-file-alt"></i><span class="hidden-tablet">note TP </span></a></li>
                    <li><a href="#" class="submenu" data-toggle="modal" data-target="#code1" ><i class="icon-file-alt"></i><span class="hidden-tablet">Pv Recap</span></a></li>
                    <li><a  href="#" class="submenu" data-toggle="modal" data-target="#code2" ><i class="icon-file-alt"></i><span class="hidden-tablet">Liste Des Etudiants</span></a></li>
                    <li><a href="#" class="submenu"  data-toggle="modal" data-target="#code3" ><i class="icon-edit"></i><span class="hidden-tablet">Requetes</span><span class="label label-important">4</span></a></li>
                
                </ul>
            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet"> Modifications <i class="icon-caret-down" style="color: blue"></i> </span></a>
                <ul>
                    <li><a class="submenu" href="modifCC"><i class="icon-file-alt"></i><span class="hidden-tablet">Notes de CC</span></a></li>
                </ul>
            </li>
            <li><a href="deconnexion"><i class="icon-lock"></i><span class="hidden-tablet"> Deconnexion</span></a></li>
            
        </ul>
    </div>
</div>


<!-- Modal-->
<div class="modal fade" id="code" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true"style="width: 100%" >
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

                    <div align="center" > 
                        <form action="noteCC"  method="post" class="form-horizontal well">
                            <select name="matiere" class="form-control" >
                                <%
                                    Vector<Matiere> listeMatiere=(Vector)request.getAttribute("listeEnsMat");
                                    if(listeMatiere !=null){
                                    for(Matiere m:listeMatiere){
                                        out.println("<option value="+m.getCode()+">"+m.getCode()+"</option>");
                                    }
                                    }                                    
                                    %>
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
<div class="modal fade" id="code1" tabindex="-1" role="dialog" 
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

                        <form action="pvRecap" method="post" >



                            <select name="matiere"  class="form-control" >
                                <%
                                    if(listeMatiere !=null){
                                    for(Matiere m:listeMatiere){
                                        out.println("<option value="+m.getCode()+">"+m.getCode()+"</option>");
                                    }
                                    }
                                    
                                    
                                    %>
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
<div class="modal fade" id="code2" tabindex="-1" role="dialog" 
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

                        <form action="listeEtudiant" method="post" >



                            <select  class="form-control" name="code" >
                                <%
                                   if(listeMatiere !=null)
                                    for(Matiere m:listeMatiere){
                                        out.println("<option value="+m.getCode()+">"+m.getCode()+"</option>");
                                    }
                                    
                                    
                                    
                                    %>
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
<div class="modal fade" id="code3" tabindex="-1" role="dialog" 
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

                        <form action="consulteRequete" method="post">



                            <select name="matiere"  class="form-control" >
                                <%
                                    if(listeMatiere!=null)
                                    for(Matiere m:listeMatiere){
                                        out.println("<option value="+m.getCode()+">"+m.getCode()+"</option>");
                                    }
                                    
                                    
                                    
                                    %>
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
<div class="modal fade" id="code4" tabindex="-1" role="dialog" 
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

                        <form action="noteTP" method="post" >



                            <select name="matiere"  class="form-control" >
                                <%
                                    if(listeMatiere!=null)
                                    for(Matiere m:listeMatiere){
                                        out.println("<option value="+m.getCode()+">"+m.getCode()+"</option>");
                                    }
                                    
                                    
                                    
                                    %>
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