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
    login character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.administrateur OWNER TO postgres;

--
-- Name: administrateur_idadmin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE administrateur_idadmin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrateur_idadmin_seq OWNER TO postgres;

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


ALTER TABLE public.administratif OWNER TO postgres;

--
-- Name: administratif_idadministatif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE administratif_idadministatif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administratif_idadministatif_seq OWNER TO postgres;

--
-- Name: administratif_idadministatif_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE administratif_idadministatif_seq OWNED BY administratif.idadministatif;


--
-- Name: annee_academique; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE annee_academique (
    annee character varying(10) NOT NULL,
    etatannee character varying(30)
);


ALTER TABLE public.annee_academique OWNER TO postgres;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE classe (
    idclasse integer NOT NULL,
    idfiliere integer NOT NULL,
    niveau character varying(30) NOT NULL,
    nom character varying(50)
);


ALTER TABLE public.classe OWNER TO postgres;

--
-- Name: classe_idclasse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classe_idclasse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classe_idclasse_seq OWNER TO postgres;

--
-- Name: classe_idclasse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE classe_idclasse_seq OWNED BY classe.idclasse;


--
-- Name: departement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departement (
    iddepartement integer NOT NULL,
    codedepartement character varying(30) NOT NULL,
    libelle character varying(30),
    idfaculte character varying(128)
);


ALTER TABLE public.departement OWNER TO postgres;

--
-- Name: departement_iddepartement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE departement_iddepartement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departement_iddepartement_seq OWNER TO postgres;

--
-- Name: departement_iddepartement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE departement_iddepartement_seq OWNED BY departement.iddepartement;


--
-- Name: droit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE droit (
    iddroit integer NOT NULL,
    nom character varying(50)
);


ALTER TABLE public.droit OWNER TO postgres;

--
-- Name: droit_iddroit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE droit_iddroit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.droit_iddroit_seq OWNER TO postgres;

--
-- Name: droit_iddroit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE droit_iddroit_seq OWNED BY droit.iddroit;


--
-- Name: droit_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE droit_role (
    id_droitrole integer NOT NULL,
    matriculeetudiant character varying(10) NOT NULL,
    idrole integer NOT NULL,
    iddroit integer NOT NULL,
    idexamen integer NOT NULL,
    idclasse integer NOT NULL,
    idmatiere integer NOT NULL,
    codeue character varying(30) NOT NULL
);


ALTER TABLE public.droit_role OWNER TO postgres;

--
-- Name: enseignant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enseignant (
    matriculeenseignant character varying(10) NOT NULL,
    iddepartement integer NOT NULL,
    idpersonne integer NOT NULL,
    grade character varying(50),
    specialite character varying(50)
);


ALTER TABLE public.enseignant OWNER TO postgres;

