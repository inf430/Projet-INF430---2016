package entities;

import entities.EtudiantClasse;
import entities.EtudiantExam;
import entities.Inscription;
import entities.Personne;
import entities.Requete;
import entities.Role;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Etudiant.class)
public class Etudiant_ { 

    public static volatile ListAttribute<Etudiant, Inscription> inscriptionList;
    public static volatile SingularAttribute<Etudiant, Personne> idpersonne;
    public static volatile SingularAttribute<Etudiant, String> matricule;
    public static volatile ListAttribute<Etudiant, Requete> requeteList;
    public static volatile ListAttribute<Etudiant, EtudiantClasse> etudiantClasseList;
    public static volatile ListAttribute<Etudiant, EtudiantExam> etudiantExamList;
    public static volatile ListAttribute<Etudiant, Role> roleList;

}