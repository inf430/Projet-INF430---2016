<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/header.jsp"></c:import>
<link href="toastr/toastr.css" rel="stylesheet" />
<div class="row-fluid sortable" style="alignment-adjust: rigth;">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon calendar"></i><span class="break"></span>Modification des notes d'examen</h2>
        </div>
        <div class="box-content">
            <div id="external-events" class="span3 hidden-phone hidden-tablet">
                <form action="#" method="post">
                    <center><select data-placeholder="Selectionner une matière" id="matiere" data-rel="chosen">
                         <c:forEach items="${ matieres }" var="matiere">
                            <option value="${ matiere.idmatiere }">${ matiere.code }</option>
                         </c:forEach>
                    </select>
                  <button type="submit" class="btn btn-primary" id="sendMatiere">Rechercher</button></center>
                </form>
            </div>



            <div class="clearfix" style="width: 75%; float: right; margin-top: -10px; margin-right: -10px">


                <div class="row-fluid sortable">		
                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2><i class="halflings-icon user"></i><span class="break"></span>Liste des membres</h2>
                            <div class="box-icon">
                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <form action="#" method="Post" id="formNotes">
                         <!--   <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                <thead>
                                    <tr>
                                        <th width=5%>Matricule</th>
                                        <th width=35%>Nom et Prénom</th>
                                        <th width=15%>Niveau</th>
                                        <th width=15%>CC/TP /30</th>
                                        <th width=15%>Examen /70</th>
                                        <th width=15%>Total /100</th>
                                    </tr>
                                </thead>   
                                <tbody>

                                    <tr class="etudiant" id="12Y192">
                                        <td>12Y192</td>
                                        <td class="center">KOUAKAM TIOJIP Ulrich Vaneck</td>
                                        <td>Niveau 4</td>
                                        <td height="5px">
                                            <input class="note cc" onChange="verinotes('formNotes','12Y192')" maxlength=5 style=" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;" type="text" name="cc_12Y192" id="cc_12Y192" value="10"  />
                                        </td>
                                        <td height="5px">
                                            <input class="note exam" onChange="verinotes('formNotes','12Y192')" maxlength=5 style=" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;" type="text" name="exam_12Y192" id="exam_12Y192" value="10"  />
                                        </td>
                                        <td height="5px">
                                            <input onChange="verinotes('formNotes','12Y192')" maxlength=5 style=" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;" type="text" name="total_12Y192" id="total_12Y192" value="10" disabled="true"  />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>  
                                -->
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
        for(var i=0; i<=70 ; i=i+0.25){
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
        
        $("#sendMatiere").click(function(e){
           e.preventDefault();
           var idMatiere = $("#matiere").val();
           var adresse = "examen?type=getNotes&idMatiere=" + idMatiere;
           $.getJSON(adresse, function(data){
               $("#formNotes").html(data["result"]);
               var notes = document.getElementsByClassName("note");
                for(var i = 0; i < notes.length; i++){
                    notes[i].addEventListener("keyup", function(e){
                        var classes = $(this).attr("class").split(/\s/);
                        var type = classes[classes.length-1];
                        if(!$(this).val().match(/^[0-9]*[.]{0,1}[0-9]*$/)){
                            toastr["warning"]("Caractère non pris en compte");
                        }
                        else if(($(this).val()>70 && type=="exam") || ($(this).val()>30 && type=="tp") || ($(this).val()>30 && type=="cc")){
                            toastr["warning"]("Vous avez débordez la note max");
                        }else{
                            var matricule = $($($(this).parent()[0]).parent()[0]).attr("id");
                            var noteCC = $("#cc_" + matricule).val();
                            var noteTP = $("#tp_" + matricule).val();
                            var noteExam = $("#exam_" + matricule).val();

                            $("#total_" + matricule).val(noteCC*1 + noteExam*1);
                        }
                    });
                }
                $("#sendNote").fadeIn(2000);
           });
        });
        
        $("#sendNote").click(function(e){
            e.preventDefault();
            
            var notCorrect = false;
            $(".note").each(function(e){
                var classes = $(this).attr("class").split(/\s/);
                var type = classes[classes.length-1];
                if(!$(this).val().match(/^[0-9]*[.]{0,1}[0-9]*$/) || ($(this).val()>70 && type=="exam") || ($(this).val()>30 && type=="tp") || ($(this).val()>30 && type=="cc"))
                {
                    notCorrect = true;
                }
            });
            if(notCorrect){
                toastr["error"]("Vérifiez vos champs");
            }
            else{

                var etudiants = document.getElementsByClassName("etudiant");
                var form = new FormData();
                //alert("pret");
                form.append("nb", 10);
                var data = "nbEtudiant=" + etudiants.length;
                data += "&idMatiere=" + $("#matiere").val();
                data += "&isTP=" + $("#isTP").val();
                data += "&typeExam=" + $("#typeExam").val();
                var donnees = {nbEtudiant : etudiants.length, idMatiere : $("#matiere").val()};
                //form.
                form.append("nbEtudiant", etudiants.length);
                for(var i = 0; i < etudiants.length; i++){
                    data += "&" + "matricule_" + i + "=" + $(etudiants[i]).attr("id");
                    data += "&" + "cc_" + i + "=" + $("#cc_" + $(etudiants[i]).attr("id")).val();
                    data += "&" + "exam_" + i + "=" + $("#exam_" + $(etudiants[i]).attr("id")).val();
                    data += "&" + "anonymat_" + i + "=" + $("#anonymat_" + $(etudiants[i]).attr("id")).text();

                    donnees["matricule_" + i] = $(etudiants[i]).attr("id");
                    donnees["cc_" + i] = $("#cc_" + $(etudiants[i]).attr("id")).val();
                    donnees["exam_" + i] = $("#exam_" + $(etudiants[i]).attr("id")).val();

                    form.append("matricule_" + i, $(etudiants[i]).attr("id"));//alert(i);
                    form.append("cc_" + i, $("#cc_" + $(etudiants[i]).attr("id")).val());
                    //form.append("tp_" + i, $("#tp_" + $(etudiants[i]).attr("id")).val());
                    form.append("exam_" + i, $("#exam_" + $(etudiants[i]).attr("id")).val());
                }
                //alert("envoi");
               /* $.post("examen", form, function(data){
                    if(data==true)
                        {
                            toastr["info"]("Modification effectuée", "Info");
                        }
                        else
                        {
                            toastr["error"]("Un problème est survenu", "Info");
                        }
                }, 'text');*/

                $.ajax({
                    url: "examen?type=sendNote&"+data,
                    method: "GET",
                    contentType: false,
                    processData: false,
                    success: function(msg){
                        //alert(msg);
                        if(msg=="true")
                        {
                            toastr["info"]("Modification effectuée", "Info");
                        }
                        else
                        {
                            toastr["error"]("Un problème est survenu", "Info");
                        }
                    }
                });
            }
        });
        
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
    
</script>