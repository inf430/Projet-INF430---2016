/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "enseignant_classe_jury")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EnseignantClasseJury.findAll", query = "SELECT e FROM EnseignantClasseJury e"),
    @NamedQuery(name = "EnseignantClasseJury.findByIdenseignantclassejury", query = "SELECT e FROM EnseignantClasseJury e WHERE e.idenseignantclassejury = :idenseignantclassejury")})
public class EnseignantClasseJury implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idenseignantclassejury")
    private Integer idenseignantclassejury;
    @JoinColumn(name = "matriculeenseignant", referencedColumnName = "matriculeenseignant")
    @ManyToOne(optional = false)
    private Enseignant matriculeenseignant;
    @JoinColumn(name = "idclasse", referencedColumnName = "idclasse")
    @ManyToOne(optional = false)
    private Classe idclasse;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public EnseignantClasseJury() {
    }

    public EnseignantClasseJury(Integer idenseignantclassejury) {
        this.idenseignantclassejury = idenseignantclassejury;
    }

    public Integer getIdenseignantclassejury() {
        return idenseignantclassejury;
    }

    public void setIdenseignantclassejury(Integer idenseignantclassejury) {
        this.idenseignantclassejury = idenseignantclassejury;
    }

    public Enseignant getMatriculeenseignant() {
        return matriculeenseignant;
    }

    public void setMatriculeenseignant(Enseignant matriculeenseignant) {
        this.matriculeenseignant = matriculeenseignant;
    }

    public Classe getIdclasse() {
        return idclasse;
    }

    public void setIdclasse(Classe idclasse) {
        this.idclasse = idclasse;
    }

    public AnneeAcademique getAnnee() {
        return annee;
    }

    public void setAnnee(AnneeAcademique annee) {
        this.annee = annee;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idenseignantclassejury != null ? idenseignantclassejury.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EnseignantClasseJury)) {
            return false;
        }
        EnseignantClasseJury other = (EnseignantClasseJury) object;
        if ((this.idenseignantclassejury == null && other.idenseignantclassejury != null) || (this.idenseignantclassejury != null && !this.idenseignantclassejury.equals(other.idenseignantclassejury))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.EnseignantClasseJury[ idenseignantclassejury=" + idenseignantclassejury + " ]";
    }
    
}
