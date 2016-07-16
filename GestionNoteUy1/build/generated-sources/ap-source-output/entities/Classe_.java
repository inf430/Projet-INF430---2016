package entities;

import entities.EnseignantClasseJury;
import entities.EnseignantMat;
import entities.EtudiantClasse;
import entities.Filiere;
import entities.Niveau;
import entities.UeClasse;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Classe.class)
public class Classe_ { 

    public static volatile ListAttribute<Classe, EnseignantClasseJury> enseignantClasseJuryList;
    public static volatile SingularAttribute<Classe, Integer> idclasse;
    public static volatile ListAttribute<Classe, EnseignantMat> enseignantMatList;
    public static volatile ListAttribute<Classe, EtudiantClasse> etudiantClasseList;
    public static volatile ListAttribute<Classe, UeClasse> ueClasseList;
    public static volatile SingularAttribute<Classe, String> nom;
    public static volatile SingularAttribute<Classe, Niveau> niveau;
    public static volatile SingularAttribute<Classe, Filiere> idfiliere;

}