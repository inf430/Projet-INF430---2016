<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- start: Meta -->
        <meta charset="utf-8">
        <title>Acceuil</title>
        <!-- start: Mobile Specific -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- end: Mobile Specific -->

        <!-- start: CSS -->
        <link id="bootstrap-style" href="./assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link id="base-style" href="./assets/css/style.css" rel="stylesheet">
        <link id="base-style-responsive" href="./assets/css/style-responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="./assets/img/favicon.ico">
        <script src="./toastr/jquery-2.1.0.js"></script>
     
    </head>
    <!-- start: Header -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <img src="./assets/img/logoApp.png" alt="img" width="35" align="left"/>
                <a class="brand" href="index.html"><span class="hidden-tablet" size="1em">SYGENUY1</span></a>

                <!-- start: Header Menu -->
                <div class="nav-no-collapse header-nav">
                    <ul class="nav pull-right">
                        <!-- start: User Dropdown -->
                        <li class="dropdown">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="halflings-icon white user"></i>
                                <% out.print(session.getAttribute("nom"));
                                   out.print(session.getAttribute("prenom"));
                                %>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-menu-title">
                                    <span>Parametres de compte</span>
                                </li>
                                <li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>
                                <li><a href="deconnexion"><i class="halflings-icon off"></i>Deconnexion</a></li>
                            </ul>
                            <img src="./assets/img/logo_lycee.jpg" alt="img" width="35" align="right" class="img-circle"/>
                        </li>
                        <!-- end: User Dropdown -->
                    </ul>
                </div>
                <!-- end: Header Menu -->

            </div>
        </div>
    </div>
                                
                                
        <div class="container-fluid-full">
            <div class="row-fluid">

                <!-- start: Main Menu -->
            <%
                if (session.getAttribute("type").equals("etudiant")) {
            %>
            <jsp:include page="menuEtudiant.jsp"></jsp:include>
            <%   } else if (session.getAttribute("type").equals("enseignant")) {
            %> 
            <jsp:include page="menuEnseignant.jsp"></jsp:include>
            <%
            } else if (session.getAttribute("type").equals("chefDepartement")) {
            %>
            <jsp:include page="menuChefDepartement.jsp"></jsp:include>
            <%
            } else if (session.getAttribute("type").equals("jury")) {
            %>
            <jsp:include page="menuJury.jsp"></jsp:include>
            <%  } else {
            %>
            <jsp:include page="menuAdministraif.jsp"></jsp:include>
            <% }
            %>
            <!-- end: Main Menu -->
        
            <div id="content" class="span10">
               <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="#">Acceuil</a> 
                        <i class="icon-angle-right"></i>
                        <% String p = (String) session.getAttribute("type");
                            if (p.equals("etudiant")) {
                                out.print("Etudiant");
                            } else if (p.equals("enseignant")) {
                                out.print("enseignant");
                            } else if (p.equals("administratif")) {
                                out.print("personnel administratif");
                            }
                            else{
                                //out.print(session.getAttribute("title").toString());
                            }
                        %>
                    </li>
                </ul>