/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "annee_academique")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AnneeAcademique.findAll", query = "SELECT a FROM AnneeAcademique a"),
    @NamedQuery(name = "AnneeAcademique.findByAnnee", query = "SELECT a FROM AnneeAcademique a WHERE a.annee = :annee"),
    @NamedQuery(name = "AnneeAcademique.findByEtat", query = "SELECT a FROM AnneeAcademique a WHERE a.etat = :etat")})
public class AnneeAcademique implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "annee")
    private String annee;
    @Size(max = 30)
    @Column(name = "etat")
    private String etat;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<EnseignantMat> enseignantMatCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<MatiereUe> matiereUeCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<Semestre> semestreCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<EnseignantChefDepartement> enseignantChefDepartementCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<EnseignantClasseJury> enseignantClasseJuryCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<EtudiantExam> etudiantExamCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<Inscription> inscriptionCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<MatiereExam> matiereExamCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<EtudiantClasse> etudiantClasseCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private Collection<UeClasse> ueClasseCollection;

    public AnneeAcademique() {
    }

    public AnneeAcademique(String annee) {
        this.annee = annee;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    @XmlTransient
    public Collection<EnseignantMat> getEnseignantMatCollection() {
        return enseignantMatCollection;
    }

    public void setEnseignantMatCollection(Collection<EnseignantMat> enseignantMatCollection) {
        this.enseignantMatCollection = enseignantMatCollection;
    }

    @XmlTransient
    public Collection<MatiereUe> getMatiereUeCollection() {
        return matiereUeCollection;
    }

    public void setMatiereUeCollection(Collection<MatiereUe> matiereUeCollection) {
        this.matiereUeCollection = matiereUeCollection;
    }

    @XmlTransient
    public Collection<Semestre> getSemestreCollection() {
        return semestreCollection;
    }

    public void setSemestreCollection(Collection<Semestre> semestreCollection) {
        this.semestreCollection = semestreCollection;
    }

    @XmlTransient
    public Collection<EnseignantChefDepartement> getEnseignantChefDepartementCollection() {
        return enseignantChefDepartementCollection;
    }

    public void setEnseignantChefDepartementCollection(Collection<EnseignantChefDepartement> enseignantChefDepartementCollection) {
        this.enseignantChefDepartementCollection = enseignantChefDepartementCollection;
    }

    @XmlTransient
    public Collection<EnseignantClasseJury> getEnseignantClasseJuryCollection() {
        return enseignantClasseJuryCollection;
    }

    public void setEnseignantClasseJuryCollection(Collection<EnseignantClasseJury> enseignantClasseJuryCollection) {
        this.enseignantClasseJuryCollection = enseignantClasseJuryCollection;
    }

    @XmlTransient
    public Collection<EtudiantExam> getEtudiantExamCollection() {
        return etudiantExamCollection;
    }

    public void setEtudiantExamCollection(Collection<EtudiantExam> etudiantExamCollection) {
        this.etudiantExamCollection = etudiantExamCollection;
    }

    @XmlTransient
    public Collection<Inscription> getInscriptionCollection() {
        return inscriptionCollection;
    }

    public void setInscriptionCollection(Collection<Inscription> inscriptionCollection) {
        this.inscriptionCollection = inscriptionCollection;
    }

    @XmlTransient
    public Collection<MatiereExam> getMatiereExamCollection() {
        return matiereExamCollection;
    }

    public void setMatiereExamCollection(Collection<MatiereExam> matiereExamCollection) {
        this.matiereExamCollection = matiereExamCollection;
    }

    @XmlTransient
    public Collection<EtudiantClasse> getEtudiantClasseCollection() {
        return etudiantClasseCollection;
    }

    public void setEtudiantClasseCollection(Collection<EtudiantClasse> etudiantClasseCollection) {
        this.etudiantClasseCollection = etudiantClasseCollection;
    }

    @XmlTransient
    public Collection<UeClasse> getUeClasseCollection() {
        return ueClasseCollection;
    }

    public void setUeClasseCollection(Collection<UeClasse> ueClasseCollection) {
        this.ueClasseCollection = ueClasseCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (annee != null ? annee.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AnneeAcademique)) {
            return false;
        }
        AnneeAcademique other = (AnneeAcademique) object;
        if ((this.annee == null && other.annee != null) || (this.annee != null && !this.annee.equals(other.annee))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.AnneeAcademique[ annee=" + annee + " ]";
    }
    
}
