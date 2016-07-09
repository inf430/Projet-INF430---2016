--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administrateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE administrateur (
    idadmin integer NOT NULL,
    login character varying(50),
    password character varying(50)
);


ALTER TABLE administrateur OWNER TO postgres;

--
-- Name: administrateur_idadmin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE administrateur_idadmin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrateur_idadmin_seq OWNER TO postgres;

--
-- Name: administrateur_idadmin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE administrateur_idadmin_seq OWNED BY administrateur.idadmin;


--
-- Name: administratif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE administratif (
    idadministatif integer NOT NULL,
    idpersonne integer NOT NULL
);


ALTER TABLE administratif OWNER TO postgres;

--
-- Name: administratif_idadministatif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE administratif_idadministatif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administratif_idadministatif_seq OWNER TO postgres;

--
-- Name: administratif_idadministatif_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE administratif_idadministatif_seq OWNED BY administratif.idadministatif;


--
-- Name: annee_academique; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE annee_academique (
    annee character varying(10) NOT NULL,
    etat character varying(30)
);


ALTER TABLE annee_academique OWNER TO postgres;

--
-- Name: appartenirdroit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE appartenirdroit (
    iddroit integer NOT NULL,
    idrole integer NOT NULL
);


ALTER TABLE appartenirdroit OWNER TO postgres;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE classe (
    idclasse integer NOT NULL,
    idfiliere integer NOT NULL,
    niveau character varying(30) NOT NULL,
    nom character varying(50)
);


ALTER TABLE classe OWNER TO postgres;

--
-- Name: classe_idclasse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classe_idclasse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classe_idclasse_seq OWNER TO postgres;

--
-- Name: classe_idclasse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE classe_idclasse_seq OWNED BY classe.idclasse;


--
-- Name: departement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departement (
    iddepartement integer NOT NULL,
    code character varying(30),
    libelle character varying(30)
);


ALTER TABLE departement OWNER TO postgres;

--
-- Name: departement_iddepartement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE departement_iddepartement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE departement_iddepartement_seq OWNER TO postgres;

--
-- Name: departement_iddepartement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE departement_iddepartement_seq OWNED BY departement.iddepartement;


--
-- Name: droit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE droit (
    iddroit integer NOT NULL,
    idadmin integer NOT NULL,
    nom character varying(50)
);


ALTER TABLE droit OWNER TO postgres;

--
-- Name: droit_iddroit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE droit_iddroit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE droit_iddroit_seq OWNER TO postgres;

--
-- Name: droit_iddroit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE droit_iddroit_seq OWNED BY droit.iddroit;


--
-- Name: enseignant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enseignant (
    matricule character varying(10) NOT NULL,
    idpersonne integer NOT NULL,
    iddepartement integer NOT NULL,
    grade character varying(50),
    specialite character varying(50)
);


ALTER TABLE enseignant OWNER TO postgres;

