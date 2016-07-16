<%@page import="entities.Personne"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <jsp:include page="../header.jsp"></jsp:include>
        <!-- start: Header -->

<script type="text/javascript">
    $(document).ready(function(){
            hidedata();
           
        });
        
        function showannee(){
            $("#matieres").hide();  
            $("#filieres").hide();
             $("#niveaux").hide();
             $("#departements").hide();
             $("#annees").show();
        }
        function showmatiereannee() {
            $("#matieres").show();  
            $("#filieres").show();
             $("#niveaux").show();
             $("#departements").hide();
             $("#annees").show();
        }
        function showdepart(){
            $("#matieres").hide();  
            $("#filieres").hide();
             $("#niveaux").hide();
            $("#departements").show();
            $("#annees").hide();
        }
        function showfiliereniveauannee(){
             $("#filieres").show();
             $("#niveaux").show();
             $("#annees").show();
             $("#matieres").hide();
             $("#departements").hide();
        }
        function hidedata() {
           $("#departements").hide();
           $("#matieres").hide(); 
           $("#filieres").hide();
           $("#niveaux").hide();
           $("#annees").hide();
        
        }
        </script>
            <!-- start: Content -->
            


                
                <% if (request.getAttribute("menu") != null) {
                        if (request.getAttribute("menu").equals("Nouvelle matiere")) {
                %> 
                <jsp:include page="groupe1/nouvelle_matiere.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("Nouvelle unite d'enseignement")) {%>
                <jsp:include page="groupe1/nouvelle_ue.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("Associer matiere-examen")) {%>
                <jsp:include page="groupe1/add_matieres_exam.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("Ajout de matiere a l'ue")) {%>
                <jsp:include page="groupe1/add_matieres_ue.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("Ajout d'un examen")) {%>
                <jsp:include page="groupe1/nouvel_examen.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des matieres")) {%>
                <jsp:include page="groupe1/liste_matieres.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("nouvelle annee")) {%>
                <jsp:include page="groupe1/nouvelle_annee.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des ues")) {%>
                <jsp:include page="groupe1/liste_ues.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("nouveau departement")) {%>
                <jsp:include page="groupe1/nouveau_departement.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("associer ue-classe")) {%>
                <jsp:include page="groupe1/associate_ue_classe.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("inscription etudiant")) {%>
                <jsp:include page="groupe1/add_etudiant_classe.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des examens")) {%>
                <jsp:include page="groupe1/liste_des_examen.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des enseignants")) {%>
                <jsp:include page="groupe1/liste_enseignant_dept.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des etudiants")) {%>
                <jsp:include page="groupe1/liste_etudiants.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("attribution de matiere")) {%>
                <jsp:include page="groupe1/add_enseignant_matieres.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des departements")) {%>
                <jsp:include page="groupe1/liste_departement.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des niveaux")) {%>
                <jsp:include page="groupe1/liste_niveaux.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("nouveau niveau")) {%>
                <jsp:include page="groupe1/nouveau_niveau.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("liste des classes")) {%>
                <jsp:include page="groupe1/liste_classes.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("nouvelle classe")) {%>
                <jsp:include page="groupe1/add_classe.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("nouvelle_filiere")) {%>
                <jsp:include page="groupe1/nouvelle_filiere_dep.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("nouveau chef de departement")) {%>
                <jsp:include page="groupe1/nommer_chef_departement.jsp"></jsp:include>
                <%}
                    if (request.getAttribute("menu").equals("ajouter une filiere")) {%>
                <jsp:include page="groupe1/nouvelle_filiere.jsp"></jsp:include>
                <%}
                } else {
                %>
                <jsp:include page="groupe4/dashboard.jsp"></jsp:include>
                <%}
                %>

            </div><!--/fluid-row-->
            <jsp:include page="../footer.jsp"></jsp:include>
            <!-- start: JavaScript-->



            <script src="./assets/js/groupe4/canvasjs.min.js"></script>
            <script src="./assets/js/groupe4/groupe4.js"></script>

            <script src="assets/js/groupe1/jquery.dataTables.js"></script>
