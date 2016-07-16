
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="fr">
    <head>

        <!-- start: Meta -->
        <meta charset="utf-8">
        <title>Administration</title>
        <!-- start: Mobile Specific -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- end: Mobile Specific -->

        <!-- start: CSS -->

        <link id="bootstrap-style" href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link id="base-style" href="assets/css/style.css" rel="stylesheet">
        <link id="base-style-responsive" href="assets/css/style-responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="assets/img/favicon.ico">
        <!-- start: Header -->

    </head>
    <body>
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <img src="assets/img/logoApp.png" alt="img" width="35" align="left"/>
                    <a class="brand" href="#"><span class="hidden-tablet" size="1em">SYGENUY1</span></a>

                    <!-- start: Header Menu -->
                    <div class="nav-no-collapse header-nav">
                        <ul class="nav pull-right">
                            <!-- start: User Dropdown -->
                            <li class="dropdown">
                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="halflings-icon white user"></i><%
                                        out.print(session.getAttribute("login"));%>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-menu-title">
                                        <span>Parametres de compte</span>
                                    </li>
                                    <li><a href="deconnexion"><i class="halflings-icon off"></i>Deconnexion</a></li>
                                </ul>
                                <img src="assets/img/logo_lycee.jpg" alt="img" width="35" align="right" class="img-circle"/>
                            </li>
                            <!-- end: User Dropdown -->
                        </ul>
                    </div>
                    <!-- end: Header Menu -->

                </div>
            </div>
        </div>
        <!-- start: Header -->

        <div class="container-fluid-full">
            <div class="row-fluid">

                <!-- start: Main Menu -->
                <div id="sidebar-left" class="span2">
                    <div class="nav-collapse sidebar-nav">
                        <ul class="nav nav-tabs nav-stacked main-menu">
                            <li><a href="#" class="dropmenu"><i class="icon-home" id="b1"></i><span class="hidden-tablet">Acceuil Administration</span></a></li>
                            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">Enregistrements</span><i class="icon-caret-down" id="b2"></i></a>
                                <ul>
                                    <li><a class="submenu" href="createteacher?menu=Nouveau enseignant"><i class="icon-file-alt"></i><span class="hidden-tablet">creer un enseignant</span></a></li>
                                    <li><a class="submenu" href="createstudent?menu=Nouveau etudiant"><i class="icon-file-alt"></i><span class="hidden-tablet">creer un etudiant</span></a></li>
                                    <li><a class="submenu" href="createadministratif?menu=Nouveau personnel administratif"><i class="icon-file-alt"></i><span class="hidden-tablet">creer un personnel administratif</span></a></li>
                                    <li><a class="submenu" href="addadministrateur?menu=Nouvel administrateur"><i class="icon-file-alt"></i><span class="hidden-tablet">creer un administrateur</span></a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">Droits</span><i class="icon-caret-down" id="b2"></i></a>
                                <ul>
                                    <li><a class="submenu" href="createdroit?menu=Nouveau droit"><i class="icon-file-alt"></i><span class="hidden-tablet">creer un droit</span></a></li>
                                    <li><a class="submenu" href="listedroit?menu=liste des droits"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des droits</span></a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="dropmenu"><i class="icon-edit"></i><span class="hidden-tablet">Role</span><i class="icon-caret-down" id="b3"></i></a>
                                <ul>
                                    <li><a class="submenu" href="createrole?menu=Nouveau role"><i class="icon-file-alt"></i><span class="hidden-tablet">creer un role</span></a></li>
                                    <li><a class="submenu" href="addroleperson?menu=donner un role"><i class="icon-file-alt"></i><span class="hidden-tablet">donner un role</span></a></li>
                                    <li><a class="submenu" href="roleright?menu=donner un droit au role"><i class="icon-file-alt"></i><span class="hidden-tablet">ajouter un droit au role</span></a></li>
                                    <li><a class="submenu" href="listerole?menu=liste des roles"><i class="icon-file-alt"></i><span class="hidden-tablet">liste des roles</span></a></li>
                                </ul>
                            </li>
                            <li><a href="deconnexion"><i class="icon-lock" id="b1"></i><span class="hidden-tablet"> Deconnexion</span></a></li>
                        </ul>
                    </div>
                </div>  
                <!-- end: Main Menu -->

                <!-- start: Content -->
                <div id="content" class="span10">
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="#">Acceuil</a> 
                            <i class="icon-angle-right"></i><a href="#" class="active">
                                <% if (request.getAttribute("menu") != "Accueil") {
                                        out.println(request.getAttribute("menu"));
                                    } else {
                                        out.println("Acceuil Administration");
                                    }
                                %>
                            </a>
                        </li>
                    </ul>
                    <% if (request.getAttribute("menu") != null) {
                            if (request.getAttribute("menu").equals("Nouveau etudiant")) {%>
                    <jsp:include page="nouvel_etudiant.jsp"></jsp:include>
                    <%}
                        if (request.getAttribute("menu").equals("Nouveau enseignant")) {%>
                    <jsp:include page="nouvel_enseignant.jsp"></jsp:include>
                    <%}
                        if (request.getAttribute("menu").equals("Nouveau role")) {%>
                    <jsp:include page="nouveau_role.jsp"></jsp:include>
                    <%}
                        if (request.getAttribute("menu").equals("Nouveau personnel administratif")) {%>
                    <jsp:include page="nouvel_administratif.jsp"></jsp:include>
                    <%}
                        if (request.getAttribute("menu").equals("Nouveau droit")) {%>
                    <jsp:include page="nouveau_droit.jsp"></jsp:include>
                    <%}
                        if (request.getAttribute("menu").equals("Nouvel administrateur")) {%>
                    <jsp:include page="add_admin.jsp"></jsp:include>
                    <%}
                      if (request.getAttribute("menu").equals("liste des droits")) {%>
                      <jsp:include page="liste_des_droits.jsp"></jsp:include>
                    <%}
                      if(request.getAttribute("menu").equals("donner un role")){%>
                      <jsp:include page="add_role_person.jsp"></jsp:include>
                      <%}
                     if(request.getAttribute("menu").equals("donner un droit au role")){%>
                     <jsp:include page="associate_role_right.jsp"></jsp:include>
                     <%}
                     if(request.getAttribute("menu").equals("liste des roles")){%>
                     <jsp:include page="liste_des_roles.jsp"></jsp:include>
                     <%}
                    
                    } else {
                    %>
                    <jsp:include page="acceuil_default.jsp"></jsp:include>
                    <%}%>

                </div><!--/fluid-row-->
                <footer class="row navbar navbar-default navbar-fixed">
                    <center>
                        <p>
                            plate forme de gestion des notes de l'UY1.<br/>
                            <span><a href="#">SYGENUY1 </a>powered by Master 1 computer sciences students&copy; 2016</span>

                        </p>
                    </center>
                </footer>



                <!-- start: JavaScript-->

                <script src="assets/js/jquery-1.9.1.min.js"></script>
                <script src="assets/js/jquery-migrate-1.0.0.min.js"></script>
                <script src="assets/js/jquery-ui-1.10.0.custom.min.js"></script>
                <script src="assets/js/jquery.ui.touch-punch.js"></script>
                <script src="assets/js/modernizr.js"></script>
                <script src="assets/js/bootstrap.min.js"></script>
                <script src="assets/js/jquery.cookie.js"></script>
                <script src='assets/js/fullcalendar.min.js'></script>
                <script src='assets/js/jquery.dataTables.min.js'></script>
                <script src="assets/js/excanvas.js"></script>
                <script src="assets/js/jquery.flot.js"></script>
                <script src="assets/js/jquery.flot.pie.js"></script>
                <script src="assets/js/jquery.flot.stack.js"></script>
                <script src="assets/js/jquery.flot.resize.min.js"></script>
                <script src="assets/js/jquery.chosen.min.js"></script>
                <script src="assets/js/jquery.uniform.min.js"></script>
                <script src="assets/js/jquery.cleditor.min.js"></script>
                <script src="assets/js/jquery.noty.js"></script>
                <script src="assets/js/jquery.elfinder.min.js"></script>
                <script src="assets/js/jquery.raty.min.js"></script>
                <script src="assets/js/jquery.iphone.toggle.js"></script>
                <script src="assets/js/jquery.uploadify-3.1.min.js"></script>
                <script src="assets/js/jquery.gritter.min.js"></script>
                <script src="assets/js/jquery.imagesloaded.js"></script>
                <script src="assets/js/jquery.masonry.min.js"></script>
                <script src="assets/js/jquery.knob.modified.js"></script>
                <script src="assets/js/jquery.sparkline.min.js"></script>
                <script src="assets/js/counter.js"></script>
                <script src="assets/js/retina.js"></script>
                <script src="assets/js/custom.js"></script>
                <!-- end: JavaScript-->

                </body>
                </html>

