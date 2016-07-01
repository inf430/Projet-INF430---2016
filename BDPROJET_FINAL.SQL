
-- -----------------------------------------------------------------------------
--       TABLE : DROIT
-- -----------------------------------------------------------------------------

CREATE TABLE DROIT
   (
    IDDROIT serial NOT NULL  ,
    IDADMIN int NOT NULL  ,
    NOM varchar(50) NULL  
,   CONSTRAINT PK_DROIT PRIMARY KEY (IDDROIT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE DROIT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_DROIT_ADMIN
     ON DROIT (IDADMIN)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : REQUETE
-- -----------------------------------------------------------------------------

CREATE TABLE REQUETE
   (
    IDREQUETE serial NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    OBJET text NULL  ,
    DATE varchar(10) NULL  ,
    ETAT varchar(30) NULL  
,   CONSTRAINT PK_REQUETE PRIMARY KEY (IDREQUETE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REQUETE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REQUETE_ETUDIANT
     ON REQUETE (MATRICULE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE PERSONNE
   (
    IDPERSONNE serial NOT NULL  ,
    NOM varchar(50) NULL  ,
    PRENOM varchar(50) NULL  ,
    DATENAISS varchar(10) NULL  ,
    LIEUNAISS varchar(30) NULL  ,
    SEXE char(1) NULL     CHECK (SEXE IN ('F', 'M')),
    LOGIN varchar(30) NULL  ,
    PASSWORD varchar(30) NULL  ,
    STATUT varchar(15) NULL  ,
    NUMTEL varchar(20) NULL  
,   CONSTRAINT PK_PERSONNE PRIMARY KEY (IDPERSONNE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : UE
-- -----------------------------------------------------------------------------

CREATE TABLE UE
   (
    CODE varchar(30) NOT NULL  ,
    IDSEMESTRE int4 NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_UE PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE UE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_UE_SEMESTRE
     ON UE (IDSEMESTRE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MATIERE
-- -----------------------------------------------------------------------------

CREATE TABLE MATIERE
   (
    IDMATIERE serial NOT NULL  ,
    CODE varchar(30) NULL  ,
    LIBELLE varchar(50) NULL  
,   CONSTRAINT PK_MATIERE PRIMARY KEY (IDMATIERE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : INSCRIPTION
-- -----------------------------------------------------------------------------

CREATE TABLE INSCRIPTION
   (
    IDINSCRIPTION serial NOT NULL  ,
    IDMATIERE int NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    ANNEE varchar(10) NOT NULL  
,   CONSTRAINT PK_INSCRIPTION PRIMARY KEY (IDINSCRIPTION)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE INSCRIPTION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_INSCRIPTION_MATIERE
     ON INSCRIPTION (IDMATIERE)
    ;

CREATE  INDEX I_FK_INSCRIPTION_ETUDIANT
     ON INSCRIPTION (MATRICULE)
    ;

CREATE  INDEX I_FK_INSCRIPTION_ANNEE_ACADEMI
     ON INSCRIPTION (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ETUDIANT
-- -----------------------------------------------------------------------------

CREATE TABLE ETUDIANT
   (
    MATRICULE varchar(10) NOT NULL  ,
    IDPERSONNE int NOT NULL  
,   CONSTRAINT PK_ETUDIANT PRIMARY KEY (MATRICULE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ETUDIANT
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX I_FK_ETUDIANT_PERSONNE
     ON ETUDIANT (IDPERSONNE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MATIERE_UE
-- -----------------------------------------------------------------------------

CREATE TABLE MATIERE_UE
   (
    IDMATIEREUE serial NOT NULL  ,
    IDMATIERE int NOT NULL  ,
    CODE varchar(30) NOT NULL  ,
    ANNEE varchar(10) NOT NULL  ,
    CREDIT int4 NULL  
,   CONSTRAINT PK_MATIERE_UE PRIMARY KEY (IDMATIEREUE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MATIERE_UE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MATIERE_UE_MATIERE
     ON MATIERE_UE (IDMATIERE)
    ;

CREATE  INDEX I_FK_MATIERE_UE_UE
     ON MATIERE_UE (CODE)
    ;

CREATE  INDEX I_FK_MATIERE_UE_ANNEE_ACADEMIQ
     ON MATIERE_UE (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : EXAMEN
-- -----------------------------------------------------------------------------

CREATE TABLE EXAMEN
   (
    IDEXAMEN serial NOT NULL  ,
    DATE varchar(10) NULL  ,
    TYPE varchar(30) NULL  
,   CONSTRAINT PK_EXAMEN PRIMARY KEY (IDEXAMEN)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ETUDIANT_EXAM
-- -----------------------------------------------------------------------------

CREATE TABLE ETUDIANT_EXAM
   (
    IDETUDIANTEXAM serial NOT NULL  ,
    IDEXAMEN int4 NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    ANNEE varchar(10) NOT NULL  ,
    NOTE float4 NULL  ,
    ANONYMAT varchar(20) NULL  
,   CONSTRAINT PK_ETUDIANT_EXAM PRIMARY KEY (IDETUDIANTEXAM)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ETUDIANT_EXAM
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ETUDIANT_EXAM_EXAMEN
     ON ETUDIANT_EXAM (IDEXAMEN)
    ;

CREATE  INDEX I_FK_ETUDIANT_EXAM_ETUDIANT
     ON ETUDIANT_EXAM (MATRICULE)
    ;

CREATE  INDEX I_FK_ETUDIANT_EXAM_ANNEE_ACADE
     ON ETUDIANT_EXAM (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ADMIN
-- -----------------------------------------------------------------------------

CREATE TABLE ADMIN
   (
    IDADMIN serial NOT NULL  ,
    LOGIN varchar(50) NULL  ,
    PASSWORD varchar(50) NULL  
,   CONSTRAINT PK_ADMIN PRIMARY KEY (IDADMIN)
   );

-- -----------------------------------------------------------------------------
--       TABLE : DEPARTEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE DEPARTEMENT
   (
    IDDEPARTEMENT serial NOT NULL  ,
    CODE varchar(30) NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_DEPARTEMENT PRIMARY KEY (IDDEPARTEMENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ANNEE_ACADEMIQUE
-- -----------------------------------------------------------------------------

CREATE TABLE ANNEE_ACADEMIQUE
   (
    ANNEE varchar(10) NOT NULL  ,
    ETAT varchar(30) NULL  
,   CONSTRAINT PK_ANNEE_ACADEMIQUE PRIMARY KEY (ANNEE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ENSEIGNANT_MAT
-- -----------------------------------------------------------------------------

CREATE TABLE ENSEIGNANT_MAT
   (
    IDENSEIGNANTMAT serial NOT NULL  ,
    IDMATIERE int NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    ANNEE varchar(10) NOT NULL  
,   CONSTRAINT PK_ENSEIGNANT_MAT PRIMARY KEY (IDENSEIGNANTMAT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ENSEIGNANT_MAT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ENSEIGNANT_MAT_MATIERE
     ON ENSEIGNANT_MAT (IDMATIERE)
    ;

CREATE  INDEX I_FK_ENSEIGNANT_MAT_ENSEIGNANT
     ON ENSEIGNANT_MAT (MATRICULE)
    ;

CREATE  INDEX I_FK_ENSEIGNANT_MAT_ANNEE_ACAD
     ON ENSEIGNANT_MAT (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : SEMESTRE
-- -----------------------------------------------------------------------------

CREATE TABLE SEMESTRE
   (
    IDSEMESTRE serial NOT NULL  ,
    ANNEE varchar(10) NOT NULL  ,
    SEMESTRE varchar(30) NULL  
,   CONSTRAINT PK_SEMESTRE PRIMARY KEY (IDSEMESTRE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SEMESTRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SEMESTRE_ANNEE_ACADEMIQUE
     ON SEMESTRE (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MATIERE_EXAM
-- -----------------------------------------------------------------------------

CREATE TABLE MATIERE_EXAM
   (
    IDMATIEREEXAM serial NOT NULL  ,
    IDMATIERE int NOT NULL  ,
    IDEXAMEN int4 NOT NULL  ,
    ANNEE varchar(10) NOT NULL  ,
    POURCENTAGE int4 NULL     CHECK (POURCENTAGE BETWEEN 0 AND 100)
,   CONSTRAINT PK_MATIERE_EXAM PRIMARY KEY (IDMATIEREEXAM)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MATIERE_EXAM
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MATIERE_EXAM_MATIERE
     ON MATIERE_EXAM (IDMATIERE)
    ;

CREATE  INDEX I_FK_MATIERE_EXAM_EXAMEN
     ON MATIERE_EXAM (IDEXAMEN)
    ;

CREATE  INDEX I_FK_MATIERE_EXAM_ANNEE_ACADEM
     ON MATIERE_EXAM (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ETUDIANT_CLASSE
-- -----------------------------------------------------------------------------

CREATE TABLE ETUDIANT_CLASSE
   (
    IDETUDIANTCLASSE serial NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    IDCLASSE int NOT NULL  ,
    ANNEE varchar(10) NOT NULL  
,   CONSTRAINT PK_ETUDIANT_CLASSE PRIMARY KEY (IDETUDIANTCLASSE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ETUDIANT_CLASSE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ETUDIANT_CLASSE_ETUDIANT
     ON ETUDIANT_CLASSE (MATRICULE)
    ;

CREATE  INDEX I_FK_ETUDIANT_CLASSE_CLASSE
     ON ETUDIANT_CLASSE (IDCLASSE)
    ;

CREATE  INDEX I_FK_ETUDIANT_CLASSE_ANNEE_ACA
     ON ETUDIANT_CLASSE (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : UE_CLASSE
-- -----------------------------------------------------------------------------

CREATE TABLE UE_CLASSE
   (
    IDUECLASSE serial NOT NULL  ,
    CODE varchar(30) NOT NULL  ,
    IDCLASSE int NOT NULL  ,
    ANNEE varchar(10) NOT NULL  
,   CONSTRAINT PK_UE_CLASSE PRIMARY KEY (IDUECLASSE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE UE_CLASSE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_UE_CLASSE_UE
     ON UE_CLASSE (CODE)
    ;

CREATE  INDEX I_FK_UE_CLASSE_CLASSE
     ON UE_CLASSE (IDCLASSE)
    ;

CREATE  INDEX I_FK_UE_CLASSE_ANNEE_ACADEMIQU
     ON UE_CLASSE (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CLASSE
-- -----------------------------------------------------------------------------

CREATE TABLE CLASSE
   (
    IDCLASSE serial NOT NULL  ,
    IDFILIERE int NOT NULL  ,
    NIVEAU varchar(30) NOT NULL  ,
    NOM varchar(50) NULL  
,   CONSTRAINT PK_CLASSE PRIMARY KEY (IDCLASSE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CLASSE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CLASSE_FILIERE
     ON CLASSE (IDFILIERE)
    ;

CREATE  INDEX I_FK_CLASSE_NIVEAU
     ON CLASSE (NIVEAU)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ENSEIGNANT_CHEF_DEPARTEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE ENSEIGNANT_CHEF_DEPARTEMENT
   (
    IDENSEIGNANTCHEFDEPARTEMENT serial NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    IDDEPARTEMENT int NOT NULL  ,
    ANNEE varchar(10) NOT NULL  
,   CONSTRAINT PK_ENSEIGNANT_CHEF_DEPARTEMENT PRIMARY KEY (IDENSEIGNANTCHEFDEPARTEMENT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ENSEIGNANT_CHEF_DEPARTEMENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ENSEIGNANT_CHEF_DEPARTEME
     ON ENSEIGNANT_CHEF_DEPARTEMENT (MATRICULE)
    ;

CREATE  INDEX I_FK_ENSEIGNANT_CHEF_DEPARTEM1
     ON ENSEIGNANT_CHEF_DEPARTEMENT (IDDEPARTEMENT)
    ;

CREATE  INDEX I_FK_ENSEIGNANT_CHEF_DEPARTEM2
     ON ENSEIGNANT_CHEF_DEPARTEMENT (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : NIVEAU
-- -----------------------------------------------------------------------------

CREATE TABLE NIVEAU
   (
    NIVEAU varchar(30) NOT NULL  ,
    CYCLE varchar(20) NULL  
,   CONSTRAINT PK_NIVEAU PRIMARY KEY (NIVEAU)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ADMINISTRATIF
-- -----------------------------------------------------------------------------

CREATE TABLE ADMINISTRATIF
   (
    IDADMINISTATIF serial NOT NULL  ,
    IDPERSONNE int NOT NULL  
,   CONSTRAINT PK_ADMINISTRATIF PRIMARY KEY (IDADMINISTATIF)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ADMINISTRATIF
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX I_FK_ADMINISTRATIF_PERSONNE
     ON ADMINISTRATIF (IDPERSONNE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ENSEIGNANT_CLASSE_JURY
-- -----------------------------------------------------------------------------

CREATE TABLE ENSEIGNANT_CLASSE_JURY
   (
    IDENSEIGNANTCLASSEJURY serial NOT NULL  ,
    IDCLASSE int NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    ANNEE varchar(10) NOT NULL  
,   CONSTRAINT PK_ENSEIGNANT_CLASSE_JURY PRIMARY KEY (IDENSEIGNANTCLASSEJURY)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ENSEIGNANT_CLASSE_JURY
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ENSEIGNANT_CLASSE_JURY_CL
     ON ENSEIGNANT_CLASSE_JURY (IDCLASSE)
    ;

CREATE  INDEX I_FK_ENSEIGNANT_CLASSE_JURY_EN
     ON ENSEIGNANT_CLASSE_JURY (MATRICULE)
    ;

CREATE  INDEX I_FK_ENSEIGNANT_CLASSE_JURY_AN
     ON ENSEIGNANT_CLASSE_JURY (ANNEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ROLE
-- -----------------------------------------------------------------------------

CREATE TABLE ROLE
   (
    IDROLE serial NOT NULL  ,
    IDADMIN int NOT NULL  ,
    ROLE varchar(50) NULL  
,   CONSTRAINT PK_ROLE PRIMARY KEY (IDROLE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ROLE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ROLE_ADMIN
     ON ROLE (IDADMIN)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : FILIERE
-- -----------------------------------------------------------------------------

CREATE TABLE FILIERE
   (
    IDFILIERE serial NOT NULL  ,
    IDDEPARTEMENT int NOT NULL  ,
    CODE varchar(30) NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_FILIERE PRIMARY KEY (IDFILIERE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE FILIERE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_FILIERE_DEPARTEMENT
     ON FILIERE (IDDEPARTEMENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ETABLIR_DROIT
-- -----------------------------------------------------------------------------

CREATE TABLE ETABLIR_DROIT
   (
    IDETABLIRDROIT serial NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    IDADMINISTATIF int4 NOT NULL  ,
    IDDROIT int NOT NULL  ,
    DATEDEB varchar(10) NULL  ,
    DATEFIN varchar(10) NULL  
,   CONSTRAINT PK_ETABLIR_DROIT PRIMARY KEY (IDETABLIRDROIT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ETABLIR_DROIT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ETABLIR_DROIT_ENSEIGNANT
     ON ETABLIR_DROIT (MATRICULE)
    ;

CREATE  INDEX I_FK_ETABLIR_DROIT_ADMINISTRAT
     ON ETABLIR_DROIT (IDADMINISTATIF)
    ;

CREATE  INDEX I_FK_ETABLIR_DROIT_DROIT
     ON ETABLIR_DROIT (IDDROIT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ENSEIGNANT
-- -----------------------------------------------------------------------------

CREATE TABLE ENSEIGNANT
   (
    MATRICULE varchar(10) NOT NULL  ,
    IDPERSONNE int NOT NULL  ,
    IDDEPARTEMENT int NOT NULL  ,
    GRADE varchar(50) NULL  ,
    SPECIALITE varchar(50) NULL  
,   CONSTRAINT PK_ENSEIGNANT PRIMARY KEY (MATRICULE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ENSEIGNANT
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX I_FK_ENSEIGNANT_PERSONNE
     ON ENSEIGNANT (IDPERSONNE)
    ;

CREATE  INDEX I_FK_ENSEIGNANT_DEPARTEMENT
     ON ENSEIGNANT (IDDEPARTEMENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : REPONSE
-- -----------------------------------------------------------------------------

CREATE TABLE REPONSE
   (
    IDREPONSE serial NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  ,
    IDREQUETE int4 NOT NULL  ,
    DATE varchar(10) NULL  ,
    CONTENU text NULL  
,   CONSTRAINT PK_REPONSE PRIMARY KEY (IDREPONSE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REPONSE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REPONSE_ENSEIGNANT
     ON REPONSE (MATRICULE)
    ;

CREATE UNIQUE INDEX I_FK_REPONSE_REQUETE
     ON REPONSE (IDREQUETE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ROLEADMINISTRATIF
-- -----------------------------------------------------------------------------

CREATE TABLE ROLEADMINISTRATIF
   (
    IDADMINISTATIF int4 NOT NULL  ,
    IDROLE int NOT NULL  
,   CONSTRAINT PK_ROLEADMINISTRATIF PRIMARY KEY (IDADMINISTATIF, IDROLE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ROLEADMINISTRATIF
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ROLEADMINISTRATIF_ADMINIS
     ON ROLEADMINISTRATIF (IDADMINISTATIF)
    ;

CREATE  INDEX I_FK_ROLEADMINISTRATIF_ROLE
     ON ROLEADMINISTRATIF (IDROLE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ROLEENSEIGNANT
-- -----------------------------------------------------------------------------

CREATE TABLE ROLEENSEIGNANT
   (
    MATRICULE varchar(10) NOT NULL  ,
    IDROLE int NOT NULL  
,   CONSTRAINT PK_ROLEENSEIGNANT PRIMARY KEY (MATRICULE, IDROLE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ROLEENSEIGNANT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ROLEENSEIGNANT_ENSEIGNANT
     ON ROLEENSEIGNANT (MATRICULE)
    ;

CREATE  INDEX I_FK_ROLEENSEIGNANT_ROLE
     ON ROLEENSEIGNANT (IDROLE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : APPARTENIRDROIT
-- -----------------------------------------------------------------------------

CREATE TABLE APPARTENIRDROIT
   (
    IDDROIT int NOT NULL  ,
    IDROLE int NOT NULL  
,   CONSTRAINT PK_APPARTENIRDROIT PRIMARY KEY (IDDROIT, IDROLE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE APPARTENIRDROIT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_APPARTENIRDROIT_DROIT
     ON APPARTENIRDROIT (IDDROIT)
    ;

CREATE  INDEX I_FK_APPARTENIRDROIT_ROLE
     ON APPARTENIRDROIT (IDROLE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ROLEETUDIANT
-- -----------------------------------------------------------------------------

CREATE TABLE ROLEETUDIANT
   (
    IDROLE int NOT NULL  ,
    MATRICULE varchar(10) NOT NULL  
,   CONSTRAINT PK_ROLEETUDIANT PRIMARY KEY (IDROLE, MATRICULE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ROLEETUDIANT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ROLEETUDIANT_ROLE
     ON ROLEETUDIANT (IDROLE)
    ;

CREATE  INDEX I_FK_ROLEETUDIANT_ETUDIANT
     ON ROLEETUDIANT (MATRICULE)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE DROIT ADD 
     CONSTRAINT FK_DROIT_ADMIN
          FOREIGN KEY (IDADMIN)
               REFERENCES ADMIN (IDADMIN);

ALTER TABLE REQUETE ADD 
     CONSTRAINT FK_REQUETE_ETUDIANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ETUDIANT (MATRICULE);

ALTER TABLE UE ADD 
     CONSTRAINT FK_UE_SEMESTRE
          FOREIGN KEY (IDSEMESTRE)
               REFERENCES SEMESTRE (IDSEMESTRE);

ALTER TABLE INSCRIPTION ADD 
     CONSTRAINT FK_INSCRIPTION_MATIERE
          FOREIGN KEY (IDMATIERE)
               REFERENCES MATIERE (IDMATIERE);

ALTER TABLE INSCRIPTION ADD 
     CONSTRAINT FK_INSCRIPTION_ETUDIANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ETUDIANT (MATRICULE);

ALTER TABLE INSCRIPTION ADD 
     CONSTRAINT FK_INSCRIPTION_ANNEE_ACADEMIQUE
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE ETUDIANT ADD 
     CONSTRAINT FK_ETUDIANT_PERSONNE
          FOREIGN KEY (IDPERSONNE)
               REFERENCES PERSONNE (IDPERSONNE);

ALTER TABLE MATIERE_UE ADD 
     CONSTRAINT FK_MATIERE_UE_MATIERE
          FOREIGN KEY (IDMATIERE)
               REFERENCES MATIERE (IDMATIERE);

ALTER TABLE MATIERE_UE ADD 
     CONSTRAINT FK_MATIERE_UE_UE
          FOREIGN KEY (CODE)
               REFERENCES UE (CODE);

ALTER TABLE MATIERE_UE ADD 
     CONSTRAINT FK_MATIERE_UE_ANNEE_ACADEMIQUE
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE ETUDIANT_EXAM ADD 
     CONSTRAINT FK_ETUDIANT_EXAM_EXAMEN
          FOREIGN KEY (IDEXAMEN)
               REFERENCES EXAMEN (IDEXAMEN);

ALTER TABLE ETUDIANT_EXAM ADD 
     CONSTRAINT FK_ETUDIANT_EXAM_ETUDIANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ETUDIANT (MATRICULE);

ALTER TABLE ETUDIANT_EXAM ADD 
     CONSTRAINT FK_ETUDIANT_EXAM_ANNEE_ACADEMIQU
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE ENSEIGNANT_MAT ADD 
     CONSTRAINT FK_ENSEIGNANT_MAT_MATIERE
          FOREIGN KEY (IDMATIERE)
               REFERENCES MATIERE (IDMATIERE);

ALTER TABLE ENSEIGNANT_MAT ADD 
     CONSTRAINT FK_ENSEIGNANT_MAT_ENSEIGNANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ENSEIGNANT (MATRICULE);

ALTER TABLE ENSEIGNANT_MAT ADD 
     CONSTRAINT FK_ENSEIGNANT_MAT_ANNEE_ACADEMIQ
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE SEMESTRE ADD 
     CONSTRAINT FK_SEMESTRE_ANNEE_ACADEMIQUE
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE MATIERE_EXAM ADD 
     CONSTRAINT FK_MATIERE_EXAM_MATIERE
          FOREIGN KEY (IDMATIERE)
               REFERENCES MATIERE (IDMATIERE);

ALTER TABLE MATIERE_EXAM ADD 
     CONSTRAINT FK_MATIERE_EXAM_EXAMEN
          FOREIGN KEY (IDEXAMEN)
               REFERENCES EXAMEN (IDEXAMEN);

ALTER TABLE MATIERE_EXAM ADD 
     CONSTRAINT FK_MATIERE_EXAM_ANNEE_ACADEMIQUE
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE ETUDIANT_CLASSE ADD 
     CONSTRAINT FK_ETUDIANT_CLASSE_ETUDIANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ETUDIANT (MATRICULE);

ALTER TABLE ETUDIANT_CLASSE ADD 
     CONSTRAINT FK_ETUDIANT_CLASSE_CLASSE
          FOREIGN KEY (IDCLASSE)
               REFERENCES CLASSE (IDCLASSE);

ALTER TABLE ETUDIANT_CLASSE ADD 
     CONSTRAINT FK_ETUDIANT_CLASSE_ANNEE_ACADEMI
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE UE_CLASSE ADD 
     CONSTRAINT FK_UE_CLASSE_UE
          FOREIGN KEY (CODE)
               REFERENCES UE (CODE);

ALTER TABLE UE_CLASSE ADD 
     CONSTRAINT FK_UE_CLASSE_CLASSE
          FOREIGN KEY (IDCLASSE)
               REFERENCES CLASSE (IDCLASSE);

ALTER TABLE UE_CLASSE ADD 
     CONSTRAINT FK_UE_CLASSE_ANNEE_ACADEMIQUE
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE CLASSE ADD 
     CONSTRAINT FK_CLASSE_FILIERE
          FOREIGN KEY (IDFILIERE)
               REFERENCES FILIERE (IDFILIERE);

ALTER TABLE CLASSE ADD 
     CONSTRAINT FK_CLASSE_NIVEAU
          FOREIGN KEY (NIVEAU)
               REFERENCES NIVEAU (NIVEAU);

ALTER TABLE ENSEIGNANT_CHEF_DEPARTEMENT ADD 
     CONSTRAINT FK_ENSEIGNANT_CHEF_DEPARTEMENT_E
          FOREIGN KEY (MATRICULE)
               REFERENCES ENSEIGNANT (MATRICULE);

ALTER TABLE ENSEIGNANT_CHEF_DEPARTEMENT ADD 
     CONSTRAINT FK_ENSEIGNANT_CHEF_DEPARTEMENT_D
          FOREIGN KEY (IDDEPARTEMENT)
               REFERENCES DEPARTEMENT (IDDEPARTEMENT);

ALTER TABLE ENSEIGNANT_CHEF_DEPARTEMENT ADD 
     CONSTRAINT FK_ENSEIGNANT_CHEF_DEPARTEMENT_A
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE ADMINISTRATIF ADD 
     CONSTRAINT FK_ADMINISTRATIF_PERSONNE
          FOREIGN KEY (IDPERSONNE)
               REFERENCES PERSONNE (IDPERSONNE);

ALTER TABLE ENSEIGNANT_CLASSE_JURY ADD 
     CONSTRAINT FK_ENSEIGNANT_CLASSE_JURY_CLASSE
          FOREIGN KEY (IDCLASSE)
               REFERENCES CLASSE (IDCLASSE);

ALTER TABLE ENSEIGNANT_CLASSE_JURY ADD 
     CONSTRAINT FK_ENSEIGNANT_CLASSE_JURY_ENSEIG
          FOREIGN KEY (MATRICULE)
               REFERENCES ENSEIGNANT (MATRICULE);

ALTER TABLE ENSEIGNANT_CLASSE_JURY ADD 
     CONSTRAINT FK_ENSEIGNANT_CLASSE_JURY_ANNEE_
          FOREIGN KEY (ANNEE)
               REFERENCES ANNEE_ACADEMIQUE (ANNEE);

ALTER TABLE ROLE ADD 
     CONSTRAINT FK_ROLE_ADMIN
          FOREIGN KEY (IDADMIN)
               REFERENCES ADMIN (IDADMIN);

ALTER TABLE FILIERE ADD 
     CONSTRAINT FK_FILIERE_DEPARTEMENT
          FOREIGN KEY (IDDEPARTEMENT)
               REFERENCES DEPARTEMENT (IDDEPARTEMENT);

ALTER TABLE ETABLIR_DROIT ADD 
     CONSTRAINT FK_ETABLIR_DROIT_ENSEIGNANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ENSEIGNANT (MATRICULE);

ALTER TABLE ETABLIR_DROIT ADD 
     CONSTRAINT FK_ETABLIR_DROIT_ADMINISTRATIF
          FOREIGN KEY (IDADMINISTATIF)
               REFERENCES ADMINISTRATIF (IDADMINISTATIF);

ALTER TABLE ETABLIR_DROIT ADD 
     CONSTRAINT FK_ETABLIR_DROIT_DROIT
          FOREIGN KEY (IDDROIT)
               REFERENCES DROIT (IDDROIT);

ALTER TABLE ENSEIGNANT ADD 
     CONSTRAINT FK_ENSEIGNANT_PERSONNE
          FOREIGN KEY (IDPERSONNE)
               REFERENCES PERSONNE (IDPERSONNE);

ALTER TABLE ENSEIGNANT ADD 
     CONSTRAINT FK_ENSEIGNANT_DEPARTEMENT
          FOREIGN KEY (IDDEPARTEMENT)
               REFERENCES DEPARTEMENT (IDDEPARTEMENT);

ALTER TABLE REPONSE ADD 
     CONSTRAINT FK_REPONSE_ENSEIGNANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ENSEIGNANT (MATRICULE);

ALTER TABLE REPONSE ADD 
     CONSTRAINT FK_REPONSE_REQUETE
          FOREIGN KEY (IDREQUETE)
               REFERENCES REQUETE (IDREQUETE);

ALTER TABLE ROLEADMINISTRATIF ADD 
     CONSTRAINT FK_ROLEADMINISTRATIF_ADMINISTRAT
          FOREIGN KEY (IDADMINISTATIF)
               REFERENCES ADMINISTRATIF (IDADMINISTATIF);

ALTER TABLE ROLEADMINISTRATIF ADD 
     CONSTRAINT FK_ROLEADMINISTRATIF_ROLE
          FOREIGN KEY (IDROLE)
               REFERENCES ROLE (IDROLE);

ALTER TABLE ROLEENSEIGNANT ADD 
     CONSTRAINT FK_ROLEENSEIGNANT_ENSEIGNANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ENSEIGNANT (MATRICULE);

ALTER TABLE ROLEENSEIGNANT ADD 
     CONSTRAINT FK_ROLEENSEIGNANT_ROLE
          FOREIGN KEY (IDROLE)
               REFERENCES ROLE (IDROLE);

ALTER TABLE APPARTENIRDROIT ADD 
     CONSTRAINT FK_APPARTENIRDROIT_DROIT
          FOREIGN KEY (IDDROIT)
               REFERENCES DROIT (IDDROIT);

ALTER TABLE APPARTENIRDROIT ADD 
     CONSTRAINT FK_APPARTENIRDROIT_ROLE
          FOREIGN KEY (IDROLE)
               REFERENCES ROLE (IDROLE);

ALTER TABLE ROLEETUDIANT ADD 
     CONSTRAINT FK_ROLEETUDIANT_ROLE
          FOREIGN KEY (IDROLE)
               REFERENCES ROLE (IDROLE);

ALTER TABLE ROLEETUDIANT ADD 
     CONSTRAINT FK_ROLEETUDIANT_ETUDIANT
          FOREIGN KEY (MATRICULE)
               REFERENCES ETUDIANT (MATRICULE);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------