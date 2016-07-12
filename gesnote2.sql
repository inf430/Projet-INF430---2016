--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: administrateur; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: administratif; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: annee_academique; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE annee_academique (
    annee character varying(10) NOT NULL,
    etat character varying(30)
);


ALTER TABLE annee_academique OWNER TO postgres;

--
-- Name: appartenirdroit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE appartenirdroit (
    iddroit integer NOT NULL,
    idrole integer NOT NULL
);


ALTER TABLE appartenirdroit OWNER TO postgres;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: departement; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: droit; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: enseignant; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: enseignant_chef_departement; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: enseignant_classe_jury; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: enseignant_mat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE enseignant_mat (
    idenseignantmat integer NOT NULL,
    idmatiere integer NOT NULL,
    matricule character varying(10) NOT NULL,
    annee character varying(10) NOT NULL,
    idclasse integer
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
-- Name: etablir_droit; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: etudiant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE etudiant (
    matricule character varying(10) NOT NULL,
    idpersonne integer NOT NULL
);


ALTER TABLE etudiant OWNER TO postgres;

--
-- Name: etudiant_classe; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: etudiant_exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE etudiant_exam (
    idetudiantexam integer NOT NULL,
    matricule character varying(10) NOT NULL,
    note real,
    anonymat character varying(20),
    idmatiereexam integer
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
-- Name: examen; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: filiere; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: inscription; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: matiere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE matiere (
    idmatiere integer NOT NULL,
    code character varying(30),
    libelle character varying(50)
);


ALTER TABLE matiere OWNER TO postgres;

--
-- Name: matiere_exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE matiere_exam (
    idmatiereexam integer NOT NULL,
    idmatiere integer NOT NULL,
    idexamen integer NOT NULL,
    annee character varying(10) NOT NULL
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
-- Name: matiere_ue; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: niveau; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE niveau (
    niveau character varying(30) NOT NULL,
    cycle character varying(20)
);


ALTER TABLE niveau OWNER TO postgres;

--
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: reponse; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: requete; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: roleadministratif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roleadministratif (
    idadministatif integer NOT NULL,
    idrole integer NOT NULL
);


ALTER TABLE roleadministratif OWNER TO postgres;

--
-- Name: roleenseignant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roleenseignant (
    matricule character varying(10) NOT NULL,
    idrole integer NOT NULL
);


ALTER TABLE roleenseignant OWNER TO postgres;

--
-- Name: roleetudiant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roleetudiant (
    idrole integer NOT NULL,
    matricule character varying(10) NOT NULL
);


ALTER TABLE roleetudiant OWNER TO postgres;

--
-- Name: semestre; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: ue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ue (
    code character varying(30) NOT NULL,
    idsemestre integer NOT NULL,
    libelle character varying(30)
);


ALTER TABLE ue OWNER TO postgres;

--
-- Name: ue_classe; Type: TABLE; Schema: public; Owner: postgres
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
-- Name: pk_admin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrateur
    ADD CONSTRAINT pk_admin PRIMARY KEY (idadmin);


--
-- Name: pk_administratif; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administratif
    ADD CONSTRAINT pk_administratif PRIMARY KEY (idadministatif);


--
-- Name: pk_annee_academique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY annee_academique
    ADD CONSTRAINT pk_annee_academique PRIMARY KEY (annee);


--
-- Name: pk_appartenirdroit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appartenirdroit
    ADD CONSTRAINT pk_appartenirdroit PRIMARY KEY (iddroit, idrole);


--
-- Name: pk_classe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classe
    ADD CONSTRAINT pk_classe PRIMARY KEY (idclasse);


--
-- Name: pk_departement; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departement
    ADD CONSTRAINT pk_departement PRIMARY KEY (iddepartement);


--
-- Name: pk_droit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit
    ADD CONSTRAINT pk_droit PRIMARY KEY (iddroit);


--
-- Name: pk_enseignant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant
    ADD CONSTRAINT pk_enseignant PRIMARY KEY (matricule);


--
-- Name: pk_enseignant_chef_departement; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_chef_departement
    ADD CONSTRAINT pk_enseignant_chef_departement PRIMARY KEY (idenseignantchefdepartement);


--
-- Name: pk_enseignant_classe_jury; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_classe_jury
    ADD CONSTRAINT pk_enseignant_classe_jury PRIMARY KEY (idenseignantclassejury);


--
-- Name: pk_enseignant_mat; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT pk_enseignant_mat PRIMARY KEY (idenseignantmat);


--
-- Name: pk_etablir_droit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT pk_etablir_droit PRIMARY KEY (idetablirdroit);


--
-- Name: pk_etudiant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant
    ADD CONSTRAINT pk_etudiant PRIMARY KEY (matricule);


--
-- Name: pk_etudiant_classe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_classe
    ADD CONSTRAINT pk_etudiant_classe PRIMARY KEY (idetudiantclasse);


--
-- Name: pk_etudiant_exam; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT pk_etudiant_exam PRIMARY KEY (idetudiantexam);


--
-- Name: pk_examen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examen
    ADD CONSTRAINT pk_examen PRIMARY KEY (idexamen);


--
-- Name: pk_filiere; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT pk_filiere PRIMARY KEY (idfiliere);


--
-- Name: pk_inscription; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT pk_inscription PRIMARY KEY (idinscription);


--
-- Name: pk_matiere; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT pk_matiere PRIMARY KEY (idmatiere);


--
-- Name: pk_matiere_exam; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_exam
    ADD CONSTRAINT pk_matiere_exam PRIMARY KEY (idmatiereexam);


--
-- Name: pk_matiere_ue; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere_ue
    ADD CONSTRAINT pk_matiere_ue PRIMARY KEY (idmatiereue);


--
-- Name: pk_niveau; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY niveau
    ADD CONSTRAINT pk_niveau PRIMARY KEY (niveau);


--
-- Name: pk_personne; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT pk_personne PRIMARY KEY (idpersonne);


--
-- Name: pk_reponse; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT pk_reponse PRIMARY KEY (idreponse);


--
-- Name: pk_requete; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT pk_requete PRIMARY KEY (idrequete);


--
-- Name: pk_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT pk_role PRIMARY KEY (idrole);


--
-- Name: pk_roleadministratif; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleadministratif
    ADD CONSTRAINT pk_roleadministratif PRIMARY KEY (idadministatif, idrole);


--
-- Name: pk_roleenseignant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleenseignant
    ADD CONSTRAINT pk_roleenseignant PRIMARY KEY (matricule, idrole);


--
-- Name: pk_roleetudiant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roleetudiant
    ADD CONSTRAINT pk_roleetudiant PRIMARY KEY (idrole, matricule);


--
-- Name: pk_semestre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY semestre
    ADD CONSTRAINT pk_semestre PRIMARY KEY (idsemestre);


--
-- Name: pk_ue; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ue
    ADD CONSTRAINT pk_ue PRIMARY KEY (code);


--
-- Name: pk_ue_classe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ue_classe
    ADD CONSTRAINT pk_ue_classe PRIMARY KEY (idueclasse);


--
-- Name: i_fk_administratif_personne; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i_fk_administratif_personne ON administratif USING btree (idpersonne);


--
-- Name: i_fk_appartenirdroit_droit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_appartenirdroit_droit ON appartenirdroit USING btree (iddroit);


--
-- Name: i_fk_appartenirdroit_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_appartenirdroit_role ON appartenirdroit USING btree (idrole);


--
-- Name: i_fk_classe_filiere; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_classe_filiere ON classe USING btree (idfiliere);


--
-- Name: i_fk_classe_niveau; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_classe_niveau ON classe USING btree (niveau);


--
-- Name: i_fk_droit_admin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_droit_admin ON droit USING btree (idadmin);


--
-- Name: i_fk_enseignant_chef_departem1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_chef_departem1 ON enseignant_chef_departement USING btree (iddepartement);


--
-- Name: i_fk_enseignant_chef_departem2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_chef_departem2 ON enseignant_chef_departement USING btree (annee);


--
-- Name: i_fk_enseignant_chef_departeme; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_chef_departeme ON enseignant_chef_departement USING btree (matricule);


--
-- Name: i_fk_enseignant_classe_jury_an; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_classe_jury_an ON enseignant_classe_jury USING btree (annee);


--
-- Name: i_fk_enseignant_classe_jury_cl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_classe_jury_cl ON enseignant_classe_jury USING btree (idclasse);


--
-- Name: i_fk_enseignant_classe_jury_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_classe_jury_en ON enseignant_classe_jury USING btree (matricule);


--
-- Name: i_fk_enseignant_departement; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_departement ON enseignant USING btree (iddepartement);


--
-- Name: i_fk_enseignant_mat_annee_acad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_mat_annee_acad ON enseignant_mat USING btree (annee);


--
-- Name: i_fk_enseignant_mat_enseignant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_mat_enseignant ON enseignant_mat USING btree (matricule);


--
-- Name: i_fk_enseignant_mat_matiere; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_enseignant_mat_matiere ON enseignant_mat USING btree (idmatiere);


--
-- Name: i_fk_enseignant_personne; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i_fk_enseignant_personne ON enseignant USING btree (idpersonne);


--
-- Name: i_fk_etablir_droit_administrat; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_etablir_droit_administrat ON etablir_droit USING btree (idadministatif);


--
-- Name: i_fk_etablir_droit_droit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_etablir_droit_droit ON etablir_droit USING btree (iddroit);


--
-- Name: i_fk_etablir_droit_enseignant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_etablir_droit_enseignant ON etablir_droit USING btree (matricule);


--
-- Name: i_fk_etudiant_classe_annee_aca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_etudiant_classe_annee_aca ON etudiant_classe USING btree (annee);


--
-- Name: i_fk_etudiant_classe_classe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_etudiant_classe_classe ON etudiant_classe USING btree (idclasse);


--
-- Name: i_fk_etudiant_classe_etudiant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_etudiant_classe_etudiant ON etudiant_classe USING btree (matricule);


--
-- Name: i_fk_etudiant_exam_etudiant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_etudiant_exam_etudiant ON etudiant_exam USING btree (matricule);


--
-- Name: i_fk_etudiant_personne; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i_fk_etudiant_personne ON etudiant USING btree (idpersonne);


--
-- Name: i_fk_filiere_departement; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_filiere_departement ON filiere USING btree (iddepartement);


--
-- Name: i_fk_inscription_annee_academi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_inscription_annee_academi ON inscription USING btree (annee);


--
-- Name: i_fk_inscription_etudiant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_inscription_etudiant ON inscription USING btree (matricule);


--
-- Name: i_fk_inscription_matiere; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_inscription_matiere ON inscription USING btree (idmatiere);


--
-- Name: i_fk_matiere_exam_annee_academ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_matiere_exam_annee_academ ON matiere_exam USING btree (annee);


--
-- Name: i_fk_matiere_exam_examen; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_matiere_exam_examen ON matiere_exam USING btree (idexamen);


--
-- Name: i_fk_matiere_exam_matiere; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_matiere_exam_matiere ON matiere_exam USING btree (idmatiere);


--
-- Name: i_fk_matiere_ue_annee_academiq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_matiere_ue_annee_academiq ON matiere_ue USING btree (annee);


--
-- Name: i_fk_matiere_ue_matiere; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_matiere_ue_matiere ON matiere_ue USING btree (idmatiere);


--
-- Name: i_fk_matiere_ue_ue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_matiere_ue_ue ON matiere_ue USING btree (code);


--
-- Name: i_fk_reponse_enseignant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_reponse_enseignant ON reponse USING btree (matricule);


--
-- Name: i_fk_reponse_requete; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX i_fk_reponse_requete ON reponse USING btree (idrequete);


--
-- Name: i_fk_requete_etudiant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_requete_etudiant ON requete USING btree (matricule);


--
-- Name: i_fk_role_admin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_role_admin ON role USING btree (idadmin);


--
-- Name: i_fk_roleadministratif_adminis; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_roleadministratif_adminis ON roleadministratif USING btree (idadministatif);


--
-- Name: i_fk_roleadministratif_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_roleadministratif_role ON roleadministratif USING btree (idrole);


--
-- Name: i_fk_roleenseignant_enseignant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_roleenseignant_enseignant ON roleenseignant USING btree (matricule);


--
-- Name: i_fk_roleenseignant_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_roleenseignant_role ON roleenseignant USING btree (idrole);


--
-- Name: i_fk_roleetudiant_etudiant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_roleetudiant_etudiant ON roleetudiant USING btree (matricule);


--
-- Name: i_fk_roleetudiant_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_roleetudiant_role ON roleetudiant USING btree (idrole);


--
-- Name: i_fk_semestre_annee_academique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_semestre_annee_academique ON semestre USING btree (annee);


--
-- Name: i_fk_ue_classe_annee_academiqu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_ue_classe_annee_academiqu ON ue_classe USING btree (annee);


--
-- Name: i_fk_ue_classe_classe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_ue_classe_classe ON ue_classe USING btree (idclasse);


--
-- Name: i_fk_ue_classe_ue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_fk_ue_classe_ue ON ue_classe USING btree (code);


--
-- Name: i_fk_ue_semestre; Type: INDEX; Schema: public; Owner: postgres
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
-- Name: fk_enseignant_matiere_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT fk_enseignant_matiere_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


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
-- Name: fk_etudiant_exam_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT fk_etudiant_exam_etudiant FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- Name: fk_etudiant_examen_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT fk_etudiant_examen_matiere FOREIGN KEY (idmatiereexam) REFERENCES matiere_exam(idmatiereexam);


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

