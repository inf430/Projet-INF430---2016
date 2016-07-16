<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header.jsp"></c:import>
<link href="toastr/toastr.css" rel="stylesheet" />
<div class="row-fluid sortable" style="alignment-adjust: rigth;">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon calendar"></i><span class="break"></span>Modification des Notes de CC</h2>
        </div>
        <div class="box-content">
            <div id="external-events" class="span3 hidden-phone hidden-tablet">
                <h4>Matricule de l'étudiant</h4>
                <form action="#" method="post">
                    <input id="matricule" name="matricule" size="16" type="text"><br/>
                    <div class="control-group">
                        <label class="control-label" for="selectError">Classe</label>
                        <div class="controls">
                            <select id="classe" name="classe" data-rel="chosen">
                                <c:forEach items="${ classes }" var="classe">
					<option value="${ classe.idclasse }">${ classe.nom }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="selectError">Matière</label>
                        <div class="controls">
                            <select id="matiere" data-rel="chosen">
                                <c:forEach items="${ matieres }" var="matiere">
					<option value="${ matiere.idmatiere }">${ matiere.code }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" id="findEtudiant"><center>Rechercher</center></button>
                </form>
            </div>



            <div class="clearfix" style="width: 75%; float: right; margin-top: -10px; margin-right: -10px">


                <div class="row-fluid sortable">		
                    <div class="box span12">
                        <div id="result">Modification effectuée</div>
                        <div class="box-header" data-original-title>
                            <h2><i class="halflings-icon user"></i><span class="break"></span>Note de l'étudiant</h2>
                            <div class="box-icon">
                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <form action="#" method="Post" id="formNotes">
                                <input type="hidden" name="idMatiere" value="1"/>
                               <!-- <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                    <thead>
                                        <tr>
                                            <th width=5%>Matricule</th>
                                            <th width=80%>Nom Prénom</th>
                                            <th width=15%>Note</th>
                                        </tr>
                                    </thead>   
                                    <tbody>

                                        <tr class="etudiant">
                                            <td id="matriculeEt">12Y192</td>
                                            <td class="center">KOUAKAM TIOJIP Ulrich Vaneck</td>
                                            <td height="5px">
                                                <input onChange="verinotes('formNotes','12Y192')" maxlength=5 style=" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;" type="text" name="note" id="note" value="24.75"  />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>  -->
                                
                            </form>
                            <center><button type="submit" class="btn btn-primary" id="sendNote">Sauvegarder les notes</button></center>
                        </div>
                    </div><!--/span-->

                </div>



            </div>



        </div>
    </div>
</div>
</div>
<c:import url="/footer.jsp"></c:import>
<script src="toastr/toastr.js"></script>
<script>
    function verinotes(idForm,id_text){

        var elmt = document.getElementById(idForm).elements[id_text].value;
        var rep=0;
        for(var i=0; i<=30 ; i=i+0.25){
               if (elmt==i || elmt=='/'){
               rep=1;
               break;
               }
        }

       if(rep==1) document.getElementById(idForm).elements[id_text].style.backgroundColor='#ffffff';
       else document.getElementById(idForm).elements[id_text].style.backgroundColor='red';

    }
    
   $(document).ready(function(){
       $("#sendNote").hide();
       $("#result").hide();
       //$("#formNotes").hide();
       
        $("#classe").change(function(){
           var idClasse = $(this).val();
           var adresse = "modifCC?type=getMatiere&classe="+idClasse;
           $.getJSON(adresse, function(data){
               var contenu = '';
                for(var i = 0; i < data.length; i++){
                   contenu += '<option value=' + data["idmatiere"] + '>' + data["code"] + '</option>';
               }
               $("#matiere").html(contenu);
           });
        });
        
        $("#findEtudiant").click(function(e){
            e.preventDefault();
            var idClasse = $("#classe").val();
            var matricule = $("#matricule").val();
            var matiere = $("#matiere").val();
            var adresse = "modifCC?type=getNoteCC&classe="+idClasse+"&matiere="+matiere+"&matricule="+matricule;
            $.getJSON(adresse, function(data){
                //alert(data);
                $("#formNotes").html(data);
                $("#sendNote").fadeIn(1000);
                $("#note").keyup(function(e){
                    if(!$(this).val().match(/^[0-9]*[.]{0,1}[0-9]*$/)){
                        toastr["warning"]("Caractère non pris en compte");
                    }
                    else if($(this).val()>20){
                        toastr["warning"]("La note est /20");
                    }
                });
            });
        });
        
        $("#sendNote").click(function(e){
            e.preventDefault();
            //alert("click");
            var matricule = $("#matricule").val();
            var matiere = $("#matiere").val();
            var note = $("#note").val();
            var adresse = "modifCC?type=save&matiere="+matiere+"&matricule="+matricule+"&note="+note;
            var notCorrect = false;
            
            if(!$("#note").val().match(/^[0-9]*[.]{0,1}[0-9]*$/) || $("#note").val()>20){
                    notCorrect = true;
                toastr["error"]("Vérifiez vos champs");
            }
            if(!notCorrect){
                $.getJSON(adresse, function(data){
                    if(data == "true"){
                        toastr["info"]("Modification effectuée", "Info");
                    }
                    else
                    {
                        toastr["error"]("Un problème est survenu", "Info");
                    }
                });
            }
            //toastr["info"]("Voici mon toast", "Test");
            //alert("toast");
            toastr.options = {
              "closeButton": true,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-bottom-right",
              "preventDuplicates": false,
              "onclick": null,
              "showDuration": "300",
              "hideDuration": "1000",
              "timeOut": "5000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            };
        });
    });


    
</script>