--
-- Name: enseignant_chef_departement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enseignant_chef_departement (
    idenseignantchefdepartement integer NOT NULL,
    matricule character varying(10) NOT NULL,
    iddepartement integer NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE enseignant_chef_departement OWNER TO postgres;

--
-- Name: enseignant_chef_departement_idenseignantchefdepartement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enseignant_chef_departement_idenseignantchefdepartement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enseignant_chef_departement_idenseignantchefdepartement_seq OWNER TO postgres;

--
-- Name: enseignant_chef_departement_idenseignantchefdepartement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enseignant_chef_departement_idenseignantchefdepartement_seq OWNED BY enseignant_chef_departement.idenseignantchefdepartement;


--
-- Name: enseignant_classe_jury; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enseignant_classe_jury (
    idenseignantclassejury integer NOT NULL,
    idclasse integer NOT NULL,
    matricule character varying(10) NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE enseignant_classe_jury OWNER TO postgres;

--
-- Name: enseignant_classe_jury_idenseignantclassejury_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enseignant_classe_jury_idenseignantclassejury_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enseignant_classe_jury_idenseignantclassejury_seq OWNER TO postgres;

--
-- Name: enseignant_classe_jury_idenseignantclassejury_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enseignant_classe_jury_idenseignantclassejury_seq OWNED BY enseignant_classe_jury.idenseignantclassejury;


--
-- Name: enseignant_mat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enseignant_mat (
    idenseignantmat integer NOT NULL,
    idmatiere integer NOT NULL,
    matricule character varying(10) NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE enseignant_mat OWNER TO postgres;

--
-- Name: enseignant_mat_idenseignantmat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enseignant_mat_idenseignantmat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enseignant_mat_idenseignantmat_seq OWNER TO postgres;

--
-- Name: enseignant_mat_idenseignantmat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enseignant_mat_idenseignantmat_seq OWNED BY enseignant_mat.idenseignantmat;


--
-- Name: etablir_droit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etablir_droit (
    idetablirdroit integer NOT NULL,
    matricule character varying(10) NOT NULL,
    idadministatif integer NOT NULL,
    iddroit integer NOT NULL,
    datedeb character varying(10),
    datefin character varying(10)
);


ALTER TABLE etablir_droit OWNER TO postgres;

--
-- Name: etablir_droit_idetablirdroit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE etablir_droit_idetablirdroit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE etablir_droit_idetablirdroit_seq OWNER TO postgres;

--
-- Name: etablir_droit_idetablirdroit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE etablir_droit_idetablirdroit_seq OWNED BY etablir_droit.idetablirdroit;


--
-- Name: etudiant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etudiant (
    matricule character varying(10) NOT NULL,
    idpersonne integer NOT NULL
);


ALTER TABLE etudiant OWNER TO postgres;

--
-- Name: etudiant_classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etudiant_classe (
    idetudiantclasse integer NOT NULL,
    matricule character varying(10) NOT NULL,
    idclasse integer NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE etudiant_classe OWNER TO postgres;

--
-- Name: etudiant_classe_idetudiantclasse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE etudiant_classe_idetudiantclasse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE etudiant_classe_idetudiantclasse_seq OWNER TO postgres;

--
-- Name: etudiant_classe_idetudiantclasse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE etudiant_classe_idetudiantclasse_seq OWNED BY etudiant_classe.idetudiantclasse;


--
-- Name: etudiant_exam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etudiant_exam (
    idetudiantexam integer NOT NULL,
    idexamen integer NOT NULL,
    matricule character varying(10) NOT NULL,
    annee character varying(10) NOT NULL,
    note real,
    anonymat character varying(20)
);


ALTER TABLE etudiant_exam OWNER TO postgres;

--
-- Name: etudiant_exam_idetudiantexam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE etudiant_exam_idetudiantexam_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE etudiant_exam_idetudiantexam_seq OWNER TO postgres;

--
-- Name: etudiant_exam_idetudiantexam_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE etudiant_exam_idetudiantexam_seq OWNED BY etudiant_exam.idetudiantexam;


--
-- Name: examen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE examen (
    idexamen integer NOT NULL,
    date_exam character varying(10),
    type_exam character varying(30)
);


ALTER TABLE examen OWNER TO postgres;

--
-- Name: examen_idexamen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE examen_idexamen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE examen_idexamen_seq OWNER TO postgres;

--
-- Name: examen_idexamen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE examen_idexamen_seq OWNED BY examen.idexamen;


--
-- Name: filiere; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filiere (
    idfiliere integer NOT NULL,
    iddepartement integer NOT NULL,
    code character varying(30),
    libelle character varying(30)
);


ALTER TABLE filiere OWNER TO postgres;

--
-- Name: filiere_idfiliere_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filiere_idfiliere_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filiere_idfiliere_seq OWNER TO postgres;

--
-- Name: filiere_idfiliere_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filiere_idfiliere_seq OWNED BY filiere.idfiliere;


--
-- Name: inscription; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inscription (
    idinscription integer NOT NULL,
    idmatiere integer NOT NULL,
    matricule character varying(10) NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE inscription OWNER TO postgres;

--
-- Name: inscription_idinscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inscription_idinscription_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inscription_idinscription_seq OWNER TO postgres;

--
-- Name: inscription_idinscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inscription_idinscription_seq OWNED BY inscription.idinscription;


--
-- Name: matiere; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matiere (
    idmatiere integer NOT NULL,
    code character varying(30),
    libelle character varying(50)
);


ALTER TABLE matiere OWNER TO postgres;

--
-- Name: matiere_exam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matiere_exam (
    idmatiereexam integer NOT NULL,
    idmatiere integer NOT NULL,
    idexamen integer NOT NULL,
    annee character varying(10) NOT NULL,
    pourcentage integer,
    CONSTRAINT matiere_exam_pourcentage_check CHECK (((pourcentage >= 0) AND (pourcentage <= 100)))
);


ALTER TABLE matiere_exam OWNER TO postgres;

--
-- Name: matiere_exam_idmatiereexam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matiere_exam_idmatiereexam_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE matiere_exam_idmatiereexam_seq OWNER TO postgres;

--
-- Name: matiere_exam_idmatiereexam_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE matiere_exam_idmatiereexam_seq OWNED BY matiere_exam.idmatiereexam;


--
-- Name: matiere_idmatiere_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matiere_idmatiere_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE matiere_idmatiere_seq OWNER TO postgres;

--
-- Name: matiere_idmatiere_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE matiere_idmatiere_seq OWNED BY matiere.idmatiere;


--
-- Name: matiere_ue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matiere_ue (
    idmatiereue integer NOT NULL,
    idmatiere integer NOT NULL,
    code character varying(30) NOT NULL,
    annee character varying(10) NOT NULL,
    credit integer
);


ALTER TABLE matiere_ue OWNER TO postgres;

--
-- Name: matiere_ue_idmatiereue_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matiere_ue_idmatiereue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE matiere_ue_idmatiereue_seq OWNER TO postgres;

--
-- Name: matiere_ue_idmatiereue_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE matiere_ue_idmatiereue_seq OWNED BY matiere_ue.idmatiereue;


--
-- Name: niveau; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE niveau (
    niveau character varying(30) NOT NULL,
    cycle character varying(20)
);


ALTER TABLE niveau OWNER TO postgres;

--
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personne (
    idpersonne integer NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    datenaiss character varying(10),
    lieunaiss character varying(30),
    sexe character(1),
    login character varying(30),
    password character varying(255),
    statut character varying(15),
    numtel character varying(20),
    CONSTRAINT personne_sexe_check CHECK ((sexe = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);


ALTER TABLE personne OWNER TO postgres;

--
-- Name: personne_idpersonne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personne_idpersonne_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personne_idpersonne_seq OWNER TO postgres;

--
-- Name: personne_idpersonne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personne_idpersonne_seq OWNED BY personne.idpersonne;


--
-- Name: reponse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reponse (
    idreponse integer NOT NULL,
    matricule character varying(10) NOT NULL,
    idrequete integer NOT NULL,
    date_reponse character varying(10),
    contenu text
);


ALTER TABLE reponse OWNER TO postgres;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reponse_idreponse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reponse_idreponse_seq OWNER TO postgres;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reponse_idreponse_seq OWNED BY reponse.idreponse;


--
-- Name: requete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requete (
    idrequete integer NOT NULL,
    matricule character varying(10) NOT NULL,
    objet text,
    date_requete character varying(10),
    etat character varying(30),
    idmatiere integer,
    contenu text,
    typerequete character varying(30)
);


ALTER TABLE requete OWNER TO postgres;

--
-- Name: requete_idrequete_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requete_idrequete_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE requete_idrequete_seq OWNER TO postgres;

--
-- Name: requete_idrequete_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requete_idrequete_seq OWNED BY requete.idrequete;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    idrole integer NOT NULL,
    idadmin integer NOT NULL,
    role character varying(50)
);


ALTER TABLE role OWNER TO postgres;

--
-- Name: role_idrole_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_idrole_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_idrole_seq OWNER TO postgres;

--
-- Name: role_idrole_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_idrole_seq OWNED BY role.idrole;


--
-- Name: roleadministratif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roleadministratif (
    idadministatif integer NOT NULL,
    idrole integer NOT NULL
);


ALTER TABLE roleadministratif OWNER TO postgres;

--
-- Name: roleenseignant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roleenseignant (
    matricule character varying(10) NOT NULL,
    idrole integer NOT NULL
);


ALTER TABLE roleenseignant OWNER TO postgres;

--
-- Name: roleetudiant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roleetudiant (
    idrole integer NOT NULL,
    matricule character varying(10) NOT NULL
);


ALTER TABLE roleetudiant OWNER TO postgres;

--
-- Name: semestre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE semestre (
    idsemestre integer NOT NULL,
    annee character varying(10) NOT NULL,
    semestre character varying(30)
);


ALTER TABLE semestre OWNER TO postgres;

--
-- Name: semestre_idsemestre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE semestre_idsemestre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE semestre_idsemestre_seq OWNER TO postgres;

--
-- Name: semestre_idsemestre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE semestre_idsemestre_seq OWNED BY semestre.idsemestre;


--
-- Name: ue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ue (
    code character varying(30) NOT NULL,
    idsemestre integer NOT NULL,
    libelle character varying(30)
);


ALTER TABLE ue OWNER TO postgres;

--
-- Name: ue_classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ue_classe (
    idueclasse integer NOT NULL,
    code character varying(30) NOT NULL,
    idclasse integer NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE ue_classe OWNER TO postgres;

--
-- Name: ue_classe_idueclasse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ue_classe_idueclasse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ue_classe_idueclasse_seq OWNER TO postgres;

--
-- Name: ue_classe_idueclasse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ue_classe_idueclasse_seq OWNED BY ue_classe.idueclasse;


--
-- Name: idadmin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrateur ALTER COLUMN idadmin SET DEFAULT nextval('administrateur_idadmin_seq'::regclass);


--
-- Name: idadministatif; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administratif ALTER COLUMN idadministatif SET DEFAULT nextval('administratif_idadministatif_seq'::regclass);


--
-- Name: idclasse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classe ALTER COLUMN idclasse SET DEFAULT nextval('classe_idclasse_seq'::regclass);


--
-- Name: iddepartement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departement ALTER COLUMN iddepartement SET DEFAULT nextval('departement_iddepartement_seq'::regclass);


--
-- Name: iddroit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit ALTER COLUMN iddroit SET DEFAULT nextval('droit_iddroit_seq'::regclass);


--
-- Name: idenseignantchefdepartement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_chef_departement ALTER COLUMN idenseignantchefdepartement SET DEFAULT nextval('enseignant_chef_departement_idenseignantchefdepartement_seq'::regclass);


--
-- Name: idenseignantclassejury; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_classe_jury ALTER COLUMN idenseignantclassejury SET DEFAULT nextval('enseignant_classe_jury_idenseignantclassejury_seq'::regclass);


--
-- Name: idenseignantmat; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat ALTER COLUMN idenseignantmat SET DEFAULT nextval('enseignant_mat_idenseignantmat_seq'::regclass);


--
-- Name: idetablirdroit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit ALTER COLUMN idetablirdroit SET DEFAULT nextval('etablir_droit_idetablirdroit_seq'::regclass);


--
-- Name: idetudiantclasse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_classe ALTER COLUMN idetudiantclasse SET DEFAULT nextval('etudiant_classe_idetudiantclasse_seq'::regclass);


--
-- Name: idetudiantexam; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam ALTER COLUMN idetudiantexam SET DEFAULT nextval('etudiant_exam_idetudiantexam_seq'::regclass);


--
-- Name: idexamen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examen ALTER COLUMN idexamen SET DEFAULT nextval('examen_idexamen_seq'::regclass);


--
-- Name: idfiliere; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filiere ALTER COLUMN idfiliere SET DEFAULT nextval('filiere_idfiliere_seq'::regclass);


--
-- Name: idinscription; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription ALTER COLUMN idinscription SET DEFAULT nextval('inscription_idinscription_seq'::regclass);


--
-- Name: idmatiere; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere ALTER COLUMN idmatiere SET DEFAULT nextval('matiere_idmatiere_seq'::regclass);


--
-- Name: idmatiereexam; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_exam ALTER COLUMN idmatiereexam SET DEFAULT nextval('matiere_exam_idmatiereexam_seq'::regclass);


--
-- Name: idmatiereue; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_ue ALTER COLUMN idmatiereue SET DEFAULT nextval('matiere_ue_idmatiereue_seq'::regclass);


--
-- Name: idpersonne; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personne ALTER COLUMN idpersonne SET DEFAULT nextval('personne_idpersonne_seq'::regclass);


--
-- Name: idreponse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse ALTER COLUMN idreponse SET DEFAULT nextval('reponse_idreponse_seq'::regclass);


--
-- Name: idrequete; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requete ALTER COLUMN idrequete SET DEFAULT nextval('requete_idrequete_seq'::regclass);


--
-- Name: idrole; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN idrole SET DEFAULT nextval('role_idrole_seq'::regclass);


--
-- Name: idsemestre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY semestre ALTER COLUMN idsemestre SET DEFAULT nextval('semestre_idsemestre_seq'::regclass);


--
-- Name: idueclasse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ue_classe ALTER COLUMN idueclasse SET DEFAULT nextval('ue_classe_idueclasse_seq'::regclass);


--
-- Data for Name: administrateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO administrateur (idadmin, login, password) VALUES (1, 'admin1', 'admin1');
INSERT INTO administrateur (idadmin, login, password) VALUES (2, 'admin2', 'admin2');
INSERT INTO administrateur (idadmin, login, password) VALUES (3, 'admin3', 'admin3');
INSERT INTO administrateur (idadmin, login, password) VALUES (4, 'admin4', 'admin4');
INSERT INTO administrateur (idadmin, login, password) VALUES (5, 'admin5', 'admin5');
INSERT INTO administrateur (idadmin, login, password) VALUES (6, 'admin6', 'admin6');
INSERT INTO administrateur (idadmin, login, password) VALUES (7, 'admin7', 'admin7');
INSERT INTO administrateur (idadmin, login, password) VALUES (8, 'admin8', 'admin8');


--
-- Name: administrateur_idadmin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('administrateur_idadmin_seq', 8, true);


--
-- Data for Name: administratif; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO administratif (idadministatif, idpersonne) VALUES (1, 5);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (2, 6);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (3, 11);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (4, 12);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (5, 39);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (6, 40);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (7, 41);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (8, 42);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (9, 43);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (10, 44);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (11, 45);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (12, 46);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (13, 47);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (14, 48);
INSERT INTO administratif (idadministatif, idpersonne) VALUES (15, 49);


--
-- Name: administratif_idadministatif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('administratif_idadministatif_seq', 15, true);


--
-- Data for Name: annee_academique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO annee_academique (annee, etat) VALUES ('2015-2016', 'en_cours');
INSERT INTO annee_academique (annee, etat) VALUES ('2014-2015', 'annee_passee');


--
-- Data for Name: appartenirdroit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO appartenirdroit (iddroit, idrole) VALUES (1, 3);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (1, 4);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (2, 1);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (2, 3);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (2, 4);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (2, 5);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (3, 3);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (3, 4);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (4, 1);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (4, 2);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (5, 3);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (5, 4);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (5, 5);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (6, 4);
INSERT INTO appartenirdroit (iddroit, idrole) VALUES (7, 4);


--
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (1, 1, 'L1', 'phys_L1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (2, 1, 'L2', 'phys_L2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (3, 1, 'L3', 'phys_L3');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (4, 1, 'M1', 'phys_M1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (5, 1, 'M2', 'phys_M2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (6, 2, 'L1', 'chim_L1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (7, 2, 'L2', 'chim_L2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (8, 2, 'L3', 'chim_L3');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (9, 2, 'M1', 'chim_M1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (10, 2, 'M2', 'chim_M2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (11, 3, 'L1', 'maths_L1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (12, 3, 'L2', 'maths_L2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (13, 3, 'L3', 'maths_L3');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (14, 3, 'M1', 'maths_M1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (15, 3, 'M2', 'maths_M2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (16, 4, 'L1', 'info_L1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (17, 4, 'L2', 'info_L2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (18, 4, 'L3', 'info_L3');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (19, 4, 'M1', 'info_M1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (20, 4, 'M2', 'info_M2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (21, 5, 'L1', 'boa_L1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (22, 5, 'L2', 'boa_L2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (23, 5, 'L3', 'boa_L3');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (24, 5, 'M1', 'boa_M1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (25, 5, 'M2', 'boa_M2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (26, 6, 'L1', 'bov_L1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (27, 6, 'L2', 'bov_L2');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (28, 6, 'L3', 'bov_L3');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (29, 6, 'M1', 'bov_M1');
INSERT INTO classe (idclasse, idfiliere, niveau, nom) VALUES (30, 6, 'M2', 'bov_M2');


--
-- Name: classe_idclasse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classe_idclasse_seq', 30, true);


--
-- Data for Name: departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departement (iddepartement, code, libelle) VALUES (1, 'info', 'informatique');
INSERT INTO departement (iddepartement, code, libelle) VALUES (2, 'maths', 'mathematiques');
INSERT INTO departement (iddepartement, code, libelle) VALUES (3, 'phys', 'physiques');
INSERT INTO departement (iddepartement, code, libelle) VALUES (4, 'boa', 'biologie animale');
INSERT INTO departement (iddepartement, code, libelle) VALUES (5, 'bov', 'biologie vegetale');
INSERT INTO departement (iddepartement, code, libelle) VALUES (6, 'chm', 'chimie');


--
-- Name: departement_iddepartement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('departement_iddepartement_seq', 6, true);


--
-- Data for Name: droit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO droit (iddroit, idadmin, nom) VALUES (1, 1, 'modifier, consulte note');
INSERT INTO droit (iddroit, idadmin, nom) VALUES (2, 1, 'connecte');
INSERT INTO droit (iddroit, idadmin, nom) VALUES (3, 2, 'supprimer note');
INSERT INTO droit (iddroit, idadmin, nom) VALUES (4, 2, 'consulte, imprimer note');
INSERT INTO droit (iddroit, idadmin, nom) VALUES (5, 3, 'recevoir requete, notification');
INSERT INTO droit (iddroit, idadmin, nom) VALUES (6, 4, 'publier PV');
INSERT INTO droit (iddroit, idadmin, nom) VALUES (7, 5, 'proceder au deliberation');


--
-- Name: droit_iddroit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('droit_iddroit_seq', 7, true);


--
-- Data for Name: enseignant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens1234', 3, 1, 'assistant', 'systeme d exploitation');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens2134', 4, 1, 'assistant', 'genie logiciel');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens1111', 5, 1, 'professeur', 'genie logiciel');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens2222', 6, 3, 'professeur', 'mecanique');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens1122', 9, 2, 'charge de cours', 'statistique');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens3215', 13, 1, 'professeur', 'automate');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens3451', 14, 1, 'charge de cours', 'syteme d exploitation');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens5412', 15, 2, 'charge de cours', 'algÃ©bre');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens2345', 16, 2, 'charge de cours', 'analyse');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens3232', 117, 1, 'charge de cours', 'mathematique discret');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens4545', 118, 1, 'charge de cours', 'architecture');
INSERT INTO enseignant (matricule, idpersonne, iddepartement, grade, specialite) VALUES ('ens8080', 119, 1, 'charge de cours', 'genie logiciel');


--
-- Data for Name: enseignant_chef_departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enseignant_chef_departement (idenseignantchefdepartement, matricule, iddepartement, annee) VALUES (1, 'ens1111', 1, '2015-2016');
INSERT INTO enseignant_chef_departement (idenseignantchefdepartement, matricule, iddepartement, annee) VALUES (2, 'ens2222', 1, '2015-2016');


--
-- Name: enseignant_chef_departement_idenseignantchefdepartement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enseignant_chef_departement_idenseignantchefdepartement_seq', 2, true);


--
-- Data for Name: enseignant_classe_jury; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enseignant_classe_jury (idenseignantclassejury, idclasse, matricule, annee) VALUES (1, 16, 'ens3232', '2015-2016');
INSERT INTO enseignant_classe_jury (idenseignantclassejury, idclasse, matricule, annee) VALUES (2, 17, 'ens3215', '2015-2016');
INSERT INTO enseignant_classe_jury (idenseignantclassejury, idclasse, matricule, annee) VALUES (3, 18, 'ens8080', '2015-2016');
INSERT INTO enseignant_classe_jury (idenseignantclassejury, idclasse, matricule, annee) VALUES (4, 19, 'ens4545', '2015-2016');
INSERT INTO enseignant_classe_jury (idenseignantclassejury, idclasse, matricule, annee) VALUES (5, 20, 'ens1111', '2015-2016');


--
-- Name: enseignant_classe_jury_idenseignantclassejury_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enseignant_classe_jury_idenseignantclassejury_seq', 5, true);


--
-- Data for Name: enseignant_mat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enseignant_mat (idenseignantmat, idmatiere, matricule, annee) VALUES (1, 24, 'ens3451', '2015-2016');
INSERT INTO enseignant_mat (idenseignantmat, idmatiere, matricule, annee) VALUES (2, 19, 'ens3451', '2015-2016');
INSERT INTO enseignant_mat (idenseignantmat, idmatiere, matricule, annee) VALUES (3, 14, 'ens3215', '2015-2016');
INSERT INTO enseignant_mat (idenseignantmat, idmatiere, matricule, annee) VALUES (4, 2, 'ens1111', '2015-2016');
INSERT INTO enseignant_mat (idenseignantmat, idmatiere, matricule, annee) VALUES (5, 22, 'ens1111', '2015-2016');
INSERT INTO enseignant_mat (idenseignantmat, idmatiere, matricule, annee) VALUES (6, 16, 'ens1234', '2015-2016');
INSERT INTO enseignant_mat (idenseignantmat, idmatiere, matricule, annee) VALUES (7, 22, 'ens2134', '2014-2015');


--
-- Name: enseignant_mat_idenseignantmat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enseignant_mat_idenseignantmat_seq', 7, true);


--
-- Data for Name: etablir_droit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (1, 'ens1111', 4, 6, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (2, 'ens1111', 4, 2, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (3, 'ens1111', 4, 5, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (4, 'ens1111', 4, 1, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (5, 'ens1111', 4, 7, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (6, 'ens2222', 5, 2, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (7, 'ens2222', 5, 6, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (8, 'ens2222', 5, 1, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (9, 'ens2222', 5, 7, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (10, 'ens2222', 5, 5, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (11, 'ens3451', 10, 1, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (12, 'ens3451', 10, 2, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (13, 'ens3451', 10, 4, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (14, 'ens5412', 11, 2, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (15, 'ens5412', 11, 1, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (16, 'ens5412', 11, 4, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (17, 'ens2345', 12, 2, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (18, 'ens2345', 12, 4, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (19, 'ens2345', 12, 1, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (20, 'ens1122', 13, 2, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (21, 'ens1122', 13, 1, '01-01-2015', '01-01-2016');
INSERT INTO etablir_droit (idetablirdroit, matricule, idadministatif, iddroit, datedeb, datefin) VALUES (22, 'ens1122', 13, 4, '01-01-2015', '01-01-2016');


--
-- Name: etablir_droit_idetablirdroit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('etablir_droit_idetablirdroit_seq', 22, true);


--
-- Data for Name: etudiant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO etudiant (matricule, idpersonne) VALUES ('12Y080', 1);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('11U0049', 2);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0001', 70);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0002', 71);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0003', 72);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0004', 73);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0005', 74);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0006', 75);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0007', 76);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0008', 77);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0009', 78);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0010', 79);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0011', 80);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0012', 81);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0013', 82);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0014', 69);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0015', 83);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0016', 84);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0017', 85);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0018', 86);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0019', 87);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0020', 88);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0021', 89);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0022', 90);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0023', 91);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0024', 92);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0025', 93);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0026', 94);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0027', 95);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0028', 96);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0030', 97);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0029', 98);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0031', 99);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0032', 100);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0033', 101);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0034', 102);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0035', 103);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0036', 104);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0037', 105);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0038', 106);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0039', 107);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0040', 108);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0042', 109);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0041', 110);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0043', 111);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0044', 112);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0045', 113);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0046', 114);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0047', 115);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0048', 116);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0049', 68);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0050', 67);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0051', 66);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0052', 65);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0053', 64);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('12U0054', 63);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('11U0041', 62);
INSERT INTO etudiant (matricule, idpersonne) VALUES ('11U0019', 8);


--
-- Data for Name: etudiant_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (1, '11U0049', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (2, '12Y080', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (3, '12U0009', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (4, '12U0008', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (5, '12U0007', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (6, '12U0006', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (7, '12U0005', 18, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (8, '12U0004', 18, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (9, '12U0003', 18, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (10, '12U0002', 18, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (11, '11U0019', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (12, '11U0041', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (13, '12U0010', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (14, '12U0011', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (15, '12U0012', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (16, '12U0013', 19, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (17, '12U0014', 18, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (18, '12U0015', 18, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (19, '12U0016', 18, '2015-2016');
INSERT INTO etudiant_classe (idetudiantclasse, matricule, idclasse, annee) VALUES (20, '12U0017', 18, '2015-2016');


--
-- Name: etudiant_classe_idetudiantclasse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('etudiant_classe_idetudiantclasse_seq', 20, true);


--
-- Data for Name: etudiant_exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (1, 1, '11U0049', '2015-2016', 15, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (2, 3, '11U0049', '2015-2016', 12, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (3, 1, '12Y080', '2015-2016', 16, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (4, 3, '12Y080', '2015-2016', 14, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (5, 5, '11U0049', '2015-2016', 15, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (6, 4, '11U0049', '2015-2016', 12, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (7, 5, '12Y080', '2015-2016', 16, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (8, 4, '12Y080', '2015-2016', 14, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (9, 1, '12U0009', '2015-2016', 15, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (10, 3, '12U0009', '2015-2016', 12, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (11, 5, '12U0009', '2015-2016', 16, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (12, 4, '12U0009', '2015-2016', 14, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (13, 1, '12U0008', '2015-2016', 15, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (14, 3, '12U0008', '2015-2016', 12, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (15, 5, '12U0008', '2015-2016', 16, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (16, 4, '12U0008', '2015-2016', 14, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (17, 1, '12U0005', '2015-2016', 15, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (18, 3, '12U0005', '2015-2016', 12, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (19, 5, '12U0005', '2015-2016', 16, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (20, 4, '12U0005', '2015-2016', 14, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (21, 1, '12U0004', '2015-2016', 15, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (22, 3, '12U0004', '2015-2016', 5, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (23, 5, '12U0004', '2015-2016', 16, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (24, 4, '12U0004', '2015-2016', 16, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (25, 1, '12U0003', '2015-2016', 15, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (26, 3, '12U0003', '2015-2016', 8, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (27, 5, '12U0003', '2015-2016', 16, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (28, 4, '12U0003', '2015-2016', 7, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (29, 1, '12U0002', '2015-2016', 17, '0000049');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (30, 3, '12U0002', '2015-2016', 18, NULL);
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (31, 5, '12U0002', '2015-2016', 12, '0000080');
INSERT INTO etudiant_exam (idetudiantexam, idexamen, matricule, annee, note, anonymat) VALUES (32, 4, '12U0002', '2015-2016', 11, NULL);


--
-- Name: etudiant_exam_idetudiantexam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('etudiant_exam_idetudiantexam_seq', 32, true);


--
-- Data for Name: examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO examen (idexamen, date_exam, type_exam) VALUES (1, '10-01-2016', 'normale');
INSERT INTO examen (idexamen, date_exam, type_exam) VALUES (2, '10-02-2016', 'rattrapage');
INSERT INTO examen (idexamen, date_exam, type_exam) VALUES (3, '12-12-2015', 'cc');
INSERT INTO examen (idexamen, date_exam, type_exam) VALUES (4, '05-05-2016', 'cc');
INSERT INTO examen (idexamen, date_exam, type_exam) VALUES (5, '18-06-2016', 'normale');
INSERT INTO examen (idexamen, date_exam, type_exam) VALUES (6, '05-07-2016', 'rattrapage');
INSERT INTO examen (idexamen, date_exam, type_exam) VALUES (7, '05-07-2016', 'tp');


--
-- Name: examen_idexamen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('examen_idexamen_seq', 7, true);


--
-- Data for Name: filiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO filiere (idfiliere, iddepartement, code, libelle) VALUES (1, 3, 'phys', 'physique');
INSERT INTO filiere (idfiliere, iddepartement, code, libelle) VALUES (2, 6, 'chm', 'chimie');
INSERT INTO filiere (idfiliere, iddepartement, code, libelle) VALUES (3, 2, 'maths', 'mathematiques');
INSERT INTO filiere (idfiliere, iddepartement, code, libelle) VALUES (4, 1, 'info', 'informatique');
INSERT INTO filiere (idfiliere, iddepartement, code, libelle) VALUES (5, 4, 'boa', 'biologie animale');
INSERT INTO filiere (idfiliere, iddepartement, code, libelle) VALUES (6, 5, 'bov', 'biologie vegetale');


--
-- Name: filiere_idfiliere_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filiere_idfiliere_seq', 6, true);


--
-- Data for Name: inscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (1, 3, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (2, 2, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (3, 4, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (4, 5, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (5, 6, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (6, 7, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (7, 8, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (8, 9, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (9, 25, '11U0049', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (10, 3, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (11, 2, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (12, 4, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (13, 5, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (14, 6, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (15, 7, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (16, 8, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (17, 9, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (18, 25, '12Y080', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (19, 3, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (20, 2, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (21, 4, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (22, 5, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (23, 6, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (24, 7, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (25, 8, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (26, 9, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (27, 25, '12U0009', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (28, 3, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (29, 2, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (30, 4, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (31, 5, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (32, 6, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (33, 7, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (34, 8, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (35, 9, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (36, 25, '12U0008', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (37, 3, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (38, 2, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (39, 4, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (40, 5, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (41, 6, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (42, 7, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (43, 8, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (44, 9, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (45, 25, '12U0007', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (46, 3, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (47, 2, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (48, 4, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (49, 5, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (50, 6, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (51, 7, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (52, 8, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (53, 9, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (54, 25, '12U0006', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (55, 1, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (56, 18, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (57, 19, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (58, 20, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (59, 21, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (60, 22, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (61, 23, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (62, 24, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (63, 26, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (64, 27, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (65, 28, '12U0005', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (66, 1, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (67, 18, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (68, 19, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (69, 20, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (70, 21, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (71, 22, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (72, 23, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (73, 24, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (74, 26, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (75, 27, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (76, 28, '12U0004', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (77, 1, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (78, 18, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (79, 19, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (80, 20, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (81, 21, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (82, 22, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (83, 23, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (84, 24, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (85, 26, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (86, 27, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (87, 28, '12U0003', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (88, 1, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (89, 18, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (90, 19, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (91, 20, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (92, 21, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (93, 22, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (94, 23, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (95, 24, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (96, 26, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (97, 27, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (98, 28, '12U0002', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (99, 3, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (100, 2, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (101, 4, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (102, 5, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (103, 6, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (104, 7, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (105, 8, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (106, 9, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (107, 25, '11U0019', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (108, 3, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (109, 2, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (110, 4, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (111, 5, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (112, 6, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (113, 7, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (114, 8, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (115, 9, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (116, 25, '11U0041', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (117, 1, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (118, 18, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (119, 19, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (120, 20, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (121, 21, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (122, 22, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (123, 23, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (124, 24, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (125, 26, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (126, 27, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (127, 28, '12U0010', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (128, 1, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (129, 18, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (130, 19, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (131, 20, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (132, 21, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (133, 22, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (134, 23, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (135, 24, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (136, 26, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (137, 27, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (138, 28, '12U0011', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (139, 1, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (140, 18, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (141, 19, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (142, 20, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (143, 21, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (144, 22, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (145, 23, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (146, 24, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (147, 26, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (148, 27, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (149, 28, '12U0012', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (150, 1, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (151, 18, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (152, 19, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (153, 20, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (154, 21, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (155, 22, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (156, 23, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (157, 24, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (158, 26, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (159, 27, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (160, 28, '12U0013', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (161, 1, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (162, 18, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (163, 19, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (164, 20, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (165, 21, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (166, 22, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (167, 23, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (168, 24, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (169, 26, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (170, 27, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (171, 28, '12U0014', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (172, 1, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (173, 18, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (174, 19, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (175, 20, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (176, 21, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (177, 22, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (178, 23, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (179, 24, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (180, 26, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (181, 27, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (182, 28, '12U0015', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (183, 1, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (184, 18, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (185, 19, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (186, 20, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (187, 21, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (188, 22, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (189, 23, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (190, 24, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (191, 26, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (192, 27, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (193, 28, '12U0016', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (194, 1, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (195, 18, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (196, 19, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (197, 20, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (198, 21, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (199, 22, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (200, 23, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (201, 24, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (202, 26, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (203, 27, '12U0017', '2015-2016');
INSERT INTO inscription (idinscription, idmatiere, matricule, annee) VALUES (204, 28, '12U0017', '2015-2016');


--
-- Name: inscription_idinscription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inscription_idinscription_seq', 204, true);


--
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO matiere (idmatiere, code, libelle) VALUES (1, 'inf302', 'Bases de donnees');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (2, 'inf401', 'systeme d information');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (3, 'inf401', 'Bases de donnees avancee');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (4, 'inf420', 'complexite');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (5, 'inf407', 'compilation');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (6, 'inf409', 'reseau');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (7, 'inf403', 'systeme d exploitation');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (8, 'inf423', 'conception orientee objet');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (9, 'inf405', 'genie logiciel');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (10, 'math113', 'analyse');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (11, 'math111', 'algebre');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (12, 'inf113', 'algorithmique');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (13, 'phy111', 'electrostatique');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (14, 'phy120', 'loi d evolution1');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (15, 'phy121', 'loi d evolution2');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (16, 'math240', 'analyse2');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (17, 'math221', 'serie de fourier');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (18, 'inf309', 'introduction au reseau');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (19, 'inf305', 'algorithme et structure de donnee');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (20, 'inf304', 'conception oriente objet');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (21, 'inf306', 'genie logiciel');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (22, 'inf301', 'systeme d exploitation');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (23, 'inf320', 'programmation logique');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (24, 'inf310', 'logique');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (25, 'inf407', 'architecture des ordinateurs');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (26, 'inf303', 'architecture(asm)');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (27, 'inf307', 'systeme d information');
INSERT INTO matiere (idmatiere, code, libelle) VALUES (28, 'inf308', 'administration systeme');


--
-- Data for Name: matiere_exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (1, 1, 1, '2015-2016', 50);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (2, 1, 2, '2015-2016', 50);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (3, 1, 3, '2015-2016', 20);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (4, 1, 7, '2015-2016', 30);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (5, 2, 4, '2015-2016', 30);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (6, 2, 5, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (7, 2, 6, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (8, 3, 1, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (9, 3, 2, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (10, 3, 3, '2015-2016', 30);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (11, 4, 4, '2015-2016', 30);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (12, 4, 5, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (13, 4, 6, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (14, 5, 1, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (15, 5, 2, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (16, 5, 3, '2015-2016', 30);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (17, 6, 4, '2015-2016', 30);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (18, 6, 5, '2015-2016', 70);
INSERT INTO matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage) VALUES (19, 6, 6, '2015-2016', 70);


--
-- Name: matiere_exam_idmatiereexam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matiere_exam_idmatiereexam_seq', 19, true);


--
-- Name: matiere_idmatiere_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matiere_idmatiere_seq', 28, true);


--
-- Data for Name: matiere_ue; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (1, 2, 'info401', '2015-2016', 5);
INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (2, 3, 'info401', '2015-2016', 5);
INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (3, 4, 'info420', '2015-2016', 5);
INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (4, 5, 'info420', '2015-2016', 5);
INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (5, 6, 'info409', '2015-2016', 5);
INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (6, 7, 'info409', '2015-2016', 5);
INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (7, 8, 'info405', '2015-2016', 5);
INSERT INTO matiere_ue (idmatiereue, idmatiere, code, annee, credit) VALUES (8, 9, 'info405', '2015-2016', 5);


--
-- Name: matiere_ue_idmatiereue_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matiere_ue_idmatiereue_seq', 8, true);


--
-- Data for Name: niveau; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO niveau (niveau, cycle) VALUES ('L1', 'Licence');
INSERT INTO niveau (niveau, cycle) VALUES ('L2', 'Licence');
INSERT INTO niveau (niveau, cycle) VALUES ('L3', 'Licence');
INSERT INTO niveau (niveau, cycle) VALUES ('M1', 'Master');
INSERT INTO niveau (niveau, cycle) VALUES ('M2', 'Master');


--
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (1, 'DJAMKOU KAMENI', 'REINE CLARISSE', '12-12-2012', 'YAOUNDE', 'F', 'djamkou', 'djamkou', 'etudiant', '677777777');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (2, 'DJANPOUM YOMI', 'HERVE', '04-04-2004', 'BOUDA', 'M', 'djanpoum', 'djanpoum', 'etudiant', '688888888');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (3, 'HAMZA', 'ADAMOU', '01-01-2001', 'FOUMBAN', 'M', 'hamza', 'hamza', 'enseignant', '600000000');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (4, 'MONTHE', 'VALERY', '02-02-2002', 'DOUALA', 'M', 'monthe', 'monthe', 'enseignant', '6111111111');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (5, 'ATSA ETOUNDI', 'ROGER', NULL, NULL, 'M', 'atsa', 'atsa', 'administratif', '666667774');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (6, 'KOFANE', 'KOFANE', NULL, NULL, 'M', 'kofane', 'kofane', 'administratif', '655555533');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (7, 'DJAMKO KAMENI', 'REINE CLARISSE', '12-12-2012', 'YAOUNDE', 'F', 'djamko', 'djamko', 'etudiant', '677777777');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (8, 'YOMI', 'HERVE', '04-04-2004', 'BOUDA', 'M', 'yomi', 'yomi', 'etudiant', '688888888');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (9, 'HAMADOU', 'ADAMOU', '01-01-2001', 'FOUMBAN', 'M', 'hamadou', 'hamadou', 'enseignant', '600000000');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (10, 'KOUAKAM', 'VALERY', '02-02-2002', 'DOUALA', 'M', 'kouakam', 'kouakam', 'enseignant', '6111111111');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (11, 'ETOUNDI', 'ARMAN', NULL, NULL, 'M', 'etoundi', 'etoundi', 'administratif', '666667774');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (12, 'FANE', 'KOFANE', NULL, NULL, 'M', 'fane', 'fane', 'administratif', '655555533');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (13, 'NDOUMDAM', 'RENE', NULL, NULL, 'M', 'ndoudam', 'ndoudam', 'enseignant', '233333333');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (14, 'TINDO', 'GILBERT', NULL, NULL, 'M', 'tindo', 'tindo', 'enseignant', '655555432');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (15, 'KUIMI', 'GILBERT', NULL, NULL, 'M', 'kuimi', 'kuimi', 'enseignant', '655555432');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (16, 'TCHAPDA', 'GILBERT', NULL, NULL, 'M', 'tchapda', 'tchapda', 'enseignant', '655555432');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (17, 'FEUTCHEU', 'LUDOVIC', '12-12-2012', 'DOUALA', 'M', 'feutcheu', 'feutcheu', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (18, 'TCHATOUA', 'WOLFGANG', '12-12-2012', 'FOTOKOL', 'M', 'tchatoua', 'tchatoua', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (19, 'MBARGA', 'MARTIAL', '12-12-2012', 'MBOUDA', 'M', 'mbarga', 'mbarga', 'etudiant', '667526319');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (20, 'TCHIENDA', 'WILLIAM', '12-12-2012', 'NTUI', 'F', 'tchienda', 'tchienda', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (21, 'ABANDA', 'PIUS', '12-12-2012', 'BANDJOUN', 'M', 'abanda', 'abanda', 'etudiant', '677526315');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (22, 'OUMAROU', 'GISLAIN', '12-12-2012', 'BAFOUSSAM', 'M', 'oumarou', 'oumarou', 'etudiant', '697526321');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (23, '''ETO''''O''', 'PAUL', '12-12-2012', 'MBALLA IV', 'M', 'eto o', 'eto o', 'etudiant', '697526328');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (24, 'NKANA', 'ROVINCE', '12-12-2012', 'EBEBDA', 'F', 'nkana', 'nkana', 'etudiant', '697526321');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (25, 'MBARGA', 'MARTIAL', '12-12-2012', 'MBALLA IV', 'M', 'mbarga', 'mbarga', 'etudiant', '677526324');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (26, 'LOMO', 'BOREL', '12-12-2012', '''SA''''A''', 'F', 'lomo', 'lomo', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (27, 'OKALA', 'WOLFGANG', '12-12-2012', 'OBALA', 'M', 'okala', 'okala', 'etudiant', '667526317');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (28, 'FEUTCHEU', 'MARTIN', '12-12-2012', 'GALIM', 'M', 'feutcheu', 'feutcheu', 'etudiant', '697526316');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (29, 'BIYA', 'AURELIEN', '12-12-2012', 'MONATELE', 'F', 'biya', 'biya', 'etudiant', '697526320');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (30, 'TCHATOUA', 'BOREL', '12-12-2012', 'NGAMBE', 'M', 'tchatoua', 'tchatoua', 'etudiant', '697526312');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (31, 'FEUTCHEU', 'ACHILE', '12-12-2012', 'EBOLOWA', 'F', 'feutcheu', 'feutcheu', 'etudiant', '697526318');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (32, 'KAMGA', 'LUDOVIC', '12-12-2012', 'NTUI', 'M', 'kamga', 'kamga', 'etudiant', '677526329');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (33, 'OKALA', 'ADIEL', '12-12-2012', 'KYE-OSSI', 'M', 'okala', 'okala', 'etudiant', '697526320');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (34, 'NKANA', 'SHESTER', '12-12-2012', 'MBALLA IV', 'F', 'nkana', 'nkana', 'etudiant', '677526315');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (35, 'FOTSO', 'ADIEL', '12-12-2012', 'NGAMBE', 'F', 'fotso', 'fotso', 'etudiant', '677526324');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (36, 'BIYA', 'ADIEL', '12-12-2012', 'EBEBDA', 'F', 'biya', 'biya', 'etudiant', '667526317');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (37, 'BESSONG', 'ROVINCE', '12-12-2012', 'NGAMBE', 'F', 'bessong', 'bessong', 'etudiant', '697526321');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (38, 'BIYA', 'ACHILE', '12-12-2012', 'GAROUA', 'F', 'biya', 'biya', 'etudiant', '697526327');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (39, 'HAMADOU', 'MARTIN', '12-12-2012', 'DOUALA', 'M', 'hamadou', 'hamadou', 'administratif', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (40, 'BESSONG', 'CAISER', '12-12-2012', 'GAROUA', 'F', 'bessong', 'bessong', 'administratif', '697526320');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (41, 'NKANA', 'BOREL', '12-12-2012', '''SA''''A''', 'F', 'nkana', 'nkana', 'administratif', '697526318');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (42, 'TCHIENDA', 'JOHNY', '12-12-2012', 'OBALA', 'M', 'tchienda', 'tchienda', 'administratif', '697526318');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (43, 'MBANDA', 'CAISER', '12-12-2012', 'NGAMBE', 'M', 'mbanda', 'mbanda', 'administratif', '677526322');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (44, 'ABANDA', 'WOLFGANG', '12-12-2012', 'DOUALA', 'M', 'abanda', 'abanda', 'administratif', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (45, 'OKALA', 'MARUS', '12-12-2012', 'MONATELE', 'M', 'okala', 'okala', 'administratif', '697526328');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (46, 'TCHIENDA', '12-12-2012', 'LUDOVIC', 'MBALLA IV', 'M', 'tchienda', 'tchienda', 'administratif', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (47, 'FEUTCHEU', 'CAISER', '12-12-2012', '''SA''''A''', 'M', 'feutcheu', 'feutcheu', 'administratif', '677526329');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (48, 'MBARGA', 'GISLAIN', '12-12-2012', 'OBALA', 'M', 'mbarga', 'mbarga', 'administratif', '677526315');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (49, 'BIYA', 'ACHILE', '12-12-2012', 'GALIM', 'M', 'biya', 'biya', 'administratif', '697526320');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (50, 'OUMAROU', 'SYDNEY', '12-12-2012', 'MBALLA IV', 'M', 'oumarou', 'oumarou', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (51, 'ABOUDI', 'ADIEL', '12-12-2012', 'GAROUA', 'F', 'aboudi', 'aboudi', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (52, 'TALA', 'AURELIEN', '12-12-2012', '''SA''''A''', 'M', 'tala', 'tala', 'etudiant', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (53, 'TCHATA', 'PIUS', '12-12-2012', 'EBEBDA', 'M', 'tchata', 'tchata', 'etudiant', '697526328');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (54, 'NKANA', 'BOREL', '12-12-2012', 'EBEBDA', 'F', 'nkana', 'nkana', 'etudiant', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (55, 'MBANDA', 'PIUS', '12-12-2012', 'BAFOUSSAM', 'M', 'mbanda', 'mbanda', 'etudiant', '697526328');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (56, 'MBARGA', 'SHESTER', '12-12-2012', 'EBEBDA', 'M', 'mbarga', 'mbarga', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (57, '''ETO''''O''', 'PAUL', '12-12-2012', 'GALIM', 'M', 'eto o', 'eto o', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (58, 'ABANDA', 'WOLFGANG', '12-12-2012', 'MANDJA', 'M', 'abanda', 'abanda', 'etudiant', '697526321');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (59, 'KAMGA', 'LEONARD', '12-12-2012', 'KRIBI', 'M', 'kamga', 'kamga', 'etudiant', '667526326');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (60, 'ABOUDI', 'CAISER', '12-12-2012', 'MANDJA', 'M', 'aboudi', 'aboudi', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (61, 'OUMAROU', 'WILLIAM', '12-12-2012', 'GALIM', 'M', 'oumarou', 'oumarou', 'etudiant', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (62, 'KAMGA', 'SYDNEY', '12-12-2012', 'EBEBDA', 'M', 'kamga', 'kamga', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (63, 'LOMO', 'SYDNEY', '12-12-2012', 'OBALA', 'F', 'lomo', 'lomo', 'etudiant', '697526327');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (64, 'FOTSO', 'ACHILE', '12-12-2012', 'DOUALA', 'M', 'fotso', 'fotso', 'etudiant', '677526315');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (65, 'TCHATA', 'JOHNY', '12-12-2012', 'NTUI', 'M', 'tchata', 'tchata', 'etudiant', '697526321');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (66, 'FEUTCHEU', 'PAUL', '12-12-2012', 'BAFOUSSAM', 'M', 'feutcheu', 'feutcheu', 'etudiant', '667526317');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (67, 'HAMADOU', 'ADIEL', '12-12-2012', 'BUEA', 'F', 'hamadou', 'hamadou', 'etudiant', '677526315');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (68, 'ABANDA', 'BOREL', '12-12-2012', 'NTUI', 'F', 'abanda', 'abanda', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (69, 'ABOUDI', 'ADIEL', '12-12-2012', 'EBOLOWA', 'F', 'aboudi', 'aboudi', 'etudiant', '667526313');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (70, 'FEUTCHEU', 'WILLIAM', '12-12-2012', 'NTUI', 'M', 'oumarou', 'oumarou', 'etudiant', '677526329');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (71, 'OKALA', 'JOHNY', '12-12-2012', 'NGAMBE', 'M', 'okala', 'okala', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (72, 'BESSONG', 'ADIEL', '12-12-2012', 'MBOUDA', 'F', 'bessong', 'bessong', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (73, 'NKE', 'WILLIAM', '01-01-2001', 'KYE-OSSI', 'M', 'nke', 'nke', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (74, '''ETO''''O''', 'ACHILE', '01-01-2001', 'MBALLA IV', 'M', 'eto o', 'eto o', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (75, 'TCHATA', 'LEONARD', '01-01-2001', 'EBEBDA', 'M', 'tchata', 'tchata', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (76, 'FOTSO', 'SHESTER', '01-01-2001', 'GALIM', 'M', 'fotso', 'fotso', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (77, 'OUMAROU', 'BOREL', '01-01-2001', '''SA''''A''', 'F', 'oumarou', 'oumarou', 'etudiant', '697526328');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (78, 'BIYA', 'MARUS', '01-01-2001', 'FOTOKOL', 'M', 'biya', 'biya', 'etudiant', '697526327');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (79, 'NKANA', 'ADIEL', '01-01-2001', 'KYE-OSSI', 'M', 'nkana', 'nkana', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (80, 'MBARGA', 'MARTIAL', '01-01-2001', 'NGAMBE', 'M', 'mbarga', 'mbarga', 'etudiant', '677526315');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (81, 'MBANDA', 'ACHILE', '01-01-2001', 'KRIBI', 'M', 'mbanda', 'mbanda', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (82, 'MBARGA', 'GISLAIN', '01-01-2001', 'GAROUA', 'M', 'mbarga', 'mbarga', 'etudiant', '677526324');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (83, 'OUMAROU', 'ACHILE', '01-01-2001', '''SA''''A''', 'M', 'oumarou', 'oumarou', 'etudiant', '697526328');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (84, 'TCHATA', 'MARTIN', '01-01-2001', 'MONATELE', 'M', 'tchata', 'tchata', 'etudiant', '667526313');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (85, 'OKALA', 'MARUS', '01-01-2001', 'GALIM', 'F', 'okala', 'okala', 'etudiant', '697526316');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (86, 'TALA', 'SYDNEY', '01-01-2001', 'EBOLOWA', 'F', 'tala', 'tala', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (87, 'ABOUDI', 'AURELIEN', '01-01-2001', 'MBALLA IV', 'F', 'aboudi', 'aboudi', 'etudiant', '697526316');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (88, 'TCHIENDA', 'AURELIEN', '01-01-2001', 'MBALLA IV', 'F', 'tchienda', 'tchienda', 'etudiant', '697526312');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (89, 'TCHIENDA', 'MARTIN', '01-01-2001', 'GAROUA', 'M', 'tchienda', 'tchienda', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (90, 'BIYA', 'LEONARD', '01-01-2001', 'FOTOKOL', 'M', 'biya', 'biya', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (91, 'MBARGA', 'WILLIAM', '01-01-2001', 'FOTOKOL', 'M', 'mbarga', 'mbarga', 'etudiant', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (92, 'MBARGA', 'AURELIEN', '01-01-2001', 'KRIBI', 'M', 'mbarga', 'mbarga', 'etudiant', '677526322');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (93, 'NKANA', 'ADIEL', '01-01-2001', 'OBALA', 'M', 'nkana', 'nkana', 'etudiant', '697526328');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (94, 'TALA', 'ROVINCE', '01-01-2001', 'GALIM', 'M', 'tala', 'tala', 'etudiant', '697526318');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (95, 'TCHATOUA', 'JOHNY', '01-01-2001', 'MANDJA', 'M', 'tchatoua', 'tchatoua', 'etudiant', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (96, 'NKE', 'WILLIAM', '01-01-2001', 'BANDJOUN', 'M', 'nke', 'nke', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (97, 'FEUTCHEU', 'ROVINCE', '01-01-2001', 'BAFOUSSAM', 'M', 'feutcheu', 'feutcheu', 'etudiant', '697526316');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (98, 'LOMO', 'SHESTER', '01-01-2001', 'MAROUA', 'M', 'lomo', 'lomo', 'etudiant', '677526315');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (99, 'KAMGA', 'MARTIN', '01-01-2001', 'DOUALA', 'M', 'kamga', 'kamga', 'etudiant', '677526314');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (100, 'BESSONG', 'BOREL', '01-01-2001', 'MAROUA', 'F', 'bessong', 'bessong', 'etudiant', '667526317');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (101, 'KAMGA', 'AURELIEN', '01-01-2001', 'MONATELE', 'F', 'kamga', 'kamga', 'etudiant', '677526324');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (102, 'OUMAROU', 'GISLAIN', '01-01-2001', 'EBEBDA', 'M', 'oumarou', 'oumarou', 'etudiant', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (103, 'LOMO', 'AURELIEN', '01-01-2001', 'GALIM', 'F', 'lomo', 'lomo', 'etudiant', '677526314');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (104, 'NKE', 'AURELIEN', '01-01-2001', 'EBOLOWA', 'F', 'nke', 'nke', 'etudiant', '667526317');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (105, 'BESSONG', 'ROVINCE', '01-01-2001', 'MANDJA', 'F', 'bessong', 'bessong', 'etudiant', '677526330');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (106, 'MBANDA', 'SYDNEY', '01-01-2001', 'KRIBI', 'M', 'mbanda', 'mbanda', 'etudiant', '697526323');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (107, 'MBANDA', 'LEONARD', '01-01-2001', 'BUEA', 'M', 'mbanda', 'mbanda', 'etudiant', '697526325');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (108, 'LOMO', 'SHESTER', '01-01-2001', 'BANDJOUN', 'M', 'lomo', 'lomo', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (109, 'OUMAROU', 'PAUL', '01-01-2001', 'NGAMBE', 'M', 'oumarou', 'oumarou', 'etudiant', '697526318');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (110, 'TCHATOUA', 'PIUS', '01-01-2001', 'OBALA', 'F', 'tchatoua', 'tchatoua', 'etudiant', '677526322');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (111, 'FOTSO', 'ROVINCE', '01-01-2001', 'MBOUDA', 'M', 'fotso', 'fotso', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (112, 'NKE', 'LAURENT', '01-01-2001', '''SA''''A''', 'M', 'nke', 'nke', 'etudiant', '697526331');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (113, 'TCHIENDA', 'JOHNY', '01-01-2001', 'EBEBDA', 'M', 'tchienda', 'tchienda', 'etudiant', '677526329');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (114, 'MBARGA', 'MARTIN', '01-01-2001', 'BUEA', 'M', 'mbarga', 'mbarga', 'etudiant', '677526314');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (115, 'NKANA', 'WILLIAM', '01-01-2001', 'DOUALA', 'M', 'nkana', 'nkana', 'etudiant', '697526316');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (116, 'FOTSO', 'MARTIAL', '01-01-2001', '''SA''''A''', 'M', 'fotso', 'fotso', 'etudiant', '697526312');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (117, 'MOTTO', 'SERGE', NULL, NULL, 'M', 'motto', 'motto', 'enseignant', '655555432');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (118, 'TSOPZE', 'NORBERT', NULL, NULL, 'M', 'tsopze', 'tsopze', 'enseignant', '655555432');
INSERT INTO personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel) VALUES (119, 'KIMBI', NULL, NULL, NULL, 'F', 'kimbi', 'kimbi', 'enseignant', '655555432');


--
-- Name: personne_idpersonne_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personne_idpersonne_seq', 119, true);


--
-- Data for Name: reponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (1, 'ens1234', 1, '14-06-2016', '15/20 et non 12/20');
INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (2, 'ens3215', 2, '21-06-2016', 'note attribuee 16/20');
INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (3, 'ens1234', 3, '14-06-2016', NULL);
INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (4, 'ens1111', 4, '21-06-2016', 'DJANPOUM et non DJAMPOUM');
INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (5, 'ens3451', 5, '14-06-2016', 'Le 05-06-2016');
INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (6, 'ens2134', 6, '22-06-2016', 'note attribuee 17/20');
INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (7, 'ens1234', 7, '24-06-2016', '12/20 et non 09/20');
INSERT INTO reponse (idreponse, matricule, idrequete, date_reponse, contenu) VALUES (8, 'ens2134', 8, '22-06-2016', 'note attribuee 15/20');


--
-- Name: reponse_idreponse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reponse_idreponse_seq', 8, true);


--
-- Data for Name: requete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (6, '12U0008', 'attribution de note', '21-06-2016', 'traite', NULL, NULL, NULL);
INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (7, '12U0001', 'modification de note', '22-06-2016', 'en_cours', NULL, NULL, NULL);
INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (1, '12Y080', 'modification de note', '12-06-2016', 'en_cours', 3, NULL, NULL);
INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (2, '11U0049', 'attribution de note', '20-06-2016', 'traite', 3, NULL, NULL);
INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (3, '12Y080', 'non publication de note', '13-06-2016', 'en_cours', 6, NULL, NULL);
INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (4, '11U0049', 'eurreur de nom', '20-05-2016', 'traite', 6, NULL, NULL);
INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (5, '12Y080', 'demande rattrapage de CC', '02-06-2016', 'en_cours', 9, NULL, NULL);
INSERT INTO requete (idrequete, matricule, objet, date_requete, etat, idmatiere, contenu, typerequete) VALUES (8, '12U0009', 'attribution de note', '10-06-2016', 'traite', 5, NULL, NULL);


--
-- Name: requete_idrequete_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requete_idrequete_seq', 8, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO role (idrole, idadmin, role) VALUES (1, 1, 'etudiant');
INSERT INTO role (idrole, idadmin, role) VALUES (2, 2, 'etudiant');
INSERT INTO role (idrole, idadmin, role) VALUES (3, 2, 'enseignant');
INSERT INTO role (idrole, idadmin, role) VALUES (4, 2, 'president jury');
INSERT INTO role (idrole, idadmin, role) VALUES (5, 2, 'enseignant, president jury');
INSERT INTO role (idrole, idadmin, role) VALUES (6, 4, 'chef departement');
INSERT INTO role (idrole, idadmin, role) VALUES (7, 5, 'president jury, enseignant');


--
-- Name: role_idrole_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_idrole_seq', 7, true);


--
-- Data for Name: roleadministratif; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO roleadministratif (idadministatif, idrole) VALUES (1, 3);
INSERT INTO roleadministratif (idadministatif, idrole) VALUES (1, 4);


--
-- Data for Name: roleenseignant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens1111', 5);
INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens2222', 5);
INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens1111', 6);
INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens1111', 3);
INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens3232', 3);
INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens3232', 6);
INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens4545', 3);
INSERT INTO roleenseignant (matricule, idrole) VALUES ('ens4545', 6);


--
-- Data for Name: roleetudiant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '11U0049');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12Y080');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '11U0049');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12Y080');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0002');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0003');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0004');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0005');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0006');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0007');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0008');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0009');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0010');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0011');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0012');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0013');
INSERT INTO roleetudiant (idrole, matricule) VALUES (1, '12U0014');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0002');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0003');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0004');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0005');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0006');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0007');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0008');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0009');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0010');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0011');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0012');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0013');
INSERT INTO roleetudiant (idrole, matricule) VALUES (2, '12U0014');


--
-- Data for Name: semestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO semestre (idsemestre, annee, semestre) VALUES (1, '2015-2016', 'S1');
INSERT INTO semestre (idsemestre, annee, semestre) VALUES (2, '2015-2016', 'S2');
INSERT INTO semestre (idsemestre, annee, semestre) VALUES (3, '2015-2016', 'S3');
INSERT INTO semestre (idsemestre, annee, semestre) VALUES (4, '2015-2016', 'S4');


--
-- Name: semestre_idsemestre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('semestre_idsemestre_seq', 4, true);


--
-- Data for Name: ue; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ue (code, idsemestre, libelle) VALUES ('info401', 1, 'base de donnee avancee SI');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info420', 2, 'compilation complexite');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info409', 1, 'reseau systeme d exploitation');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info405', 1, 'conception oriente objet');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info302', 2, 'base de donnees');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info306', 2, 'genie logiciel');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info320', 2, 'logique');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info310', 1, 'programmation logique');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info301', 1, 'systeme d exploitation');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info407', 2, 'architacture');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info403', 1, 'systeme d exploitation');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('phyo120', 1, 'mecanique');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('phyo113', 1, 'optique');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('phyo121', 1, 'electrostaique');
INSERT INTO ue (code, idsemestre, libelle) VALUES ('info309', 1, 'reseau');


--
-- Data for Name: ue_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (1, 'info302', 18, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (2, 'info309', 18, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (3, 'info306', 18, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (4, 'info320', 18, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (5, 'info310', 18, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (6, 'info301', 18, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (7, 'info407', 19, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (8, 'info420', 19, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (9, 'info403', 19, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (10, 'info401', 19, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (11, 'info409', 19, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (12, 'info405', 19, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (13, 'phyo120', 1, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (14, 'phyo113', 1, '2015-2016');
INSERT INTO ue_classe (idueclasse, code, idclasse, annee) VALUES (15, 'phyo121', 1, '2015-2016');


--
-- Name: ue_classe_idueclasse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ue_classe_idueclasse_seq', 15, true);


--
-- Name: pk_admin; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administrateur
    ADD CONSTRAINT pk_admin PRIMARY KEY (idadmin);


--
-- Name: pk_administratif; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administratif
    ADD CONSTRAINT pk_administratif PRIMARY KEY (idadministatif);


--
-- Name: pk_annee_academique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY annee_academique
    ADD CONSTRAINT pk_annee_academique PRIMARY KEY (annee);


--
-- Name: pk_appartenirdroit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY appartenirdroit
    ADD CONSTRAINT pk_appartenirdroit PRIMARY KEY (iddroit, idrole);


--
-- Name: pk_classe; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY classe
    ADD CONSTRAINT pk_classe PRIMARY KEY (idclasse);


--
-- Name: pk_departement; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departement
    ADD CONSTRAINT pk_departement PRIMARY KEY (iddepartement);


--
-- Name: pk_droit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY droit
    ADD CONSTRAINT pk_droit PRIMARY KEY (iddroit);


--
-- Name: pk_enseignant; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enseignant
    ADD CONSTRAINT pk_enseignant PRIMARY KEY (matricule);


--
-- Name: pk_enseignant_chef_departement; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enseignant_chef_departement
    ADD CONSTRAINT pk_enseignant_chef_departement PRIMARY KEY (idenseignantchefdepartement);


--
-- Name: pk_enseignant_classe_jury; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enseignant_classe_jury
    ADD CONSTRAINT pk_enseignant_classe_jury PRIMARY KEY (idenseignantclassejury);


--
-- Name: pk_enseignant_mat; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT pk_enseignant_mat PRIMARY KEY (idenseignantmat);


--
-- Name: pk_etablir_droit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT pk_etablir_droit PRIMARY KEY (idetablirdroit);


--
-- Name: pk_etudiant; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY etudiant
    ADD CONSTRAINT pk_etudiant PRIMARY KEY (matricule);


--
-- Name: pk_etudiant_classe; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY etudiant_classe
    ADD CONSTRAINT pk_etudiant_classe PRIMARY KEY (idetudiantclasse);


--
-- Name: pk_etudiant_exam; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT pk_etudiant_exam PRIMARY KEY (idetudiantexam);


--
-- Name: pk_examen; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY examen
    ADD CONSTRAINT pk_examen PRIMARY KEY (idexamen);


--
-- Name: pk_filiere; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT pk_filiere PRIMARY KEY (idfiliere);


--
-- Name: pk_inscription; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT pk_inscription PRIMARY KEY (idinscription);


--
-- Name: pk_matiere; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT pk_matiere PRIMARY KEY (idmatiere);


--
-- Name: pk_matiere_exam; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matiere_exam
    ADD CONSTRAINT pk_matiere_exam PRIMARY KEY (idmatiereexam);


--
-- Name: pk_matiere_ue; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matiere_ue
    ADD CONSTRAINT pk_matiere_ue PRIMARY KEY (idmatiereue);


--
-- Name: pk_niveau; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY niveau
    ADD CONSTRAINT pk_niveau PRIMARY KEY (niveau);


--
-- Name: pk_personne; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT pk_personne PRIMARY KEY (idpersonne);


--
-- Name: pk_reponse; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT pk_reponse PRIMARY KEY (idreponse);


--
-- Name: pk_requete; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT pk_requete PRIMARY KEY (idrequete);


--
-- Name: pk_role; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT pk_role PRIMARY KEY (idrole);


--
-- Name: pk_roleadministratif; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roleadministratif
    ADD CONSTRAINT pk_roleadministratif PRIMARY KEY (idadministatif, idrole);


--
-- Name: pk_roleenseignant; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roleenseignant
    ADD CONSTRAINT pk_roleenseignant PRIMARY KEY (matricule, idrole);


--
-- Name: pk_roleetudiant; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roleetudiant
    ADD CONSTRAINT pk_roleetudiant PRIMARY KEY (idrole, matricule);


--
-- Name: pk_semestre; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY semestre
    ADD CONSTRAINT pk_semestre PRIMARY KEY (idsemestre);


--
-- Name: pk_ue; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ue
    ADD CONSTRAINT pk_ue PRIMARY KEY (code);


--
-- Name: pk_ue_classe; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ue_classe
    ADD CONSTRAINT pk_ue_classe PRIMARY KEY (idueclasse);


--
-- Name: i_fk_administratif_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX i_fk_administratif_personne ON administratif USING btree (idpersonne);


--
-- Name: i_fk_appartenirdroit_droit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_appartenirdroit_droit ON appartenirdroit USING btree (iddroit);


--
-- Name: i_fk_appartenirdroit_role; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_appartenirdroit_role ON appartenirdroit USING btree (idrole);


--
-- Name: i_fk_classe_filiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_classe_filiere ON classe USING btree (idfiliere);


--
-- Name: i_fk_classe_niveau; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_classe_niveau ON classe USING btree (niveau);


--
-- Name: i_fk_droit_admin; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_admin ON droit USING btree (idadmin);


--
-- Name: i_fk_enseignant_chef_departem1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_chef_departem1 ON enseignant_chef_departement USING btree (iddepartement);


--
-- Name: i_fk_enseignant_chef_departem2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_chef_departem2 ON enseignant_chef_departement USING btree (annee);


--
-- Name: i_fk_enseignant_chef_departeme; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_chef_departeme ON enseignant_chef_departement USING btree (matricule);


--
-- Name: i_fk_enseignant_classe_jury_an; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_classe_jury_an ON enseignant_classe_jury USING btree (annee);


--
-- Name: i_fk_enseignant_classe_jury_cl; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_classe_jury_cl ON enseignant_classe_jury USING btree (idclasse);


--
-- Name: i_fk_enseignant_classe_jury_en; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_classe_jury_en ON enseignant_classe_jury USING btree (matricule);


--
-- Name: i_fk_enseignant_departement; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_departement ON enseignant USING btree (iddepartement);


--
-- Name: i_fk_enseignant_mat_annee_acad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_mat_annee_acad ON enseignant_mat USING btree (annee);


--
-- Name: i_fk_enseignant_mat_enseignant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_mat_enseignant ON enseignant_mat USING btree (matricule);


--
-- Name: i_fk_enseignant_mat_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_mat_matiere ON enseignant_mat USING btree (idmatiere);


--
-- Name: i_fk_enseignant_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX i_fk_enseignant_personne ON enseignant USING btree (idpersonne);


--
-- Name: i_fk_etablir_droit_administrat; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_administrat ON etablir_droit USING btree (idadministatif);


--
-- Name: i_fk_etablir_droit_droit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_droit ON etablir_droit USING btree (iddroit);


--
-- Name: i_fk_etablir_droit_enseignant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_enseignant ON etablir_droit USING btree (matricule);


--
-- Name: i_fk_etudiant_classe_annee_aca; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_classe_annee_aca ON etudiant_classe USING btree (annee);


--
-- Name: i_fk_etudiant_classe_classe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_classe_classe ON etudiant_classe USING btree (idclasse);


--
-- Name: i_fk_etudiant_classe_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_classe_etudiant ON etudiant_classe USING btree (matricule);


--
-- Name: i_fk_etudiant_exam_annee_acade; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_exam_annee_acade ON etudiant_exam USING btree (annee);


--
-- Name: i_fk_etudiant_exam_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_exam_etudiant ON etudiant_exam USING btree (matricule);


--
-- Name: i_fk_etudiant_exam_examen; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_exam_examen ON etudiant_exam USING btree (idexamen);


--
-- Name: i_fk_etudiant_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX i_fk_etudiant_personne ON etudiant USING btree (idpersonne);


--
-- Name: i_fk_filiere_departement; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_filiere_departement ON filiere USING btree (iddepartement);


--
-- Name: i_fk_inscription_annee_academi; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_inscription_annee_academi ON inscription USING btree (annee);


--
-- Name: i_fk_inscription_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_inscription_etudiant ON inscription USING btree (matricule);


--
-- Name: i_fk_inscription_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_inscription_matiere ON inscription USING btree (idmatiere);


--
-- Name: i_fk_matiere_exam_annee_academ; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_matiere_exam_annee_academ ON matiere_exam USING btree (annee);


--
-- Name: i_fk_matiere_exam_examen; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_matiere_exam_examen ON matiere_exam USING btree (idexamen);


--
-- Name: i_fk_matiere_exam_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_matiere_exam_matiere ON matiere_exam USING btree (idmatiere);


--
-- Name: i_fk_matiere_ue_annee_academiq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_matiere_ue_annee_academiq ON matiere_ue USING btree (annee);


--
-- Name: i_fk_matiere_ue_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_matiere_ue_matiere ON matiere_ue USING btree (idmatiere);


--
-- Name: i_fk_matiere_ue_ue; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_matiere_ue_ue ON matiere_ue USING btree (code);


--
-- Name: i_fk_reponse_enseignant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_reponse_enseignant ON reponse USING btree (matricule);


--
-- Name: i_fk_reponse_requete; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX i_fk_reponse_requete ON reponse USING btree (idrequete);


--
-- Name: i_fk_requete_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requete_etudiant ON requete USING btree (matricule);


--
-- Name: i_fk_role_admin; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_role_admin ON role USING btree (idadmin);


--
-- Name: i_fk_roleadministratif_adminis; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_roleadministratif_adminis ON roleadministratif USING btree (idadministatif);


--
-- Name: i_fk_roleadministratif_role; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_roleadministratif_role ON roleadministratif USING btree (idrole);


--
-- Name: i_fk_roleenseignant_enseignant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_roleenseignant_enseignant ON roleenseignant USING btree (matricule);


--
-- Name: i_fk_roleenseignant_role; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_roleenseignant_role ON roleenseignant USING btree (idrole);


--
-- Name: i_fk_roleetudiant_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_roleetudiant_etudiant ON roleetudiant USING btree (matricule);


--
-- Name: i_fk_roleetudiant_role; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_roleetudiant_role ON roleetudiant USING btree (idrole);


--
-- Name: i_fk_semestre_annee_academique; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_semestre_annee_academique ON semestre USING btree (annee);


--
-- Name: i_fk_ue_classe_annee_academiqu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_ue_classe_annee_academiqu ON ue_classe USING btree (annee);


--
-- Name: i_fk_ue_classe_classe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_ue_classe_classe ON ue_classe USING btree (idclasse);


--
-- Name: i_fk_ue_classe_ue; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_ue_classe_ue ON ue_classe USING btree (code);


--
-- Name: i_fk_ue_semestre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_ue_semestre ON ue USING btree (idsemestre);


--
-- Name: fk_administratif_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administratif
    ADD CONSTRAINT fk_administratif_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


--
-- Name: fk_appartenirdroit_droit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appartenirdroit
    ADD CONSTRAINT fk_appartenirdroit_droit FOREIGN KEY (iddroit) REFERENCES droit(iddroit);


--
-- Name: fk_appartenirdroit_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appartenirdroit
    ADD CONSTRAINT fk_appartenirdroit_role FOREIGN KEY (idrole) REFERENCES role(idrole);


--
-- Name: fk_classe_filiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classe
    ADD CONSTRAINT fk_classe_filiere FOREIGN KEY (idfiliere) REFERENCES filiere(idfiliere);


--
-- Name: fk_classe_niveau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classe
    ADD CONSTRAINT fk_classe_niveau FOREIGN KEY (niveau) REFERENCES niveau(niveau);


--
-- Name: fk_droit_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit
    ADD CONSTRAINT fk_droit_admin FOREIGN KEY (idadmin) REFERENCES administrateur(idadmin);


--
-- Name: fk_enseignant_chef_departement_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_chef_departement
    ADD CONSTRAINT fk_enseignant_chef_departement_a FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_enseignant_chef_departement_d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_chef_departement
    ADD CONSTRAINT fk_enseignant_chef_departement_d FOREIGN KEY (iddepartement) REFERENCES departement(iddepartement);


--
-- Name: fk_enseignant_chef_departement_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_chef_departement
    ADD CONSTRAINT fk_enseignant_chef_departement_e FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- Name: fk_enseignant_classe_jury_annee_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_classe_jury
    ADD CONSTRAINT fk_enseignant_classe_jury_annee_ FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_enseignant_classe_jury_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_classe_jury
    ADD CONSTRAINT fk_enseignant_classe_jury_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- Name: fk_enseignant_classe_jury_enseig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_classe_jury
    ADD CONSTRAINT fk_enseignant_classe_jury_enseig FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- Name: fk_enseignant_departement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant
    ADD CONSTRAINT fk_enseignant_departement FOREIGN KEY (iddepartement) REFERENCES departement(iddepartement);


--
-- Name: fk_enseignant_mat_annee_academiq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT fk_enseignant_mat_annee_academiq FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_enseignant_mat_enseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT fk_enseignant_mat_enseignant FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- Name: fk_enseignant_mat_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT fk_enseignant_mat_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_enseignant_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant
    ADD CONSTRAINT fk_enseignant_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


--
-- Name: fk_etablir_droit_administratif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_administratif FOREIGN KEY (idadministatif) REFERENCES administratif(idadministatif);


--
-- Name: fk_etablir_droit_droit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_droit FOREIGN KEY (iddroit) REFERENCES droit(iddroit);


--
-- Name: fk_etablir_droit_enseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_enseignant FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- Name: fk_etudiant_classe_annee_academi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_classe
    ADD CONSTRAINT fk_etudiant_classe_annee_academi FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_etudiant_classe_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_classe
    ADD CONSTRAINT fk_etudiant_classe_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- Name: fk_etudiant_classe_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_classe
    ADD CONSTRAINT fk_etudiant_classe_etudiant FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- Name: fk_etudiant_exam_annee_academiqu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT fk_etudiant_exam_annee_academiqu FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_etudiant_exam_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT fk_etudiant_exam_etudiant FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- Name: fk_etudiant_exam_examen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT fk_etudiant_exam_examen FOREIGN KEY (idexamen) REFERENCES examen(idexamen);


--
-- Name: fk_etudiant_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant
    ADD CONSTRAINT fk_etudiant_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


--
-- Name: fk_filiere_departement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT fk_filiere_departement FOREIGN KEY (iddepartement) REFERENCES departement(iddepartement);


--
-- Name: fk_inscription_annee_academique; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT fk_inscription_annee_academique FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_inscription_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT fk_inscription_etudiant FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- Name: fk_inscription_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT fk_inscription_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_matiere_exam_annee_academique; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_exam
    ADD CONSTRAINT fk_matiere_exam_annee_academique FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_matiere_exam_examen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_exam
    ADD CONSTRAINT fk_matiere_exam_examen FOREIGN KEY (idexamen) REFERENCES examen(idexamen);


--
-- Name: fk_matiere_exam_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_exam
    ADD CONSTRAINT fk_matiere_exam_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_matiere_ue_annee_academique; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_ue
    ADD CONSTRAINT fk_matiere_ue_annee_academique FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_matiere_ue_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_ue
    ADD CONSTRAINT fk_matiere_ue_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_matiere_ue_ue; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_ue
    ADD CONSTRAINT fk_matiere_ue_ue FOREIGN KEY (code) REFERENCES ue(code);


--
-- Name: fk_reponse_enseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_enseignant FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- Name: fk_reponse_requete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_requete FOREIGN KEY (idrequete) REFERENCES requete(idrequete);


--
-- Name: fk_requete_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT fk_requete_etudiant FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- Name: fk_requete_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT fk_requete_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_role_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT fk_role_admin FOREIGN KEY (idadmin) REFERENCES administrateur(idadmin);


--
-- Name: fk_roleadministratif_administrat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleadministratif
    ADD CONSTRAINT fk_roleadministratif_administrat FOREIGN KEY (idadministatif) REFERENCES administratif(idadministatif);


--
-- Name: fk_roleadministratif_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleadministratif
    ADD CONSTRAINT fk_roleadministratif_role FOREIGN KEY (idrole) REFERENCES role(idrole);


--
-- Name: fk_roleenseignant_enseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleenseignant
    ADD CONSTRAINT fk_roleenseignant_enseignant FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- Name: fk_roleenseignant_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleenseignant
    ADD CONSTRAINT fk_roleenseignant_role FOREIGN KEY (idrole) REFERENCES role(idrole);


--
-- Name: fk_roleetudiant_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleetudiant
    ADD CONSTRAINT fk_roleetudiant_etudiant FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- Name: fk_roleetudiant_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleetudiant
    ADD CONSTRAINT fk_roleetudiant_role FOREIGN KEY (idrole) REFERENCES role(idrole);


--
-- Name: fk_semestre_annee_academique; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY semestre
    ADD CONSTRAINT fk_semestre_annee_academique FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_ue_classe_annee_academique; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ue_classe
    ADD CONSTRAINT fk_ue_classe_annee_academique FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_ue_classe_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ue_classe
    ADD CONSTRAINT fk_ue_classe_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- Name: fk_ue_classe_ue; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ue_classe
    ADD CONSTRAINT fk_ue_classe_ue FOREIGN KEY (code) REFERENCES ue(code);


--
-- Name: fk_ue_semestre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ue
    ADD CONSTRAINT fk_ue_semestre FOREIGN KEY (idsemestre) REFERENCES semestre(idsemestre);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

