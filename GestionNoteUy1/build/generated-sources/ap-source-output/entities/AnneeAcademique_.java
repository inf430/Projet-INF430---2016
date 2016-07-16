package entities;

import entities.EnseignantChefDepartement;
import entities.EnseignantClasseJury;
import entities.EnseignantMat;
import entities.EtudiantClasse;
import entities.Inscription;
import entities.MatiereExam;
import entities.MatiereUe;
import entities.Semestre;
import entities.UeClasse;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(AnneeAcademique.class)
public class AnneeAcademique_ { 

    public static volatile ListAttribute<AnneeAcademique, EnseignantClasseJury> enseignantClasseJuryList;
    public static volatile ListAttribute<AnneeAcademique, Inscription> inscriptionList;
    public static volatile ListAttribute<AnneeAcademique, EnseignantMat> enseignantMatList;
    public static volatile ListAttribute<AnneeAcademique, EnseignantChefDepartement> enseignantChefDepartementList;
    public static volatile ListAttribute<AnneeAcademique, EtudiantClasse> etudiantClasseList;
    public static volatile ListAttribute<AnneeAcademique, MatiereUe> matiereUeList;
    public static volatile ListAttribute<AnneeAcademique, UeClasse> ueClasseList;
    public static volatile SingularAttribute<AnneeAcademique, String> annee;
    public static volatile ListAttribute<AnneeAcademique, MatiereExam> matiereExamList;
    public static volatile SingularAttribute<AnneeAcademique, String> etat;
    public static volatile ListAttribute<AnneeAcademique, Semestre> semestreList;

}