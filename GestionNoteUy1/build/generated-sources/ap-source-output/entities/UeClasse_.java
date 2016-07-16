package entities;

import entities.AnneeAcademique;
import entities.Classe;
import entities.Ue;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(UeClasse.class)
public class UeClasse_ { 

    public static volatile SingularAttribute<UeClasse, Integer> idueclasse;
    public static volatile SingularAttribute<UeClasse, Classe> idclasse;
    public static volatile SingularAttribute<UeClasse, Ue> code;
    public static volatile SingularAttribute<UeClasse, AnneeAcademique> annee;

}