<%@page import="entities.Requete"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <!--<link rel="stylesheet" href="assets/css/bootstrap-3.3.2.min.css" />-->
        <style type="text/css">
            #dashboard [class *="col-"] {
                box-shadow: 2px 2px 2px 2px #e6e6e6;
                margin-bottom: 15px;
            }
            #dashboard [class *="col-lg-6"] {
                width: 45%;
            }
            #dashboard [class *="col-lg-6"]:last-child{
                margin-right: 0;
            }
            #dashboard [id *= "dashboardchart"] {
                width: 100%;
                height: 200px;
            }
            #dashboard ul{
                padding-left: 10px;
            }
            #dashboard  .canvasjs-chart-credit{
                display: none;
            }

        </style>
    </head>
    <body id="dashboard">
        <div class="container" >
            <h1>Dashboard</h1><hr/>
            <div class="col-lg-12" style="width: 97%">
                <h3>Requêtes non traitées</h3>
                <ul>
                    <%
                        List<Requete> requetes = (List<Requete>) request.getAttribute("listRequetesATraiter");
                        for (Requete r : requetes) {
                    %>
                    <li><%= r.getObjet()%></li>
                        <%
                            }
                        %> 
                </ul>        
            </div>
                <div class="col-lg-6" style="float: left">
                <h3>Nombre d'inscriptions par matière</h3>
                <div  id="dashboardchart1" ></div>
            </div>
            <div class="col-lg-6" style="margin-left: 2%; float: left">
                <h3>Requêtes non traitées par classe</h3>
                <div  id="dashboardchart2" ></div>
            </div>
        </div>

        <script src="toastr/jquery-2.1.0.js"></script>-->
<!--        <script src="assets/js/groupe4/groupe4.js"></script>
        <script src="assets/js/groupe4/canvasjs.min.js"></script>-->
        <script type="text/javascript">

            $(document).ready(function () {
                $("#dashboardchart1").chart("", <%= (String) request.getAttribute("inscritsParMatiere")%>);
                $("#dashboardchart2").chart("", <%= (String) request.getAttribute("requeteNonTraiter")%>);
            });
        </script>
