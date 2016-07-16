<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header.jsp"></c:import>
<link href="toastr/toastr.css" rel="stylesheet" />

<div class="row-fluid sortable" style="alignment-adjust: rigth;">
    <div class="box span12">
        <div class="box-header" data-original-title>
            <h2><i class="halflings-icon calendar"></i><span class="break"></span>Délibérations</h2>
        </div>
        <div class="box-content">
            <div id="external-events" class="span3 hidden-phone hidden-tablet">
                <h4>MGP minimale</h4>
                <form action="#" method="post">
                    <input id="mgpMin" size="16" type="text" value="2.00"><br/>
                    <h4>Nbre max échec</h4>
                    <input id="nbEchecMax" size="16" type="text" value="1"><br/>
                    <button type="submit" class="btn btn-primary" id="getPV"><center>Valider</center></button>
                </form>
            </div>



            <div class="clearfix" style="width: 75%; float: right; margin-top: -10px; margin-right: -10px">


                <div class="row-fluid sortable">		
                    <div class="box span12">
                        <div class="box-header" data-original-title>
                            <h2><i class="halflings-icon user"></i><span class="break"></span>Procès-verbal</h2>
                            <div class="box-icon">
                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <form action="#" method="Post" id="formPV" style="max-width: 900px !important; overflow-x: auto !important;">
                                <div id="admis" class="row-fluid pv box span12 table-responsive">
                                   <!-- <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                        <thead>
                                            <tr>
                                                <th width=16%>Matricule</th>
                                                <th width=75%>Nom Prénom</th>
                                                <th width=10%>MGP</th>
                                                <th width=4%>AD/REF</th>
                                            </tr>
                                        </thead>   
                                        <tbody>

                                            <tr>
                                                <td height="10px">12Y192</td>
                                                <td class="center">KOUAKAM TIOJIP Ulrich Vaneck</td>
                                                <td><input type="text" id="test" value="1.8"></td>
                                                <td><center><input type="checkbox" id="12Y192" value="INF-419"></center></td>
                                            </tr>
                                        </tbody>
                                    </table>-->
                                </div>
                                <div id="delibere" class="row-fluid pv box span12 table-responsive"></div>
                                <div id="echec" class="row-fluid pv box span12 table-responsive"></div>
                                <center class="row-fluid box span12"><div id="page"></div></center>
                            <center><button type="submit" class="btn btn-primary" id="btSendNote">Valider</button></center>
                           </form>
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
<script src="toastr/pagination.js"></script>
<script>
    $(document).ready(function(){
       $("#admis").hide();
       $("#delibere").hide();
       $("#echec").hide();
       $("#btSendNote").hide();
       
       $("#getPV").click(function(e){
           e.preventDefault();
           
           var mgpMin = $("#mgpMin").val();
           var nbEchec = $("#nbEchecMax").val();
           
           if(mgpMin == "" || nbEchec == ""){
               toastr["warning"]("Remplissez les 2 champs svp", "Champ vide");
           }
           else{
               var adresse = "deliberation?type=getPV&mgpMin="+mgpMin+"&nbEchecMax="+nbEchec;
               $.getJSON(adresse, function(data){
                   $("#admis").html(data["admis"]);
                   $("#delibere").html(data["repeche"]);
                   $("#echec").html(data["echec"]);
                   
                   $("#admis").prepend("<h3>Liste des étudiants admis sans critères</h3>");
                   $("#delibere").prepend("<h3>Liste des étudiants admis à l'aide des critères</h3>");
                   $("#echec").prepend("<h3>Liste des étudiants non admis</h3>");
                   
                   $("#admis").show();
                   $("#delibere").show();
                   $("#echec").show();
                   
                   pagination(1,'.pv','#page',3);
                   
                   $(".note").attr("disabled", "true");
                   $(".input_delibere").removeAttr("disabled");
                   $(".repecher").change(function(e){
                        var matricule = $($($($(this).parent()[0]).parent()[0]).parent()[0]).attr("id");
                        if($(this).is(":checked")){
                            $("." + matricule).removeAttr("disabled");
                        }
                        else{
                            $("." + matricule).attr("disabled", "true");
                        }
                   });
                   
                   $("#btSendNote").fadeIn(2000);
                   
                   $(".note").keyup(function(e){
                       if(!$(this).val().match(/^[0-9]*[.]{0,1}[0-9]*$/)){
                            toastr["warning"]("Caractère non pris en compte");
                        }
                        else if($(this).val()>100){
                            toastr["warning"]("La note est /100");
                        }else{
                            var matricule = $($($(this).parent()[0]).parent()[0]).attr("id");
                            var i = 0, mgp=0;

                            $("." + matricule).each(function(){
                                 i++;
                                 mgp += calculMGP($(this).val()*1);
                             });

                             $("#mgp_"+matricule).text(mgp/i);
                         }
                   });
                   
                   
               });
           }
       });
       
       $("#btSendNote").click(function(e){
            e.preventDefault();
            //alert("begin");
            var notCorrect = false;
            $(".note").each(function(e){
               if(!($(this).val().match(/^[0-9]*[.]{0,1}[0-9]*$/)) || $(this).val()>100)
               {
                   notCorrect = true;
               }
            });
            if(notCorrect){
                toastr["error"]("Vérifiez vos champs");
            }
            else{
                var etudiants = document.getElementsByClassName("etudiant");
                data = "nbEtudiant=" + etudiants.length;
                for(var i = 0; i < etudiants.length; i++){
                    var matricule = $(etudiants[i]).attr("id");
                    //form.append("matricule_" + i, matricule);
                    data += "&matricule_"+ i + "=" + matricule;
                    var classes = $(etudiants[i]).attr("class").split(/\s/);
                    //form.append("choix_" + i, classes[classes.length-1]);
                    data += "&choix_"+ i + "=" + classes[classes.length-1];
                    var classMatricule = document.getElementsByClassName(matricule);
                    //form.append("nbMatiere_" + i, classMatricule.length);
                    data += "&nbMatiere_"+ i + "=" + classMatricule.length;
                    $("." + matricule).each(function(){
                        var idNote = $(this).attr("id").split("_");
                        //form.append("note_" + idNote[idNote.length-1], $(this).val()) ;
                        data += "&note_"+i+"_" + idNote[idNote.length-1] + "=" + $(this).val();
                    });
                }
                alert(data);
                $.ajax({
                    url: "deliberation?type=sendNote&"+data,
                    method: "GET",
                    contentType: false,
                    processData: false,
                    success: function(msg){
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
            
       function calculMGP(note) {
            var mgp;

            if(note<35){
                 mgp=0.0;
             }
            else if(note>=35 && note<40){
                 mgp=1.0;
             }   
             else if(note>=40 && note<45){
                 mgp=1.3;
             }
             else if(note>=45 && note<50){
                 mgp=1.7;
             }
             else if(note>=50 && note<55){
                 mgp=2.0;
             }
             else if(note>=55 && note<60){
                 mgp=2.3;
             }
             else if(note>=60 && note<65){
                 mgp=2.7;
             }
             else if(note>=65 && note<70){
                 mgp=3.0;
             }
             else if(note>=70 && note<75){
                 mgp=3.3;
             }
             else if(note>=75 && note<80){
                 mgp=3.7;
             }
             else
                 mgp=4.0;


             return mgp;
           }
           
       
    });
</script>