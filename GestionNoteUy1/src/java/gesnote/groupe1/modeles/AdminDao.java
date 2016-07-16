/*
 * @author groupe1
 */
package gesnote.groupe1.modeles;

import entities.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Vector;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/**
 *
 * @author groupe1
 */
@Stateless
public class AdminDao {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    public boolean exist(String login, String password) {

        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT u FROM Personne u where u.login =:login AND u.password =:password";
        String sql1 = "SELECT a FROM Administrateur a WHERE a.login =:login AND a.password =:password";

        Query requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);

        try {
            Personne p = null;
            p = (Personne) requete.getSingleResult();
            return true;
        } catch (NoResultException e) {
            Query requete1 = em.createQuery(sql1);
            requete1.setParameter("login", login);
            requete1.setParameter("password", password);
            Administrateur admin = null;
            try {
                admin = (Administrateur) requete1.getSingleResult();
                return true;
            } catch (NoResultException ex) {

            }

        }
        return false;
    }

    public boolean existMatriculeEtudiant(String matricule) {
        String sql = " SELECT e FROM Etudiant e WHERE e.matricule =:matricule";
        Query requete = em.createQuery(sql);
        requete.setParameter("matricule", matricule);
        Etudiant etudiant;
        try {
            etudiant = (Etudiant) requete.getSingleResult();
        } catch (NoResultException e) {
            return false;
        }
        return true;
    }

    public boolean existMatriculeEnseignant(String matricule) {
        String sql = " SELECT e FROM Enseignant e WHERE e.matricule =:matricule";
        Query requete = em.createQuery(sql);
        requete.setParameter("matricule", matricule);
        Enseignant enseignant;
        try {
            enseignant = (Enseignant) requete.getSingleResult();
        } catch (NoResultException e) {
            return false;
        }
        return true;
    }

    public boolean isAdmin(String login, String password) {
        String sql = "SELECT a FROM Administrateur a WHERE a.login =:login AND a.password =:password";
        Query requete1 = em.createQuery(sql);
        requete1.setParameter("login", login);
        requete1.setParameter("password", password);
        Administrateur admin = null;
        try {
            admin = (Administrateur) requete1.getSingleResult();
            return true;
        } catch (NoResultException ex) {

        }
        return false;
    }

    public Personne getPersonne(String login, String password) {

        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT u FROM Personne u where u.login =:login AND u.password =:password";

        Query requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);
        Personne personne = new Personne();
        try {
            personne = (Personne) requete.getSingleResult();
        } catch (NoResultException exception) {
        }
        return personne;
    }

    public Administrateur getAdmin(String login, String password) {

        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT a FROM Administrateur a where a.login =:login AND  a.password =:password";

        Query requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);
        Administrateur admin = null;
        try {
            admin = (Administrateur) requete.getSingleResult();
        } catch (NoResultException exception) {
        }
        return admin;
    }

    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public JSONObject objectToJSONObject(Object object) {
        Object json = null;
        JSONObject jsonObject = null;
        try {
            json = new JSONTokener(object.toString()).nextValue();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (json instanceof JSONObject) {
            jsonObject = (JSONObject) json;
        }
        return jsonObject;
    }

    public JSONArray objectToJSONArray(Object object) {
        Object json = null;
        JSONArray jsonArray = null;
        try {
            json = new JSONTokener(object.toString()).nextValue();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (json instanceof JSONArray) {
            jsonArray = (JSONArray) json;
        }
        return jsonArray;
    }

    public Departement getDepartement(int id) {
        String sql = " SELECT d FROM Departement d WHERE d.iddepartement =:iddepartement";
        Query requete = em.createQuery(sql);
        requete.setParameter("iddepartement", id);
        Departement departement = null;
        try {
            departement = (Departement) requete.getSingleResult();
        } catch (NoResultException e) {
        }
        return departement;
    }

    public boolean addTeacher(String matricule, String grade, String specialite, String nom, String prenom, String dateNaiss, String lieuNaiss, String sexe, String login, String password, String statut, String numtel, int depart) {
        Departement departement = this.getDepartement(depart);
        Enseignant enseignant = new Enseignant();
        enseignant.setGrade(grade);
        enseignant.setSpecialite(specialite);
        enseignant.setMatricule(matricule);
        enseignant.setIddepartement(departement);
        Personne personne = new Personne();
        personne.setLogin(login);
        personne.setPassword(password);
        personne.setDatenaiss(dateNaiss);
        personne.setLieunaiss(lieuNaiss);
        personne.setStatut("enseignant");
        personne.setNumtel(numtel);
        personne.setPrenom(prenom);
        personne.setNom(nom);
        personne.setSexe(sexe.charAt(0));
        Role role = this.getRoleByCode("enseignant");
        try {
            em.persist(personne);
            em.persist(enseignant);
            em.flush();
            enseignant.setIdpersonne(personne);
            enseignant.getRoleList().add(role);
            personne.setEnseignant(enseignant);
            em.flush();
        } catch (Exception ex) {
            return false;
        }

        return true;
    }

    public boolean addStudent(String matricule, String nom, String prenom, String dateNaiss, String lieuNaiss, String sexe, String login, String password, String numTel) {
        Etudiant student = new Etudiant();
        Personne person = new Personne();

        person.setLieunaiss(lieuNaiss);
        person.setDatenaiss(dateNaiss);
        person.setLogin(login);
        person.setPassword(password);
        person.setNom(nom);
        person.setPrenom(prenom);
        person.setSexe(sexe.charAt(0));
        person.setNumtel(numTel);
        person.setStatut("etudiant");
        student.setMatricule(matricule);
        student.setIdpersonne(person);
        person.setEtudiant(student);
        Role role = this.getRoleByCode("etudiant");

        try {
            em.persist(person);
            em.persist(student);
            em.flush();
            student.getRoleList().add(role);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    public boolean addAdministratif(String nom, String prenom, String dateNaiss, String lieuNaiss, String sexe, String login, String password, String numTel) {
        Administratif administratif = new Administratif();
        Personne person = new Personne();

        person.setLieunaiss(lieuNaiss);
        person.setDatenaiss(dateNaiss);
        person.setLogin(login);
        person.setPassword(password);
        person.setNom(nom);
        person.setPrenom(prenom);
        person.setSexe(sexe.charAt(0));
        person.setNumtel(numTel);
        person.setStatut("administratif");
        administratif.setIdpersonne(person);
        person.setAdministratif(administratif);
        Role role = this.getRoleByCode("etudiant");

        try {
            em.persist(person);
            em.persist(administratif);
            em.flush();
            administratif.getRoleList().add(role);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    public boolean addSemester(String semestre) {
        Semestre semester = new Semestre();
        AnneeAcademique year = this.getAnneeActive();

        semester.setSemestre(semestre);
        semester.setAnnee(year);

        try {
            em.persist(semester);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public AnneeAcademique getAnneeActive() {
        String sql = "SELECT a FROM AnneeAcademique a WHERE a.etat =:active ";
        Query requete = em.createQuery(sql);
        requete.setParameter("active", "en_cours");
        AnneeAcademique annee = null;
        try {
            annee = (AnneeAcademique) requete.getSingleResult();
        } catch (NoResultException e) {

        }
        return annee;

    }

    public boolean addExam(String dateprevue, String type) {
        Examen exam = new Examen();
        exam.setDateExam(dateprevue);
        exam.setTypeExam(type);

        try {
            em.persist(exam);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Departement> getListeDepartement() {

        return (List<Departement>) em.createQuery("select d from Departement d").getResultList();

    }

    public List<Semestre> getListeSemestre() {

        return (List<Semestre>) em.createQuery("select s from Semestre s").getResultList();

    }

    public List<Filiere> getListeFiliere() {
        return (List<Filiere>) em.createQuery("select f from Filiere f").getResultList();
    }

    public List<Examen> getListeExamen() {

        return (List<Examen>) em.createQuery("select e from Examen e").getResultList();
    }

    public List<Matiere> getListeMatiere() {

        return (List<Matiere>) em.createQuery("select m from Matiere m").getResultList();
    }

    public List<Ue> getListeUe() {
        return (List<Ue>) em.createQuery("select u FROM Ue u ").getResultList();
    }

    public Examen getExamenByPK(int idExamen) {
        String sql = "SELECT ex FROM Examen ex  WHERE ex.idexamen =:idexamen";
        Query requete = em.createQuery(sql);
        requete.setParameter("idexamen", idExamen);
        return (Examen) requete.getSingleResult();
    }

    public Semestre getSemestreByPK(int idSemestre) {
        String sql = "SELECT s FROM Semestre  s  WHERE s.idsemestre =:idsemestre ";
        Query requete = em.createQuery(sql);
        requete.setParameter("idsemestre", idSemestre);
        return (Semestre) requete.getSingleResult();
    }

    public Matiere getMatiereByPK(int idMatiere) {
        String sql = "SELECT  m FROM Matiere m WHERE m.idmatiere =:idmatiere ";
        Query requete = em.createQuery(sql);
        requete.setParameter("idmatiere", idMatiere);
        return (Matiere) requete.getSingleResult();
    }

    public Departement getDepartementByPK(int idDepartement) {
        String sql = "select d from Departement d where d.iddepartement =:idDepartement ";
        Query requete = em.createQuery(sql);
        requete.setParameter("idDepartement", idDepartement);
        return (Departement) requete.getSingleResult();
    }

    public Ue getUeByPK(String code) {
        String sql = "select u from Ue u where u.code =:code ";
        Query requete = em.createQuery(sql);
        requete.setParameter("code", code);
        return (Ue) requete.getSingleResult();
    }

    public Role getRoleByPK(int idRole) {
        String sql = "SELECT r FROM Role r WHERE r.idrole =:idRole ";
        Query requete = em.createQuery(sql);
        requete.setParameter("idRole", idRole);
        return (Role) requete.getSingleResult();
    }

    public boolean addMatiere(String code, String libelle) {
        Matiere mat = new Matiere();
        mat.setCode(code);
        mat.setLibelle(libelle);
        try {
            em.persist(mat);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean addUe(int idSemestre, String code, String libelle) {
        Ue ue = new Ue();
        Semestre sem = this.getSemestreByPK(idSemestre);
        ue.setLibelle(libelle);
        ue.setCode(code);
        ue.setIdsemestre(sem);

        try {
            em.persist(ue);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Droit getDroitByPK(int idDroit) {
        String sql = "SELECT  d FROM Droit d  WHERE d.iddroit =:idDroit ";
        Query requete = em.createQuery(sql);
        requete.setParameter("idDroit", idDroit);
        return (Droit) requete.getSingleResult();
    }

    public Enseignant getEnseignantByLogin(String login) {
        Query req = em.createQuery("select ens from Enseignant ens join ens.idpersonne p where p.login = :login");
        req.setParameter("login", login);
        return (Enseignant) req.getSingleResult();
    }

    public ArrayList<Matiere> getMatiereUe(String codeUe) {
        Ue ue = this.getUeByPK(codeUe);
        Vector<MatiereUe> matiereue = this.getMatiereUeForUe(codeUe);
        ArrayList<Matiere> resultat = new ArrayList<>();
        for (MatiereUe courant : matiereue) {
            resultat.add(courant.getIdmatiere());
        }
        return resultat;
    }

    public boolean associateUematiere(int idMatiere, String code, int credit) {
        MatiereUe matue = new MatiereUe();
        Matiere mat = this.getMatiereByPK(idMatiere);
        if (!this.existAssocMatUe(code, idMatiere)) {
            Ue ue = this.getUeByPK(code);
            matue.setCode(ue);
            matue.setIdmatiere(mat);
            matue.setCredit(credit);
            matue.setAnnee(this.getAnneeActive());

            try {
                em.persist(matue);
                em.flush();
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }

    public boolean addFiliere(int idDepartement, String code, String libelle) {
        Filiere speciality = new Filiere();
        Departement dep = this.getDepartementByPK(idDepartement);
        speciality.setCode(code);
        speciality.setLibelle(libelle);
        speciality.setIddepartement(dep);

        try {
            em.persist(speciality);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    public boolean addDepartement(String code, String libelle) {
        Departement dep = new Departement();
        dep.setCode(code);
        dep.setLibelle(libelle);

        try {
            em.persist(dep);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean addYear(String annee) {
        AnneeAcademique active = this.getAnneeActive();
        if (active != null) {
            active.setEtat("annee_passee");
        }
        AnneeAcademique year = new AnneeAcademique();
        year.setAnnee(annee);
        year.setEtat("en_cours");

        try {
            em.persist(year);
            em.flush();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean existAnnee(String annee) {
        String sql = " SELECT a FROM AnneeAcademique a WHERE a.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("annee", annee);
        try {
            requete.getSingleResult();
        } catch (NoResultException e) {
            return false;
        }
        return true;
    }

    public boolean existAssocMatUe(String codeUe, int idMatiere) {
        AnneeAcademique active;
        if ((active = this.getAnneeActive()) == null) {
            return false;
        }
        String sql = " SELECT matue FROM MatiereUe matue WHERE matue.idmatiere =:idmatiere AND matue.code =:code AND matue.annee =:annee";
        Query requete = em.createQuery(sql);
        Ue ue = this.getUeByPK(codeUe);
        Matiere matiere = this.getMatiereByPK(idMatiere);
        requete.setParameter("idmatiere", matiere);
        requete.setParameter("code", ue);
        requete.setParameter("annee", active);
        MatiereUe matue;
        try {
            matue = (MatiereUe) requete.getSingleResult();
        } catch (NoResultException e) {
            return false;
        }
        return true;
    }

    public Vector<MatiereUe> getMatiereUeForUe(String code) {
        AnneeAcademique active;
        if ((active = this.getAnneeActive()) == null) {
            return new Vector<>();
        }
        Vector<MatiereUe> resultat = new Vector<>();
        String sql = " SELECT matue FROM MatiereUe matue WHERE matue.code =:code AND matue.annee =:annee";
        Query requete = em.createQuery(sql);
        Ue ue = this.getUeByPK(code);
        requete.setParameter("code", ue);
        requete.setParameter("annee", active);
        try {
            resultat = (Vector<MatiereUe>) requete.getResultList();
        } catch (NoResultException e) {

        }
        return resultat;
    }

    public boolean existAssocMatiereExam(int idMatiere, int idExam) {
        AnneeAcademique annee;
        if ((annee = this.getAnneeActive()) == null) {
            return false;
        }
        Matiere matiere = this.getMatiereByPK(idMatiere);
        Examen examen = this.getExamenByPK(idExam);
        String sql = " SELECT matexam FROM MatiereExam matexam WHERE matexam.idmatiere =:idmatiere AND matexam.idexamen =:idexamen AND matexam.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("idmatiere", matiere);
        requete.setParameter("idexamen", examen);
        requete.setParameter("annee", annee);
        try {
            requete.getSingleResult();
            return true;
        } catch (NoResultException e) {

        }
        return false;
    }

    public boolean associateExamMatter(int idMatiere, int idExamen, double pourcentage) {
        if (!this.existAssocMatiereExam(idMatiere, idExamen)) {
            MatiereExam matiereexam = new MatiereExam();
            Matiere matiere = this.getMatiereByPK(idMatiere);
            Examen examen = this.getExamenByPK(idExamen);
            AnneeAcademique annee = this.getAnneeActive();
            matiereexam.setAnnee(annee);
            matiereexam.setIdexamen(examen);
            matiereexam.setIdmatiere(matiere);
            matiereexam.setPourcentage(pourcentage);
            try {
                em.persist(matiereexam);
                em.flush();
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }

    public boolean addAdmin(String login, String password) {
        Administrateur admin = new Administrateur();
        admin.setLogin(login);
        admin.setPassword(password);
        try {
            em.persist(admin);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean addNiveau(String niveau, String cycle) {

        Niveau niv = new Niveau();
        niv.setNiveau(niveau);
        niv.setCycle(cycle);
        try {
            em.persist(niv);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public String personHasRight(String login, int id_right) throws java.text.ParseException {
        //une personne peut avoir un droit de deux manières: soit par son rôle, 
        //soit par une attribution de droit (uniquement s'il s'agit d'un enseignant)

        //on vérifie que la personne existe, et on en profite pour déterminer son statut pour faire des traitements appropriés
        Query req = em.createQuery("select p from Personne p where p.login = :login");
        req.setParameter("login", login);
        Personne pers;
        try {
            pers = (Personne) req.getSingleResult();
        } catch (NoResultException e) {
            return "pers_existe_pas";
        }

        if (null != pers.getStatut()) {
            switch (pers.getStatut()) {
                case "Etudiant":
                    //on récupère l'étudiant avec ses rôles
                    Query req4 = em.createQuery("select e from Etudiant e join e.idpersonne pers where pers.login = :login");
                    req4.setParameter("login", login);
                    Etudiant etudiant;
                    try {
                        etudiant = (Etudiant) req4.getSingleResult();
                    } catch (NoResultException e) {
                        return "et_existe_pas";
                    }
                    //pour chaque role de l'étudiant, si ce role est relié au droit, on retourne vrai
                    for (Role role : etudiant.getRoleList()) {
                        if (roleHasRight(role.getIdrole(), id_right)) {
                            return "ok_et";
                        }
                    }
                    break;
                case "Enseignant":
                    //on récupére l'entite Enseignant avec ses rôles
                    Query req3 = em.createQuery("select e from Enseignant e join e.idpersonne pers where pers.login = :login");
                    req3.setParameter("login", login);
                    Enseignant ens;
                    try {
                        ens = (Enseignant) req3.getSingleResult();
                    } catch (NoResultException e) {
                        return "ens_existe_pas";
                    }

                    //on récupère les entites EtablirDroit correspondant à l'enseignant et ses droits
                    Query req2 = em.createQuery("SELECT ed FROM EtablirDroit ed join ed.matricule ens join ed.iddroit dr where ens.matricule = :mat and dr.iddroit = :right");
                    req2.setParameter("mat", ens.getMatricule());
                    req2.setParameter("right", id_right);
                    List<EtablirDroit> et_droit_list;
                    try {
                        et_droit_list = (List<EtablirDroit>) req2.getResultList();
                    } catch (Exception e) {
                        return "pas_d_attribution_de_droit";
                    }

                    //pour chaque entite EtablirDroit si la date courante est dans l'intervalle on retourne vrai
                    for (EtablirDroit et_droit : et_droit_list) {
                        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                        Date date_deb_droit, date_fin_droit;
                        date_deb_droit = df.parse(et_droit.getDatedeb());
                        date_fin_droit = df.parse(et_droit.getDatefin());
                        Date today = new Date();
                        if ((date_deb_droit.before(today) || date_deb_droit.equals(today)) && (date_fin_droit.after(today) || date_fin_droit.equals(today))) {
                            return "ok_ens_par_ed";
                        }
                    }

                    //Maintenant il faut faire la vérification pour la 1ere possibilité(par ses rôles), (comme avec tout le monde)
                    //pour chaque role de l'enseignant, si ce role est relié au droit, on retourne vrai
                    for (Role role : ens.getRoleList()) {
                        if (roleHasRight(role.getIdrole(), id_right)) {
                            return "ok_ens";
                        }
                    }

                    break;
                case "Administratif":
                    //on récupère l'administratif avec ses roles
                    Query req5 = em.createQuery("select a,roles from Administratif a join a.idpersonne pers where pers.login = :login");
                    req5.setParameter("login", login);
                    Administratif ad;
                    try {
                        ad = (Administratif) req5.getSingleResult();
                    } catch (NoResultException e) {
                        return "ad_existe_pas";
                    }
                    //pour chaque role de l'étudiant, si ce role est relié au droit, on retourne vrai
                    for (Role role : ad.getRoleList()) {
                        if (roleHasRight(role.getIdrole(), id_right)) {
                            return "ok_ad";
                        }
                    }
                    break;
                default:
                    break;
            }
        }

        return "pas_ok";
    }

    /*
    * Associer un droit à un rôle
     */
    public String associateRoleRight(int id_role, int id_droit) {
        //Récupération du rôle
        Query req = em.createQuery("select r from Role r where r.idrole = :id_role");
        req.setParameter("id_role", id_role);
        Role role;
        try {
            role = (Role) req.getSingleResult();
        } catch (NoResultException e) {
            return "role_existe_pas";
        }
        //récupération de l'entite droit
        Query req2 = em.createQuery("select d from Droit d where d.iddroit = :id_droit");
        req2.setParameter("id_droit", id_droit);
        Droit droit;
        try {
            droit = (Droit) req2.getSingleResult();
        } catch (NoResultException e) {
            return "droit_existe_pas";
        }
        //ajout du droit à la liste des droit du rôle
        List<Droit> list_d = role.getDroitList();
        list_d.add(droit);
        role.setDroitList(list_d);

        //ajout du role à la liste des roles du droit
        List<Role> list_r = droit.getRoleList();
        list_r.add(role);
        droit.setRoleList(list_r);

        try {
            em.flush();
        } catch (Exception e) {
            return "excep_flush";
        }

        return "parfait";
    }

    /*
    * Déterminer si rôle a un droit
     */
    public boolean roleHasRight(int id_role, int id_droit) {
        //Récupération du rôle avec ses droits
        Query req = em.createQuery("select r from Role r where r.idrole = :id_role");
        req.setParameter("id_role", id_role);
        Role role;
        try {
            role = (Role) req.getSingleResult();
        } catch (Exception e) {
            return false;
        }

        //si parmi ces droits il y a notre droit, on retourne vrai
        for (Droit droit : role.getDroitList()) {
            if (droit.getIddroit() == id_droit) {
                return true;
            }
        }

        return false;
    }

    /*
    * Associer un rôle à une personne
     */
    public boolean associateRole(String login, int id_role) {
        Personne personne = this.getPersonneByLogin(login);
        Role role = this.getRoleByPK(id_role);
        Enseignant enseignant;
        Administratif administratif;
        try {
            if (personne.getStatut().equals("enseignant")) {
                enseignant = personne.getEnseignant();
                enseignant.getRoleList().add(role);
            } else {
                administratif = personne.getAdministratif();
                administratif.getRoleList().add(role);
            }
            em.flush();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /*
    * Modifier le login et le mot de passe
     */
    public boolean alterPassLogin(String last_login, String last_pass, String new_login, String new_pass) {
        //Récupération de l'entite Personne correspondante
        //on retourne faux si last_pass et last_login ne correspondent à aucune entite
        Query req = em.createQuery("select p from Personne p where p.login = :login and p.password = :pass");
        req.setParameter("login", last_login);
        req.setParameter("pass", last_pass);
        Personne pers;
        try {
            pers = (Personne) req.getSingleResult();
        } catch (NoResultException e) {
            return false;
        }

        pers.setLogin(new_login);
        pers.setPassword(new_pass);
        em.flush();
        return true;
    }

    /*
    * Surcharge de la méthode précédente pour ne modifier qu'un paramètre
    * Boolean is_passwd indique si ce paraètre est le mot de passe ou le login
     */
    public boolean alterPassLogin(String last_login, String last_pass, String new_param, Boolean is_passwd) {
        //Récupération de l'entite Personne correspondante
        //on retourne faux si last_pass et last_login ne correspondent à aucune entite
        Query req = em.createQuery("select p from Personne p where p.login = :login and p.password = :pass");
        req.setParameter("login", last_login);
        req.setParameter("pass", last_pass);
        Personne pers;
        try {
            pers = (Personne) req.getSingleResult();
        } catch (NoResultException e) {
            return false;
        }
        if (is_passwd) {
            pers.setPassword(new_param);
        } else {
            pers.setLogin(new_param);
        }
        try {
            em.flush();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /*
    * Donner un droit à un enseignant pendant une période déterminée
     */
    public String associateRightTeacher(String login, int id_droit, String datedeb, String datefin, Administratif login_ad) {
        EtablirDroit et_droit = new EtablirDroit();
        et_droit.setDatedeb(datedeb);
        et_droit.setDatefin(datefin);
        //set de l'entite droit
        Query req = em.createQuery("select d from Droit d where d.iddroit = :id_droit");
        req.setParameter("id_droit", id_droit);
        Droit droit;
        try {
            droit = (Droit) req.getSingleResult();
        } catch (NoResultException e) {
            return "droit_ex_pas";
        }

        et_droit.setIddroit(droit);
        List<EtablirDroit> l = droit.getEtablirDroitList();
        l.add(et_droit);
        droit.setEtablirDroitList(l);
        //set de l'entite Enseignant
        Query req2 = em.createQuery("select e from Enseignant e join e.idpersonne pers where pers.login = :login");
        req2.setParameter("login", login);
        Enseignant ens;
        try {
            ens = (Enseignant) req2.getSingleResult();
        } catch (NoResultException e) {
            return "ens_ex_pas";
        }
        et_droit.setMatricule(ens);
        List<EtablirDroit> list = ens.getEtablirDroitList();
        list.add(et_droit);
        ens.setEtablirDroitList(list);

        /*set de l'entite Administratif
        Query req3 = em.createQuery("select ad from Administratif ad join ad.idpersonne pers where pers.login = :login");
        req3.setParameter("login", login_ad);
        Administratif ad;
        try {
            ad = (Administratif) req3.getSingleResult();
        } catch (NoResultException e) {
            return "ad_ex_pas";
        }*/
        et_droit.setIdadministatif(login_ad);
        List<EtablirDroit> list1 = login_ad.getEtablirDroitList();
        list1.add(et_droit);
        login_ad.setEtablirDroitList(list1);

        try {
            em.persist(et_droit);
            em.flush();
        } catch (Exception e) {
            return "except_flush";
        }

        return "parfait";
    }

    /*
    * Ajouter un rôle
     */
    public boolean addRole(String role , String login) {
        try {
            Role m_role = new Role();
            Administrateur admin = this.getAdminByPk(login);
            m_role.setRole(role);
            m_role.setIdadmin(admin);
            em.persist(m_role);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /*
    * Ajouter un droit
     */
    public boolean addRight(String right , String login) {
        try {
            Droit m_droit = new Droit();
            Administrateur admin = this.getAdminByPk(login);
            m_droit.setNom(right);
            m_droit.setIdadmin(admin);
            em.persist(m_droit);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Personne> getListePersonne() {
        return (List<Personne>) em.createQuery("select p from Personne p ").getResultList();
    }

    public List<Role> getListeRole() {
        return (List<Role>) em.createQuery("select r from Role r").getResultList();
    }

    public Personne getPersonneByLogin(String login) {
        String sql = " select p from Personne p Where p.login =:login ";
        return (Personne) em.createQuery(sql).setParameter("login", login).getSingleResult();
    }

    public Role getRoleByCode(String role) {
        String sql = " select r from Role r where r.role =:role ";
        Query requete = em.createQuery(sql);
        requete.setParameter("role", role);
        return (Role) requete.getSingleResult();
    }

    public boolean personHasRole(String login, int idRole) {
        Personne personne = this.getPersonneByLogin(login);
        Role role = this.getRoleByPK(idRole);
        switch (personne.getStatut()) {
            case "enseignant":
                if (personne.getEnseignant().getRoleList().contains(role)) {
                    return true;
                }
                break;
            case "etudiant":
                if (personne.getEtudiant().getRoleList().contains(role)) {
                    return true;
                }
                break;
            default:
                if (personne.getAdministratif().getRoleList().contains(role)) {
                    return true;
                }
                break;
        }
        return false;
    }

    public boolean addClass(int idfiliere, String niv, String nom) {
        Query req = em.createQuery("select f from Filiere f where f.idfiliere = :idf");
        req.setParameter("idf", idfiliere);
        Filiere filiere = (Filiere) req.getSingleResult();

        Query req2 = em.createQuery("select n from Niveau n where n.niveau = :niv");
        req2.setParameter("niv", niv);
        Niveau niveau = (Niveau) req2.getSingleResult();

        Classe classe = new Classe();
        classe.setIdfiliere(filiere);
        classe.setNiveau(niveau);
        classe.setNom(nom);

        try {
            em.persist(classe);
            em.flush();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<Ue> getListeUes() {
        Query req = em.createQuery("select u from Ue u");
        return (List<Ue>) req.getResultList();
    }

    public List<Classe> getListeClasses() {
        Query req = em.createQuery("select c from Classe c");
        return (List<Classe>) req.getResultList();
    }

    public boolean associateUeClass(String codeue, int idclass) {
        Query req = em.createQuery("select u from Ue u where u.code = :codeue");
        req.setParameter("codeue", codeue);
        Ue ue = (Ue) req.getSingleResult();
        Query req2 = em.createQuery("select c from Classe c where c.idclasse = :idc");
        req2.setParameter("idc", idclass);
        Classe classe = (Classe) req2.getSingleResult();

        UeClasse ue_cl = new UeClasse();
        ue_cl.setIdclasse(classe);
        ue_cl.setCode(ue);
        ue_cl.setAnnee(this.getAnneeActive());

        try {
            em.persist(ue_cl);
            em.flush();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<Filiere> getListeFilieres() {
        Query req = em.createQuery("select f from Filiere f");
        return (List<Filiere>) req.getResultList();
    }

    public List<Niveau> getListeNiveaux() {
        Query req = em.createQuery("select n from Niveau n");
        return (List<Niveau>) req.getResultList();
    }

    public List<EnseignantMat> getListeMatEns(String login) {
        Query req = em.createQuery("select ens from Enseignant ens join ens.idpersonne p where p.login = :login");
        req.setParameter("login", login);
        Enseignant ens;
        try {
            ens = (Enseignant) req.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
        Query req2 = em.createQuery("select em from EnseignantMat em join em.matricule e where e.matricule = :mat");
        req2.setParameter("mat", ens.getMatricule());
        return (List<EnseignantMat>) req2.getResultList();
    }

    public List<Filiere> getListeFilieres(int id_dep) {
        Query req = em.createQuery("select f from Filiere f  join f.iddepartement  d where d.iddepartement = :id_dep");
        req.setParameter("id_dep", id_dep);
        return (List<Filiere>) req.getResultList();
    }

    public List<EnseignantClasseJury> getListeClasseJury(String login) {
        Query req = em.createQuery("select ens from Enseignant ens join ens.idpersonne p where p.login = :login");
        req.setParameter("login", login);
        Enseignant ens = (Enseignant) req.getSingleResult();
        Query req2 = em.createQuery("select ec from EnseignantClasseJury ec join ec.matricule m where m.matricule = :mat");
        req2.setParameter("mat", ens.getMatricule());
        return (List<EnseignantClasseJury>) req2.getResultList();
    }

    public Classe getClasseByPK(int idclasse) {
        String sql = "SELECT cl FROM Classe cl  WHERE cl.idclasse =:idclasse";
        Query requete = em.createQuery(sql);
        requete.setParameter("idclasse", idclasse);
        return (Classe) requete.getSingleResult();
    }

    public Etudiant getEtudiantByPK(String matricule) {
        String sql = "SELECT e FROM Etudiant e  WHERE e.matricule =:matricule";
        Query requete = em.createQuery(sql);
        requete.setParameter("matricule", matricule);
        return (Etudiant) requete.getSingleResult();
    }

    public boolean associateEtudiantclasse(String matricule, int idClasse) {
        EtudiantClasse etudiantclasse = new EtudiantClasse();
        AnneeAcademique year = this.getAnneeActive();
        Etudiant etudiant = this.getEtudiantByPK(matricule);
        Classe classe = this.getClasseByPK(idClasse);
        etudiantclasse.setAnnee(year);
        etudiantclasse.setMatricule(etudiant);
        etudiantclasse.setIdclasse(classe);

        try {
            em.persist(etudiantclasse);
            em.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Etudiant> getListeEtudiant() {
        return (List<Etudiant>) em.createQuery("select e from Etudiant e ").getResultList();
    }

    public List<Classe> getListeClasse() {
        return (List<Classe>) em.createQuery("SELECT  c FROM Classe c ").getResultList();
    }

    public List<Classe> getListeClasses(int idfiliere) {
        Filiere filiere = this.getFiliereByPk(idfiliere);
        try {
            return (List<Classe>) em.createQuery("SELECT  c FROM Classe c WHERE c.idfiliere =:idfiliere")
                    .setParameter("idfiliere", filiere).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    public List<Matiere> getListeMatieres() {
        Query req = em.createQuery("select m from Matiere m");
        return (List<Matiere>) req.getResultList();
    }

    public Filiere getFiliereByPk(int idFiliere) {
        String sql = " select f from Filiere f where f.idfiliere =:idfiliere";
        Query requete = em.createQuery(sql);
        requete.setParameter("idfiliere", idFiliere);
        return (Filiere) requete.getSingleResult();
    }

    public List<UeClasse> getUeClasseByIdClasse(int idclasse) {
        Classe classe = this.getClasseByPK(idclasse);
        String sql = " select u from UeClasse u where u.idclasse =:idclasse";
        Query requete = em.createQuery(sql);
        requete.setParameter("idclasse", classe);
        return (List<UeClasse>) requete.getResultList();
    }

    public List<Droit> getListeDroit() {
        try {
            return (List<Droit>) em.createQuery("select d from Droit d").getResultList();
        } catch (NoResultException ex) {
            return null;
        }
    }

    public Enseignant getEnseignatByPk(String matricule) {
        try {
            return (Enseignant) em.createQuery("select ens from Enseignant ens WHERE ens.matricule =:matricule").setParameter("matricule", matricule).getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }
    }

    public boolean checkEnseignantHasDroit(String ens, int id_droit) {
        Enseignant enseignant = (Enseignant) this.getEnseignatByPk(ens);
        Droit droit = (Droit) this.getDroitByPK(id_droit);
        String sql = "SELECT et.idetablirdroit FROM EtablirDroit et WHERE et.matricule =:ens AND et.iddroit =:droit";
        boolean valid;
        try {
            em.createQuery(sql).setParameter("ens", enseignant)
                    .setParameter("droit", droit).getSingleResult();
            valid = true;
        } catch (NoResultException ex) {
            valid = false;
        }

        return valid;
    }

    public List<Droit> getListeDroitByEnseignat(String idEnseignant) {
        Enseignant ens = (Enseignant) this.getEnseignatByPk(idEnseignant);
        try {
            return (List<Droit>) em.createQuery("select et from EtablirDroit et WHERE et.matricule =:ens").setParameter("ens", ens).getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }
    }

    public Vector<EnseignantClasseJury> getListePresidentJury(String login) {
        Query req = em.createQuery("select ens from Enseignant ens join ens.idpersonne p where p.login = :login");
        req.setParameter("login", login);
        Enseignant ens = (Enseignant) req.getSingleResult();
        Query req3 = em.createQuery("select fil from Filiere fil where fil.iddepartement =:iddep");
        req3.setParameter("iddep", ens.getIddepartement());
        List<Filiere> listfil = req3.getResultList();
        Vector<Classe> listclass = new Vector<>();
        for (int j = 0; j < listfil.size(); j++) {
            Query req4 = em.createQuery("select c from Classe c where c.idfiliere =:fil");
            req4.setParameter("fil", listfil.get(j));
            listclass.addAll(req4.getResultList());
        }
        Vector<EnseignantClasseJury> listens = new Vector<>();
        AnneeAcademique annee = this.getAnneeActive();
        for (int i = 0; i < listclass.size(); i++) {
            Query req5 = em.createQuery("select ens from EnseignantClasseJury ens where ens.idclasse =:classe AND ens.annee =:annee");
            req5.setParameter("classe", listclass.get(i));
            req5.setParameter("annee", annee);
            listens.addAll(req5.getResultList());
        }

        return listens;
    }

    public boolean associate_mat_ens(int id_m, String matricule) {
        EnseignantMat ensmat = new EnseignantMat();
        ensmat.setAnnee(this.getAnneeActive());
        ensmat.setIdmatiere((Matiere) em.createNamedQuery("Matiere.findByIdmatiere").setParameter("idmatiere", id_m).getSingleResult());
        ensmat.setMatricule((Enseignant) em.createNamedQuery("Enseignant.findByMatricule").setParameter("matricule", matricule).getSingleResult());
        try {
            em.persist(ensmat);
            em.flush();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<Enseignant> getListeEnsDep(Departement dep) {
        Query req = em.createQuery("select e from Enseignant e join e.iddepartement d where d.iddepartement = :id");
        req.setParameter("id", dep.getIddepartement());
        return (List<Enseignant>) req.getResultList();
    }

    public List<Classe> getListeClassesDep(Departement dep) {
        List<Filiere> filieres = dep.getFiliereList();
        List<Classe> liste_cl = new ArrayList<>();
        for (Filiere fil : filieres) {
            liste_cl.addAll(fil.getClasseList());
        }
        return liste_cl;
    }

    public boolean nommerEnsPresjuryClasse(String matricule, int id_classe) {
        EnseignantClasseJury nomm = new EnseignantClasseJury();
        nomm.setAnnee(this.getAnneeActive());
        Query req = em.createQuery("select c from Classe c where c.idclasse = :id_classe");
        req.setParameter("id_classe", id_classe);
        nomm.setIdclasse((Classe) req.getSingleResult());
        Query req2 = em.createQuery("select e from Enseignant e where e.matricule = :mat");
        req2.setParameter("mat", matricule);
        nomm.setMatricule((Enseignant) req2.getSingleResult());
        try {
            em.persist(nomm);
            em.flush();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<MatiereUe> getListeMatieresDep(Departement dep) {
        List<Filiere> filieres = dep.getFiliereList();
        List<MatiereUe> liste_m = new ArrayList<>();
        for (Filiere fil : filieres) {
            for (Classe c : fil.getClasseList()) {
                for (UeClasse uec : c.getUeClasseList()) {
                    for (MatiereUe mu : uec.getCode().getMatiereUeList()) {
                        if (mu.getAnnee().getAnnee() == null ? this.getAnneeActive().getAnnee() == null : mu.getAnnee().getAnnee().equals(this.getAnneeActive().getAnnee())) {
                            boolean existe = false;
                            for (MatiereUe mu1 : liste_m) {
                                if (Objects.equals(mu1.getIdmatiere().getIdmatiere(), mu.getIdmatiere().getIdmatiere())) {
                                    existe = true;
                                }
                            }
                            if (!existe) {
                                liste_m.add(mu);
                            } else {
                            }
                        }
                    }
                }
            }
        }
        return liste_m;
    }

    public List<EtudiantClasse> getListeEtudiantsClasse(int idclasse) {
        Query req = em.createQuery("select ec from EtudiantClasse ec join ec.idclasse cl join ec.annee an where cl.idclasse =:idclasse and an.annee =:ann");
        req.setParameter("idclasse", idclasse);
        req.setParameter("ann", this.getAnneeActive().getAnnee());
        try {
            return req.getResultList();
        } catch (Exception e) {

        }
        return null;
    }

    public boolean addEnseignantMatiere(String matricule, int idClasse, int idMatiere) {
        Enseignant e = this.getEnseignantByMatricule(matricule);
        Classe c = this.getClasseByPK(idClasse);
        Matiere m = this.getMatiereByPK(idMatiere);
        EnseignantMat ensmat = new EnseignantMat();
        ensmat.setAnnee(this.getAnneeActive());
        ensmat.setIdmatiere(m);
        ensmat.setMatricule(e);
        ensmat.setIdclasse(c);
        try {
            em.persist(ensmat);
            em.flush();
            return true;
        } catch (Exception ex) {
            return false;
        }

    }

    public Enseignant getEnseignantByMatricule(String mat) {
        String sql = "SELECT  e FROM Enseignant e where e.matricule =:mat";
        Query requete = em.createQuery(sql);
        requete.setParameter("mat", mat);
        return (Enseignant) requete.getSingleResult();
    }

    public List<Enseignant> getEnseignantsByDepartement(int iddep) {
        Departement dep = this.getDepartementByPK(iddep);
        Query requete = em.createQuery("select e from Enseignant e where e.iddepartement =:iddep");
        requete.setParameter("iddep", dep);
        return (List<Enseignant>) requete.getResultList();
    }

    public List<Classe> getClassesByDepartement(int iddep) {
        Departement dep = this.getDepartementByPK(iddep);

        String sql = "SELECT c from Classe c,Filiere f  WHERE f.iddepartement =:dep "
                + "and c.idfiliere=f";
        Query requete = em.createQuery(sql);
        requete.setParameter("dep", dep);
        return (List<Classe>) requete.getResultList();
    }

    public List<Matiere> getMatieresByClass(int idclas) {

        Classe clas = this.getClasseByPK(idclas);

        String sql = "SELECT mu.idmatiere from MatiereUe mu,UeClasse uec "
                + "WHERE uec.idclasse =:classe AND uec.code = mu.code";

        Query requete = em.createQuery(sql);
        requete.setParameter("classe", clas);
        return (List<Matiere>) requete.getResultList();

    }

    public boolean checkEnseignantChefDepartement(String matricule, int idDepartement) {
        Enseignant enseignant = this.getEnseignantByMatricule(matricule);
        Departement departement = this.getDepartementByPK(idDepartement);
        AnneeAcademique annee = this.getAnneeActive();
        String sql = " SELECT e FROM EnseignantChefDepartement e WHERE e.matricule =:matricule AND e.iddepartement =:iddepartement AND e.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("matricule", enseignant);
        requete.setParameter("iddepartement", departement);
        requete.setParameter("annee", annee);
        try {
            requete.getSingleResult();
        } catch (NoResultException e) {
            return false;
        }
        return true;
    }

    public boolean nommerChefDepartement(String matricule, int idDepartement) {
        Enseignant enseignant = this.getEnseignantByMatricule(matricule);
        Departement departement = this.getDepartementByPK(idDepartement);
        AnneeAcademique annee = this.getAnneeActive();
        EnseignantChefDepartement chefdepartement = new EnseignantChefDepartement();
        chefdepartement.setAnnee(annee);
        chefdepartement.setMatricule(enseignant);
        chefdepartement.setIddepartement(departement);
        String sql = " select e from EnseignantChefDepartement e where e.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("annee", annee);
        try {
             EnseignantChefDepartement ens = (EnseignantChefDepartement)requete.getSingleResult();
             try {
                em.remove(ens);
                em.flush();
                em.persist(chefdepartement);
                em.flush();
             }catch(Exception s){
                return false;
             }
        } catch (NoResultException e) {
            try {
                em.persist(chefdepartement);
                em.flush();
            }catch(Exception s){
                return false;
            }
        }

        return true;
    }
    
    public boolean ckeckExistUe( String code ){
        String sql = " select u from Ue u where u.code =:code ";
        Query requete = em.createQuery(sql);
        requete.setParameter("code",code);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e ){
            return false;
        }
        return true;
    }
    
    public boolean checkExistMatiere( String code ){
        String sql = " select m from Matiere m where m.code =:code";
        Query requete = em.createQuery(sql);
        requete.setParameter("code",code);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkExistUeClasse ( String code , int idClasse){
        Ue ue = this.getUeByPK(code);
        Classe classe = this.getClasseByPK(idClasse);
        AnneeAcademique annee = this.getAnneeActive();
        String sql = " select u from UeClasse u where u.code =:code and u.idclasse =:idclasse and u.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("code",ue);
        requete.setParameter("idclasse",classe);
        requete.setParameter("annee",annee);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean existLogin( String login ){
        String sql = " select p from Personne p where p.login =:login";
        String sql1 = " select a from Administrateur a where a.login =:login";
        Query requete = em.createQuery(sql);
        requete.setParameter("login",login);
        try{
            requete.getSingleResult();
        }catch(NoResultException e){
            Query requete1 = em.createQuery(sql1);
            requete1.setParameter("login",login);
            try{
                requete1.getSingleResult();
            }catch(NoResultException ex){
                return false;
            }
        }
        return true;
    }
    
    public boolean checkExistRole ( String role ){
        String sql = " select r from Role r where r.role =:role";
        Query requete = em.createQuery(sql);
        requete.setParameter("role",role);
        try{
            requete.getSingleResult();
        }catch(NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkExistDroit ( String droit){
        String sql = " select d from Droit d where d.nom =:nom";
        Query requete = em.createQuery(sql);
        requete.setParameter("nom",droit);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e){
            return false;
        }
        return true;
    }
    
    public Administrateur getAdminByPk( String login ){
        String sql = " select a from Administrateur a where a.login =:login";
        Query requete = em.createQuery(sql);
        requete.setParameter("login", login);
        return (Administrateur)requete.getSingleResult();
    }
    
    public boolean existExam( String type ){
        String sql = "select e from Examen e where e.typeExam =:type";
        Query requete = em.createQuery(sql);
        requete.setParameter("type",type);
        try{
            requete.getSingleResult();
        }catch( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkEtudiantClasse ( String matricule , int idclasse){
        Etudiant etudiant = this.getEtudiantByPK(matricule);
        Classe classe = this.getClasseByPK(idclasse);
        AnneeAcademique annee = this.getAnneeActive();
        String sql = " select e from EtudiantClasse e where e.matricule =:matricule and e.idclasse =:idclasse and e.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("matricule",etudiant);
        requete.setParameter("idclasse",classe);
        requete.setParameter("annee",annee);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkDepartement ( String code ){
        String sql = " select d from Departement d where d.code =:code";
        Query requete = em.createQuery(sql);
        requete.setParameter("code",code);
        try{
            requete.getSingleResult();
        }catch( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkNiveau ( String niveau ){
        String sql = " select n from Niveau n where n.niveau =:niveau";
        Query requete = em.createQuery(sql);
        requete.setParameter("niveau",niveau);
        try{
            requete.getSingleResult();
        }catch( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkClasse ( String classe){
        String sql = " select c from Classe c where c.nom =:nom";
        Query requete = em.createQuery(sql);
        requete.setParameter("classe" , classe);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e ){
            return false;
        }
        return  true;
    }
    
    public boolean checkPresidentJury( String matricule , int idclasse ){
        Enseignant enseignant = this.getEnseignantByMatricule(matricule);
        Classe classe = this.getClasseByPK(idclasse);
        AnneeAcademique annee = this.getAnneeActive();
        String sql = " select e from EnseignantClasseJury e where e.matricule =:matricule and e.idclasse =:idclasse and e.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("matricule", enseignant);
        requete.setParameter("idclasse",classe);
        requete.setParameter("annee",annee);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkPresidentJury( String matricule){
        Enseignant enseignant = this.getEnseignantByMatricule(matricule);
        AnneeAcademique annee = this.getAnneeActive();
        String sql = " select e from EnseignantClasseJury e where e.matricule =:matricule and e.annee =:annee";
        Query requete = em.createQuery(sql);
        requete.setParameter("matricule", enseignant);
        requete.setParameter("annee",annee);
        try{
            requete.getSingleResult();
        }catch ( NoResultException e){
            return false;
        }
        return true;
    }
    
    public boolean checkFiliere ( String code){
        String sql = "select f from Filiere f where f.code =:code";
        Query requete = em.createQuery(sql);
        requete.setParameter("code",code);
        try{
            requete.getSingleResult();
        }catch(NoResultException e){
            return false;
        }
        return true;
    }
    
    /** Ajout du chef de département par le groupe 6   **/
     
    public EnseignantChefDepartement getChief(String login, String password) {
        Personne personne = this.getPersonne(login, password);
        String sql = "SELECT ecd FROM EnseignantChefDepartement ecd "
                    + "WHERE ecd.matricule.idpersonne = :personne ";
        Query requete1 = em.createQuery(sql);
        requete1.setParameter("personne", personne);
        EnseignantChefDepartement chief = null;
        try {
            chief = (EnseignantChefDepartement) requete1.getSingleResult();
            return chief;
        } catch (NoResultException ex) {

        }
        return null;
    }
    
}
