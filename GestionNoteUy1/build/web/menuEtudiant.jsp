<%-- 
    Document   : menuEtudiant
    Created on : 9 juil. 2016, 11:52:36
    Author     : fritz kenne
--%>


<%@page import="entities.Niveau"%>
<%@page import="entities.AnneeAcademique"%>
<%@page import="entities.Departement"%>
<%@page import="entities.UeClasse"%>
<%@page import="entities.Filiere"%>
<%@page import="java.util.Vector"%>
<%@page import="entities.Matiere"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accueil Etudiant</title>
    </head>
    <body>
         start: Header -->


<!-- start: Main Menu -->
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li><a href="#"><i class="icon-home"></i><span class="hidden-tablet">Acceuil Etudiant</span></a></li>
            <li><a href="#" class="dropmenu"><i class="icon-eye-open"></i><span class="hidden-tablet"> Consulter<i class="icon-caret-down" style="color: blue"></i></a>
                <ul>
                    <li><a class="submenu" data-toggle="modal" data-target="#myModal" href="#"><i class="icon-file-alt"></i><span class="hidden-tablet">Note CC </span></a></li>
                    <li><a class="submenu" data-toggle="modal" data-target="#myModal2" href="#"><i class="icon-file-alt"></i><span class="hidden-tablet">Note TP </span></a></li>
                    
                    <li><a class="submenu" data-toggle="modal" data-target="#myModal1" href="#"><i class="icon-file-alt"></i><span class="hidden-tablet">PV Recapitulatif</span></a></li>
                    
                </ul>
            </li>
            <li><a href="#" class="dropmenu"><i class="icon-envelope"></i><span class="hidden-tablet">Requetes</span> <i class="icon-caret-down" style="color: blue"></i></a>
                <ul>
                    <li><a class="submenu" data-toggle="modal" data-target="#myModal3" href="#"><i class="icon-file-alt"></i><span class="hidden-tablet">Rédiger requête </span></a></li>
                     
                    
                </ul>
            </li>

            <li><a href="deconnexion"><i class="icon-lock"></i><span class="hidden-tablet"> Deconnexion</span></a></li>
        </ul>
    </div>
</div>  


<!--Groupe6 Modal id="myModal1" représente PV Recapitulatif-->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" 
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

                        <form action="testrequete" >


                            <div class="form-group">
                                <label class="">choisir la matiere</label>
                                <select name="matiere"  class="form-control" >
                                    <%
                                        Vector <Matiere> listeMatiere=(Vector)request.getAttribute("listeMatiere");
                                        for(Matiere m:listeMatiere ){
                                            out.println("<option value="+ m.getCode() +">"+m.getCode()+"</option>");
                                        }
                                        
                                        
                                        
                                        
                                        
                                     %>   
                                </select> <br>
                                
                            </div>
                            <div align="right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class=" btn btn-primary ">Valider</button>
                            </div>
                        </form>              
                    </div>

                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<!--Groupe6 id="myModal" représente Note CC -->
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

                        <form method="post" action="ConsulterNoteEtudiantCC" >


                            <div class="form-group">
                                <label class="">choisir la matiere</label>
                                <select name="matiere" id="matiere" class="form-control" >
                                    <%
                                        
                                        for(Matiere m:listeMatiere ){
                                            out.println("<option value="+ m.getCode() +">"+m.getCode()+"</option>");
                                        }
                                        
                                        
                                        
                                        
                                        
                                     %>   
                                </select> <br>
                                
                            </div>
                            <div align="right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class=" btn btn-primary ">Valider</button>
                            </div>
                        </form>              
                    </div>

                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>


<!--Groupe6 id="myModal2" représente Note TP-->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" 
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

                        <form action="ConsulterNoteEtudiantTP" method="post" >


                            <div class="form-group">
                                <label class="">choisir la matiere</label>
                                <select name="matiere"  class="form-control" >
                                    <%
                                        
                                        for(Matiere m:listeMatiere ){
                                            out.println("<option value="+ m.getCode() +">"+m.getCode()+"</option>");
                                        }
                                        
                                        
                                        
                                        
                                        
                                     %>   
                                </select> <br>
                              
                            </div>
                            <div align="right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class=" btn btn-primary ">Valider</button>
                            </div>
                        </form>              
                    </div>

                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
                                
                                
<!--Groupe6 id="myModal3" représente  Rédiger requête   -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" 
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

                        <form action="SaisirRequete" method="post">


                            <div class="form-group">
                                <label class="">choisir la matiere</label>
                                <select name="matiere"  class="form-control" >
                                    <%
                                      
                                        for(Matiere m:listeMatiere ){
                                            out.println("<option value="+ m.getCode() +">"+m.getCode()+"</option>");
                                        }
                                                                        
                                     %>   
                                </select> <br>
                               
                            </div>
                            <div align="right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class=" btn btn-primary ">Valider</button>
                            </div>
                        </form>              
                    </div>

                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
                                
                                
<!--Groupe6 id="myModal4" représente Reponse requête    
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" 
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

                        <form action="testrequete" >


                            <div class="form-group">
                                <label class="">choisir la matiere</label>
                                <select name="matiere"  class="form-control" >
                                    <%
                                       
                                        for(Matiere m:listeMatiere ){
                                            out.println("<option value="+ m.getCode() +">"+m.getCode()+"</option>");
                                        }
                                        
                               %>   
                                </select> <br>
                                
                            </div>
                            <div align="right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class=" btn btn-primary ">Valider</button>
                            </div>
                        </form>              
                    </div>

                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>-->
                                
<!--Groupe6 id="myModal" représente Note CC 
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" 
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

                        <form method="post" action="ConsulterNoteEtudiant" >


                            <div class="form-group">
                                <label class="">choisir la matiere</label>
                                <select name="matiere"  class="form-control" >
                                    <%
                                       
                                        for(Matiere m:listeMatiere ){
                                            out.println("<option value="+ m.getCode() +">"+m.getCode()+"</option>");
                                        }
                                        
                                        
                                        
                                        
                                        
                                     %>   
                                </select> <br>
                                
                            </div>
                            <div align="right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class=" btn btn-primary ">Valider</button>
                            </div>
                        </form>              
                    </div>

                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>  -->
                                
                                


                             
 
<!-- end: Main Menu


</body>
</html> -->
