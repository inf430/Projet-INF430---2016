<%-- 
    Document   : traitement_requete
    Created on : 13 juil. 2016, 12:41:46
    Author     : FOQUO
--%>

<%@page import="entities.Requete"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <title>traitement requete</title>
       
        <jsp:include page="../../header.jsp"></jsp:include>
           
                <div class="row-fluid sortable">
                    <div class="box span12"   >
                        <div class="box-header" data-original-title style='height:0%'>
                            <h2><i class="icon-align-justify"></i><span class="break"></span>Requete de l'etudiant</h2>
                            <div class="box-icon">

                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                            </div>
                        </div>                        
                        <div class="modal-body"  >
                            <div >
                                <div >
                                    <div class="panel-heading"  >
                                    <% Requete requete = (Requete) request.getAttribute("requete");%>
                                    <label>Matricule:</label> <% out.println(requete.getMatricule().getMatricule());%> <br>
                                    <label>Nom:</label><% out.println(requete.getMatricule().getIdpersonne().getNom()); %>  <br>
                                    <label>Prenoms:</label><% out.println(requete.getMatricule().getIdpersonne().getPrenom());%>  <br>
                                    <label>Matiere:</label><% out.println(requete.getIdmatiere().getCode());%> <br>
                                    <label>Objet de la requete:</label><% out.println(requete.getObjet());%> <br> 
                                    <label>Contenu de la requete: </label> 

                                    <div class="panel panel-footer">
                                        <div class="panel-body"  >

                                            <h2> <p> <% out.println(requete.getContenu());%></h2>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="border: 1px solid ;border-radius: 2%;background-color:">                                
                                    
                                <form class='' action="enregistrerReponse" method="post" > 
                                        <p>
                                        <div class="">
                                            <label for="textarea">VOS OBSERVATIONS : </label> <br/>
                                            <input type="text" name="observation" rows="10" style='width:100%'>
                                        </div>
                                        </p>
                                        <div align="rigth">
                                            <input type="reset" value="reset" class="btn btn-default">
                                           <input type="submit" value="valider"class="btn btn-primary"> 
                                        </div>
                                    </form>

                                
                            </div>


                        </div>
                    </div> 
                </div>



            </div>
        </div>
      

            <div class="clearfix"></div>
        <jsp:include page="../../footer.jsp"></jsp:include>