--
-- Name: enseignant_chef_departement; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enseignant_chef_departement (
    idenseignantchefdepartement integer NOT NULL,
    matriculeenseignant character varying(10) NOT NULL,
    iddepartement integer NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE public.enseignant_chef_departement OWNER TO postgres;

--
-- Name: enseignant_chef_departement_idenseignantchefdepartement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enseignant_chef_departement_idenseignantchefdepartement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enseignant_chef_departement_idenseignantchefdepartement_seq OWNER TO postgres;

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
    matriculeenseignant character varying(10) NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE public.enseignant_classe_jury OWNER TO postgres;

--
-- Name: enseignant_classe_jury_idenseignantclassejury_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enseignant_classe_jury_idenseignantclassejury_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enseignant_classe_jury_idenseignantclassejury_seq OWNER TO postgres;

--
-- Name: enseignant_classe_jury_idenseignantclassejury_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enseignant_classe_jury_idenseignantclassejury_seq OWNED BY enseignant_classe_jury.idenseignantclassejury;


--
-- Name: enseignant_mat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE enseignant_mat (
    idenseignantmat integer NOT NULL,
    idclasse integer NOT NULL,
    idmatiere integer NOT NULL,
    matriculeenseignant character varying(10) NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE public.enseignant_mat OWNER TO postgres;

--
-- Name: enseignant_mat_idenseignantmat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE enseignant_mat_idenseignantmat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enseignant_mat_idenseignantmat_seq OWNER TO postgres;

--
-- Name: enseignant_mat_idenseignantmat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE enseignant_mat_idenseignantmat_seq OWNED BY enseignant_mat.idenseignantmat;


--
-- Name: etablir_droit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etablir_droit (
    idetablirdroit integer NOT NULL,
    idclasse integer NOT NULL,
    idexamen integer NOT NULL,
    idpersonne integer NOT NULL,
    idmatiere integer NOT NULL,
    matriculeetudiant character varying(10) NOT NULL,
    iddroit integer NOT NULL,
    codeue character varying(30) NOT NULL,
    datedeb character varying(10),
    datefin character varying(10)
);


ALTER TABLE public.etablir_droit OWNER TO postgres;

--
-- Name: etablir_droit_idetablirdroit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE etablir_droit_idetablirdroit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etablir_droit_idetablirdroit_seq OWNER TO postgres;

--
-- Name: etablir_droit_idetablirdroit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE etablir_droit_idetablirdroit_seq OWNED BY etablir_droit.idetablirdroit;


--
-- Name: etudiant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etudiant (
    matriculeetudiant character varying(10) NOT NULL,
    idpersonne integer NOT NULL
);


ALTER TABLE public.etudiant OWNER TO postgres;

--
-- Name: etudiant_classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etudiant_classe (
    idetudiantclasse integer NOT NULL,
    matriculeetudiant character varying(10) NOT NULL,
    idclasse integer NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE public.etudiant_classe OWNER TO postgres;

--
-- Name: etudiant_classe_idetudiantclasse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE etudiant_classe_idetudiantclasse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etudiant_classe_idetudiantclasse_seq OWNER TO postgres;

--
-- Name: etudiant_classe_idetudiantclasse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE etudiant_classe_idetudiantclasse_seq OWNED BY etudiant_classe.idetudiantclasse;


--
-- Name: etudiant_exam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE etudiant_exam (
    idetudiantexam integer NOT NULL,
    idmatiereexam integer NOT NULL,
    matriculeetudiant character varying(10) NOT NULL,
    note real,
    anonymat character varying(20),
    CONSTRAINT etudiant_exam_note_check CHECK (((note >= (0)::double precision) AND (note <= (20)::double precision)))
);


ALTER TABLE public.etudiant_exam OWNER TO postgres;

--
-- Name: etudiant_exam_idetudiantexam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE etudiant_exam_idetudiantexam_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etudiant_exam_idetudiantexam_seq OWNER TO postgres;

--
-- Name: etudiant_exam_idetudiantexam_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE etudiant_exam_idetudiantexam_seq OWNED BY etudiant_exam.idetudiantexam;


--
-- Name: examen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE examen (
    idexamen integer NOT NULL,
    typeexamen character varying(30),
    CONSTRAINT examen_typeexamen_check CHECK (((typeexamen)::text = ANY ((ARRAY['CC'::character varying, 'TP'::character varying, 'SN'::character varying, 'RAT'::character varying])::text[])))
);


ALTER TABLE public.examen OWNER TO postgres;

--
-- Name: examen_idexamen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE examen_idexamen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.examen_idexamen_seq OWNER TO postgres;

--
-- Name: examen_idexamen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE examen_idexamen_seq OWNED BY examen.idexamen;


--
-- Name: faculte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE faculte (
    idfaculte character varying(128) NOT NULL,
    libellefaculte character varying(128)
);


ALTER TABLE public.faculte OWNER TO postgres;

--
-- Name: filiere; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filiere (
    idfiliere integer NOT NULL,
    iddepartement integer NOT NULL,
    codefiliere character varying(30) NOT NULL,
    libelle character varying(30)
);


ALTER TABLE public.filiere OWNER TO postgres;

--
-- Name: filiere_idfiliere_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filiere_idfiliere_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filiere_idfiliere_seq OWNER TO postgres;

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
    matriculeetudiant character varying(10) NOT NULL,
    annee character varying(10) NOT NULL
);


ALTER TABLE public.inscription OWNER TO postgres;

--
-- Name: inscription_idinscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inscription_idinscription_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscription_idinscription_seq OWNER TO postgres;

--
-- Name: inscription_idinscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inscription_idinscription_seq OWNED BY inscription.idinscription;


--
-- Name: interdit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE interdit (
    idinterdit integer NOT NULL,
    idpersonne integer NOT NULL,
    iddroit integer NOT NULL
);


ALTER TABLE public.interdit OWNER TO postgres;

--
-- Name: matiere; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matiere (
    idmatiere integer NOT NULL,
    codematiere character varying(30) NOT NULL,
    libelle character varying(50)
);


ALTER TABLE public.matiere OWNER TO postgres;

--
-- Name: matiere_exam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matiere_exam (
    idmatiereexam integer NOT NULL,
    idmatiere integer NOT NULL,
    idexamen integer NOT NULL,
    annee character varying(10) NOT NULL,
    pourcentage integer,
    datematiereexam character(32),
    CONSTRAINT matiere_exam_pourcentage_check CHECK (((pourcentage >= 0) AND (pourcentage <= 100)))
);


ALTER TABLE public.matiere_exam OWNER TO postgres;

--
-- Name: matiere_exam_idmatiereexam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matiere_exam_idmatiereexam_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matiere_exam_idmatiereexam_seq OWNER TO postgres;

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


ALTER TABLE public.matiere_idmatiere_seq OWNER TO postgres;

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
    codeue character varying(30) NOT NULL,
    annee character varying(10) NOT NULL,
    credit integer,
    CONSTRAINT matiere_ue_credit_check CHECK (((credit >= 0) AND (credit <= 60)))
);


ALTER TABLE public.matiere_ue OWNER TO postgres;

--
-- Name: matiere_ue_idmatiereue_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matiere_ue_idmatiereue_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matiere_ue_idmatiereue_seq OWNER TO postgres;

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


ALTER TABLE public.niveau OWNER TO postgres;

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
    login character varying(30) NOT NULL,
    password character varying(255) NOT NULL,
    statut character varying(15),
    numtel text,
    nationalite character varying(128),
    region character varying(128),
    departement character varying(128),
    handicap character varying(128),
    token character varying(128),
    email character varying(128),
    datemodifdebut timestamp without time zone,
    datemodiffin timestamp without time zone,
	valid_token integer NULL CHECK (valid_token BETWEEN 0 AND 1),
    CONSTRAINT personne_sexe_check CHECK ((sexe = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);


ALTER TABLE public.personne OWNER TO postgres;

--
-- Name: personne_idpersonne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personne_idpersonne_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personne_idpersonne_seq OWNER TO postgres;

--
-- Name: personne_idpersonne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personne_idpersonne_seq OWNED BY personne.idpersonne;


--
-- Name: recteur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recteur (
    matriculerecteur character varying(10) NOT NULL,
    idpersonne integer NOT NULL,
    datearrive date,
    datedepart date
);


ALTER TABLE public.recteur OWNER TO postgres;

--
-- Name: reponse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reponse (
    idreponse integer NOT NULL,
    idpersonne integer NOT NULL,
    idrequete integer NOT NULL,
    datereponse timestamp without time zone,
    decision text
);


ALTER TABLE public.reponse OWNER TO postgres;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reponse_idreponse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reponse_idreponse_seq OWNER TO postgres;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reponse_idreponse_seq OWNED BY reponse.idreponse;


--
-- Name: requete; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requete (
    idrequete integer NOT NULL,
    idreaueteenseignant integer NOT NULL,
    objetrequete text,
    daterequete timestamp without time zone,
    etatrequete character varying(30),
    contenu text,
    piecejointe text,
    typerequete character varying(128),
    CONSTRAINT requete_typerequete_check CHECK (((typerequete)::text = ANY ((ARRAY['matiere'::character varying, 'decanat'::character varying, 'jury'::character varying, 'rectorat'::character varying])::text[])))
);


ALTER TABLE public.requete OWNER TO postgres;

--
-- Name: requete_idrequete_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requete_idrequete_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requete_idrequete_seq OWNER TO postgres;

--
-- Name: requete_idrequete_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requete_idrequete_seq OWNED BY requete.idrequete;


--
-- Name: requetedecanat; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requetedecanat (
    idrequete integer NOT NULL,
    annee character varying(10) NOT NULL,
    cible character varying(128),
    idvaleur integer,
    idrequetedecanat integer NOT NULL,
    CONSTRAINT requetedecanat_cible_check CHECK (((cible)::text = ANY ((ARRAY['matiere'::character varying, 'enseignant'::character varying, 'nom'::character varying, 'prenom'::character varying, 'matricule'::character varying])::text[])))
);


ALTER TABLE public.requetedecanat OWNER TO postgres;

--
-- Name: requeteenseignant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requeteenseignant (
    matriculeenseignant character varying(10) NOT NULL,
    matriculeetudiant character varying(10) NOT NULL,
    idmatiere integer NOT NULL,
    typeexamen character varying(128),
    note integer,
    idreaueteenseignant integer NOT NULL,
    CONSTRAINT requeteenseignant_note_check CHECK (((note >= 0) AND (note <= 20))),
    CONSTRAINT requeteenseignant_typeexamen_check CHECK (((typeexamen)::text = ANY ((ARRAY['CC'::character varying, 'TP'::character varying, 'SN'::character varying, 'RAT'::character varying])::text[])))
);


ALTER TABLE public.requeteenseignant OWNER TO postgres;

--
-- Name: requetejury; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requetejury (
    idrequetejury character(32) NOT NULL,
    idrequete integer NOT NULL,
    idclasse integer NOT NULL
);


ALTER TABLE public.requetejury OWNER TO postgres;

--
-- Name: requetematiere; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requetematiere (
    idrequete integer NOT NULL,
    idmatiere integer NOT NULL,
    typeexamen character varying(128),
    idrequetematiere integer NOT NULL,
    CONSTRAINT requetematiere_typeexamen_check CHECK (((typeexamen)::text = ANY ((ARRAY['CC'::character varying, 'TP'::character varying, 'SN'::character varying, 'RAT'::character varying])::text[])))
);


ALTER TABLE public.requetematiere OWNER TO postgres;

--
-- Name: requeterecteur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE requeterecteur (
    typerequeterecteur character varying(128),
    valeur character varying(128),
    idrequeterecteur integer NOT NULL,
    CONSTRAINT requeterecteur_typerequeterecteur_check CHECK (((typerequeterecteur)::text = ANY ((ARRAY['demande_stage'::character varying, 'demande_subvention'::character varying])::text[])))
);


ALTER TABLE public.requeterecteur OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    idrole integer NOT NULL,
    idadmin integer NOT NULL,
    idpersonne integer NOT NULL,
    role character varying(50)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_idrole_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_idrole_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_idrole_seq OWNER TO postgres;

--
-- Name: role_idrole_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_idrole_seq OWNED BY role.idrole;


--
-- Name: semestre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE semestre (
    idsemestre integer NOT NULL,
    annee character varying(10) NOT NULL,
    semestre character varying(30)
);


ALTER TABLE public.semestre OWNER TO postgres;

--
-- Name: semestre_idsemestre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE semestre_idsemestre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.semestre_idsemestre_seq OWNER TO postgres;

--
-- Name: semestre_idsemestre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE semestre_idsemestre_seq OWNED BY semestre.idsemestre;


--
-- Name: ue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ue (
    codeue character varying(30) NOT NULL,
    idsemestre integer NOT NULL,
    libelle character varying(30)
);


ALTER TABLE public.ue OWNER TO postgres;

--
-- Name: ue_classe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ue_classe (
    idueclasse integer NOT NULL,
    annee character varying(10) NOT NULL,
    codeue character varying(30) NOT NULL,
    idclasse integer NOT NULL
);


ALTER TABLE public.ue_classe OWNER TO postgres;

--
-- Name: ue_classe_idueclasse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ue_classe_idueclasse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ue_classe_idueclasse_seq OWNER TO postgres;

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

COPY administrateur (idadmin, login, password) FROM stdin;
\.


--
-- Name: administrateur_idadmin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('administrateur_idadmin_seq', 1, false);


--
-- Data for Name: administratif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY administratif (idadministatif, idpersonne) FROM stdin;
\.


--
-- Name: administratif_idadministatif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('administratif_idadministatif_seq', 1, false);


--
-- Data for Name: annee_academique; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY annee_academique (annee, etatannee) FROM stdin;
\.


--
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY classe (idclasse, idfiliere, niveau, nom) FROM stdin;
\.


--
-- Name: classe_idclasse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classe_idclasse_seq', 1, false);


--
-- Data for Name: departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departement (iddepartement, codedepartement, libelle, idfaculte) FROM stdin;
\.


--
-- Name: departement_iddepartement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('departement_iddepartement_seq', 1, false);


--
-- Data for Name: droit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY droit (iddroit, nom) FROM stdin;
\.


--
-- Name: droit_iddroit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('droit_iddroit_seq', 1, false);


--
-- Data for Name: droit_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY droit_role (id_droitrole, matriculeetudiant, idrole, iddroit, idexamen, idclasse, idmatiere, codeue) FROM stdin;
\.


--
-- Data for Name: enseignant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enseignant (matriculeenseignant, iddepartement, idpersonne, grade, specialite) FROM stdin;
\.


--
-- Data for Name: enseignant_chef_departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enseignant_chef_departement (idenseignantchefdepartement, matriculeenseignant, iddepartement, annee) FROM stdin;
\.


--
-- Name: enseignant_chef_departement_idenseignantchefdepartement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enseignant_chef_departement_idenseignantchefdepartement_seq', 1, false);


--
-- Data for Name: enseignant_classe_jury; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enseignant_classe_jury (idenseignantclassejury, idclasse, matriculeenseignant, annee) FROM stdin;
\.


--
-- Name: enseignant_classe_jury_idenseignantclassejury_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enseignant_classe_jury_idenseignantclassejury_seq', 1, false);


--
-- Data for Name: enseignant_mat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY enseignant_mat (idenseignantmat, idclasse, idmatiere, matriculeenseignant, annee) FROM stdin;
\.


--
-- Name: enseignant_mat_idenseignantmat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('enseignant_mat_idenseignantmat_seq', 1, false);


--
-- Data for Name: etablir_droit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY etablir_droit (idetablirdroit, idclasse, idexamen, idpersonne, idmatiere, matriculeetudiant, iddroit, codeue, datedeb, datefin) FROM stdin;
\.


--
-- Name: etablir_droit_idetablirdroit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('etablir_droit_idetablirdroit_seq', 1, false);


--
-- Data for Name: etudiant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY etudiant (matriculeetudiant, idpersonne) FROM stdin;
\.


--
-- Data for Name: etudiant_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY etudiant_classe (idetudiantclasse, matriculeetudiant, idclasse, annee) FROM stdin;
\.


--
-- Name: etudiant_classe_idetudiantclasse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('etudiant_classe_idetudiantclasse_seq', 1, false);


--
-- Data for Name: etudiant_exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY etudiant_exam (idetudiantexam, idmatiereexam, matriculeetudiant, note, anonymat) FROM stdin;
\.


--
-- Name: etudiant_exam_idetudiantexam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('etudiant_exam_idetudiantexam_seq', 1, false);


--
-- Data for Name: examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY examen (idexamen, typeexamen) FROM stdin;
\.


--
-- Name: examen_idexamen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('examen_idexamen_seq', 1, false);


--
-- Data for Name: faculte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY faculte (idfaculte, libellefaculte) FROM stdin;
\.


--
-- Data for Name: filiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filiere (idfiliere, iddepartement, codefiliere, libelle) FROM stdin;
\.


--
-- Name: filiere_idfiliere_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filiere_idfiliere_seq', 1, false);


--
-- Data for Name: inscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY inscription (idinscription, idmatiere, matriculeetudiant, annee) FROM stdin;
\.


--
-- Name: inscription_idinscription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inscription_idinscription_seq', 1, false);


--
-- Data for Name: interdit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY interdit (idinterdit, idpersonne, iddroit) FROM stdin;
\.


--
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY matiere (idmatiere, codematiere, libelle) FROM stdin;
\.


--
-- Data for Name: matiere_exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY matiere_exam (idmatiereexam, idmatiere, idexamen, annee, pourcentage, datematiereexam) FROM stdin;
\.


--
-- Name: matiere_exam_idmatiereexam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matiere_exam_idmatiereexam_seq', 1, false);


--
-- Name: matiere_idmatiere_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matiere_idmatiere_seq', 1, false);


--
-- Data for Name: matiere_ue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY matiere_ue (idmatiereue, idmatiere, codeue, annee, credit) FROM stdin;
\.


--
-- Name: matiere_ue_idmatiereue_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matiere_ue_idmatiereue_seq', 1, false);


--
-- Data for Name: niveau; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY niveau (niveau, cycle) FROM stdin;
\.


--
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personne (idpersonne, nom, prenom, datenaiss, lieunaiss, sexe, login, password, statut, numtel, nationalite, region, departement, handicap, token, email, datemodifdebut, datemodiffin) FROM stdin;
\.


--
-- Name: personne_idpersonne_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personne_idpersonne_seq', 1, false);


--
-- Data for Name: recteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recteur (matriculerecteur, idpersonne, datearrive, datedepart) FROM stdin;
\.


--
-- Data for Name: reponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reponse (idreponse, idpersonne, idrequete, datereponse, decision) FROM stdin;
\.


--
-- Name: reponse_idreponse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reponse_idreponse_seq', 1, false);


--
-- Data for Name: requete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requete (idrequete, idreaueteenseignant, objetrequete, daterequete, etatrequete, contenu, piecejointe, typerequete) FROM stdin;
\.


--
-- Name: requete_idrequete_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requete_idrequete_seq', 1, false);


--
-- Data for Name: requetedecanat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requetedecanat (idrequete, annee, cible, idvaleur, idrequetedecanat) FROM stdin;
\.


--
-- Data for Name: requeteenseignant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requeteenseignant (matriculeenseignant, matriculeetudiant, idmatiere, typeexamen, note, idreaueteenseignant) FROM stdin;
\.


--
-- Data for Name: requetejury; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requetejury (idrequetejury, idrequete, idclasse) FROM stdin;
\.


--
-- Data for Name: requetematiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requetematiere (idrequete, idmatiere, typeexamen, idrequetematiere) FROM stdin;
\.


--
-- Data for Name: requeterecteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requeterecteur (typerequeterecteur, valeur, idrequeterecteur) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (idrole, idadmin, idpersonne, role) FROM stdin;
\.


--
-- Name: role_idrole_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_idrole_seq', 1, false);


--
-- Data for Name: semestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY semestre (idsemestre, annee, semestre) FROM stdin;
\.


--
-- Name: semestre_idsemestre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('semestre_idsemestre_seq', 1, false);


--
-- Data for Name: ue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ue (codeue, idsemestre, libelle) FROM stdin;
\.


--
-- Data for Name: ue_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ue_classe (idueclasse, annee, codeue, idclasse) FROM stdin;
\.


--
-- Name: ue_classe_idueclasse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ue_classe_idueclasse_seq', 1, false);


--
-- Name: administrateur_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administrateur
    ADD CONSTRAINT administrateur_login_key UNIQUE (login);


--
-- Name: departement_codedepartement_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departement
    ADD CONSTRAINT departement_codedepartement_key UNIQUE (codedepartement);


--
-- Name: filiere_codefiliere_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT filiere_codefiliere_key UNIQUE (codefiliere);


--
-- Name: matiere_codematiere_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT matiere_codematiere_key UNIQUE (codematiere);


--
-- Name: personne_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT personne_login_key UNIQUE (login);


--
-- Name: pk_administrateur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administrateur
    ADD CONSTRAINT pk_administrateur PRIMARY KEY (idadmin);


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
-- Name: pk_droit_role; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT pk_droit_role PRIMARY KEY (id_droitrole);


--
-- Name: pk_enseignant; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY enseignant
    ADD CONSTRAINT pk_enseignant PRIMARY KEY (matriculeenseignant);


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
    ADD CONSTRAINT pk_etudiant PRIMARY KEY (matriculeetudiant);


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
-- Name: pk_faculte; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faculte
    ADD CONSTRAINT pk_faculte PRIMARY KEY (idfaculte);


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
-- Name: pk_interdit; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY interdit
    ADD CONSTRAINT pk_interdit PRIMARY KEY (idinterdit);


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
-- Name: pk_recteur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recteur
    ADD CONSTRAINT pk_recteur PRIMARY KEY (matriculerecteur);


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
-- Name: pk_requetedecanat; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requetedecanat
    ADD CONSTRAINT pk_requetedecanat PRIMARY KEY (idrequetedecanat);


--
-- Name: pk_requeteenseignant; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requeteenseignant
    ADD CONSTRAINT pk_requeteenseignant PRIMARY KEY (idreaueteenseignant);


--
-- Name: pk_requetejury; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requetejury
    ADD CONSTRAINT pk_requetejury PRIMARY KEY (idrequetejury);


--
-- Name: pk_requetematiere; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requetematiere
    ADD CONSTRAINT pk_requetematiere PRIMARY KEY (idrequetematiere);


--
-- Name: pk_requeterecteur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY requeterecteur
    ADD CONSTRAINT pk_requeterecteur PRIMARY KEY (idrequeterecteur);


--
-- Name: pk_role; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT pk_role PRIMARY KEY (idrole);


--
-- Name: pk_semestre; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY semestre
    ADD CONSTRAINT pk_semestre PRIMARY KEY (idsemestre);


--
-- Name: pk_ue; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ue
    ADD CONSTRAINT pk_ue PRIMARY KEY (codeue);


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
-- Name: i_fk_classe_filiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_classe_filiere ON classe USING btree (idfiliere);


--
-- Name: i_fk_classe_niveau; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_classe_niveau ON classe USING btree (niveau);


--
-- Name: i_fk_droit_role_classe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_role_classe ON droit_role USING btree (idclasse);


--
-- Name: i_fk_droit_role_droit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_role_droit ON droit_role USING btree (iddroit);


--
-- Name: i_fk_droit_role_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_role_etudiant ON droit_role USING btree (matriculeetudiant);


--
-- Name: i_fk_droit_role_examen; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_role_examen ON droit_role USING btree (idexamen);


--
-- Name: i_fk_droit_role_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_role_matiere ON droit_role USING btree (idmatiere);


--
-- Name: i_fk_droit_role_role; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_role_role ON droit_role USING btree (idrole);


--
-- Name: i_fk_droit_role_ue; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_droit_role_ue ON droit_role USING btree (codeue);


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

CREATE INDEX i_fk_enseignant_chef_departeme ON enseignant_chef_departement USING btree (matriculeenseignant);


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

CREATE INDEX i_fk_enseignant_classe_jury_en ON enseignant_classe_jury USING btree (matriculeenseignant);


--
-- Name: i_fk_enseignant_departement; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_departement ON enseignant USING btree (iddepartement);


--
-- Name: i_fk_enseignant_mat_annee_acad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_mat_annee_acad ON enseignant_mat USING btree (annee);


--
-- Name: i_fk_enseignant_mat_classe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_mat_classe ON enseignant_mat USING btree (idclasse);


--
-- Name: i_fk_enseignant_mat_enseignant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_mat_enseignant ON enseignant_mat USING btree (matriculeenseignant);


--
-- Name: i_fk_enseignant_mat_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_enseignant_mat_matiere ON enseignant_mat USING btree (idmatiere);


--
-- Name: i_fk_enseignant_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX i_fk_enseignant_personne ON enseignant USING btree (idpersonne);


--
-- Name: i_fk_etablir_droit_classe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_classe ON etablir_droit USING btree (idclasse);


--
-- Name: i_fk_etablir_droit_droit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_droit ON etablir_droit USING btree (iddroit);


--
-- Name: i_fk_etablir_droit_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_etudiant ON etablir_droit USING btree (matriculeetudiant);


--
-- Name: i_fk_etablir_droit_examen; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_examen ON etablir_droit USING btree (idexamen);


--
-- Name: i_fk_etablir_droit_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_matiere ON etablir_droit USING btree (idmatiere);


--
-- Name: i_fk_etablir_droit_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_personne ON etablir_droit USING btree (idpersonne);


--
-- Name: i_fk_etablir_droit_ue; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etablir_droit_ue ON etablir_droit USING btree (codeue);


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

CREATE INDEX i_fk_etudiant_classe_etudiant ON etudiant_classe USING btree (matriculeetudiant);


--
-- Name: i_fk_etudiant_exam_etudiant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_exam_etudiant ON etudiant_exam USING btree (matriculeetudiant);


--
-- Name: i_fk_etudiant_exam_matiere_exa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_etudiant_exam_matiere_exa ON etudiant_exam USING btree (idmatiereexam);


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

CREATE INDEX i_fk_inscription_etudiant ON inscription USING btree (matriculeetudiant);


--
-- Name: i_fk_inscription_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_inscription_matiere ON inscription USING btree (idmatiere);


--
-- Name: i_fk_interdit_droit; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_interdit_droit ON interdit USING btree (iddroit);


--
-- Name: i_fk_interdit_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_interdit_personne ON interdit USING btree (idpersonne);


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

CREATE INDEX i_fk_matiere_ue_ue ON matiere_ue USING btree (codeue);


--
-- Name: i_fk_recteur_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX i_fk_recteur_personne ON recteur USING btree (idpersonne);


--
-- Name: i_fk_reponse_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_reponse_personne ON reponse USING btree (idpersonne);


--
-- Name: i_fk_reponse_requete; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_reponse_requete ON reponse USING btree (idrequete);


--
-- Name: i_fk_requete_requeteenseignant; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requete_requeteenseignant ON requete USING btree (idreaueteenseignant);


--
-- Name: i_fk_requetedecanat_annee_acad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requetedecanat_annee_acad ON requetedecanat USING btree (annee);


--
-- Name: i_fk_requetedecanat_requete; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requetedecanat_requete ON requetedecanat USING btree (idrequete);


--
-- Name: i_fk_requeteenseignant_enseign; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requeteenseignant_enseign ON requeteenseignant USING btree (matriculeenseignant);


--
-- Name: i_fk_requeteenseignant_etudian; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requeteenseignant_etudian ON requeteenseignant USING btree (matriculeetudiant);


--
-- Name: i_fk_requeteenseignant_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requeteenseignant_matiere ON requeteenseignant USING btree (idmatiere);


--
-- Name: i_fk_requetejury_classe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requetejury_classe ON requetejury USING btree (idclasse);


--
-- Name: i_fk_requetejury_requete; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requetejury_requete ON requetejury USING btree (idrequete);


--
-- Name: i_fk_requetematiere_matiere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requetematiere_matiere ON requetematiere USING btree (idmatiere);


--
-- Name: i_fk_requetematiere_requete; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_requetematiere_requete ON requetematiere USING btree (idrequete);


--
-- Name: i_fk_role_administrateur; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_role_administrateur ON role USING btree (idadmin);


--
-- Name: i_fk_role_personne; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX i_fk_role_personne ON role USING btree (idpersonne);


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

CREATE INDEX i_fk_ue_classe_ue ON ue_classe USING btree (codeue);


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
-- Name: fk_droit_role_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT fk_droit_role_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- Name: fk_droit_role_droit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT fk_droit_role_droit FOREIGN KEY (iddroit) REFERENCES droit(iddroit);


--
-- Name: fk_droit_role_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT fk_droit_role_etudiant FOREIGN KEY (matriculeetudiant) REFERENCES etudiant(matriculeetudiant);


--
-- Name: fk_droit_role_examen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT fk_droit_role_examen FOREIGN KEY (idexamen) REFERENCES examen(idexamen);


--
-- Name: fk_droit_role_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT fk_droit_role_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_droit_role_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT fk_droit_role_role FOREIGN KEY (idrole) REFERENCES role(idrole);


--
-- Name: fk_droit_role_ue; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY droit_role
    ADD CONSTRAINT fk_droit_role_ue FOREIGN KEY (codeue) REFERENCES ue(codeue);


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
    ADD CONSTRAINT fk_enseignant_chef_departement_e FOREIGN KEY (matriculeenseignant) REFERENCES enseignant(matriculeenseignant);


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
    ADD CONSTRAINT fk_enseignant_classe_jury_enseig FOREIGN KEY (matriculeenseignant) REFERENCES enseignant(matriculeenseignant);


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
-- Name: fk_enseignant_mat_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT fk_enseignant_mat_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- Name: fk_enseignant_mat_enseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant_mat
    ADD CONSTRAINT fk_enseignant_mat_enseignant FOREIGN KEY (matriculeenseignant) REFERENCES enseignant(matriculeenseignant);


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
-- Name: fk_etablir_droit_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- Name: fk_etablir_droit_droit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_droit FOREIGN KEY (iddroit) REFERENCES droit(iddroit);


--
-- Name: fk_etablir_droit_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_etudiant FOREIGN KEY (matriculeetudiant) REFERENCES etudiant(matriculeetudiant);


--
-- Name: fk_etablir_droit_examen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_examen FOREIGN KEY (idexamen) REFERENCES examen(idexamen);


--
-- Name: fk_etablir_droit_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_etablir_droit_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


--
-- Name: fk_etablir_droit_ue; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etablir_droit
    ADD CONSTRAINT fk_etablir_droit_ue FOREIGN KEY (codeue) REFERENCES ue(codeue);


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
    ADD CONSTRAINT fk_etudiant_classe_etudiant FOREIGN KEY (matriculeetudiant) REFERENCES etudiant(matriculeetudiant);


--
-- Name: fk_etudiant_exam_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT fk_etudiant_exam_etudiant FOREIGN KEY (matriculeetudiant) REFERENCES etudiant(matriculeetudiant);


--
-- Name: fk_etudiant_exam_matiere_exam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant_exam
    ADD CONSTRAINT fk_etudiant_exam_matiere_exam FOREIGN KEY (idmatiereexam) REFERENCES matiere_exam(idmatiereexam);


--
-- Name: fk_etudiant_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant
    ADD CONSTRAINT fk_etudiant_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


--
-- Name: fk_faculte_departement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departement
    ADD CONSTRAINT fk_faculte_departement FOREIGN KEY (idfaculte) REFERENCES faculte(idfaculte);


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
    ADD CONSTRAINT fk_inscription_etudiant FOREIGN KEY (matriculeetudiant) REFERENCES etudiant(matriculeetudiant);


--
-- Name: fk_inscription_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT fk_inscription_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_interdit_droit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interdit
    ADD CONSTRAINT fk_interdit_droit FOREIGN KEY (iddroit) REFERENCES droit(iddroit);


--
-- Name: fk_interdit_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY interdit
    ADD CONSTRAINT fk_interdit_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


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
    ADD CONSTRAINT fk_matiere_ue_ue FOREIGN KEY (codeue) REFERENCES ue(codeue);


--
-- Name: fk_recteur_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recteur
    ADD CONSTRAINT fk_recteur_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


--
-- Name: fk_reponse_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


--
-- Name: fk_reponse_requete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reponse
    ADD CONSTRAINT fk_reponse_requete FOREIGN KEY (idrequete) REFERENCES requete(idrequete);


--
-- Name: fk_requete_requeteenseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requete
    ADD CONSTRAINT fk_requete_requeteenseignant FOREIGN KEY (idreaueteenseignant) REFERENCES requeteenseignant(idreaueteenseignant);


--
-- Name: fk_requetedecanat_annee_academiq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requetedecanat
    ADD CONSTRAINT fk_requetedecanat_annee_academiq FOREIGN KEY (annee) REFERENCES annee_academique(annee);


--
-- Name: fk_requetedecanat_requete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requetedecanat
    ADD CONSTRAINT fk_requetedecanat_requete FOREIGN KEY (idrequete) REFERENCES requete(idrequete);


--
-- Name: fk_requeteenseignant_enseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requeteenseignant
    ADD CONSTRAINT fk_requeteenseignant_enseignant FOREIGN KEY (matriculeenseignant) REFERENCES enseignant(matriculeenseignant);


--
-- Name: fk_requeteenseignant_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requeteenseignant
    ADD CONSTRAINT fk_requeteenseignant_etudiant FOREIGN KEY (matriculeetudiant) REFERENCES etudiant(matriculeetudiant);


--
-- Name: fk_requeteenseignant_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requeteenseignant
    ADD CONSTRAINT fk_requeteenseignant_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_requetejury_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requetejury
    ADD CONSTRAINT fk_requetejury_classe FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- Name: fk_requetejury_requete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requetejury
    ADD CONSTRAINT fk_requetejury_requete FOREIGN KEY (idrequete) REFERENCES requete(idrequete);


--
-- Name: fk_requetematiere_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requetematiere
    ADD CONSTRAINT fk_requetematiere_matiere FOREIGN KEY (idmatiere) REFERENCES matiere(idmatiere);


--
-- Name: fk_requetematiere_requete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requetematiere
    ADD CONSTRAINT fk_requetematiere_requete FOREIGN KEY (idrequete) REFERENCES requete(idrequete);


--
-- Name: fk_role_administrateur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT fk_role_administrateur FOREIGN KEY (idadmin) REFERENCES administrateur(idadmin);


--
-- Name: fk_role_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT fk_role_personne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne);


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
    ADD CONSTRAINT fk_ue_classe_ue FOREIGN KEY (codeue) REFERENCES ue(codeue);


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

