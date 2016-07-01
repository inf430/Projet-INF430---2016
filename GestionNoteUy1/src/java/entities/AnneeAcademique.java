/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
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
    private List<EnseignantMat> enseignantMatList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<MatiereUe> matiereUeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<Semestre> semestreList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<EnseignantChefDepartement> enseignantChefDepartementList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<EnseignantClasseJury> enseignantClasseJuryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<EtudiantExam> etudiantExamList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<Inscription> inscriptionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<MatiereExam> matiereExamList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<EtudiantClasse> etudiantClasseList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "annee")
    private List<UeClasse> ueClasseList;

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
    public List<EnseignantMat> getEnseignantMatList() {
        return enseignantMatList;
    }

    public void setEnseignantMatList(List<EnseignantMat> enseignantMatList) {
        this.enseignantMatList = enseignantMatList;
    }

    @XmlTransient
    public List<MatiereUe> getMatiereUeList() {
        return matiereUeList;
    }

    public void setMatiereUeList(List<MatiereUe> matiereUeList) {
        this.matiereUeList = matiereUeList;
    }

    @XmlTransient
    public List<Semestre> getSemestreList() {
        return semestreList;
    }

    public void setSemestreList(List<Semestre> semestreList) {
        this.semestreList = semestreList;
    }

    @XmlTransient
    public List<EnseignantChefDepartement> getEnseignantChefDepartementList() {
        return enseignantChefDepartementList;
    }

    public void setEnseignantChefDepartementList(List<EnseignantChefDepartement> enseignantChefDepartementList) {
        this.enseignantChefDepartementList = enseignantChefDepartementList;
    }

    @XmlTransient
    public List<EnseignantClasseJury> getEnseignantClasseJuryList() {
        return enseignantClasseJuryList;
    }

    public void setEnseignantClasseJuryList(List<EnseignantClasseJury> enseignantClasseJuryList) {
        this.enseignantClasseJuryList = enseignantClasseJuryList;
    }

    @XmlTransient
    public List<EtudiantExam> getEtudiantExamList() {
        return etudiantExamList;
    }

    public void setEtudiantExamList(List<EtudiantExam> etudiantExamList) {
        this.etudiantExamList = etudiantExamList;
    }

    @XmlTransient
    public List<Inscription> getInscriptionList() {
        return inscriptionList;
    }

    public void setInscriptionList(List<Inscription> inscriptionList) {
        this.inscriptionList = inscriptionList;
    }

    @XmlTransient
    public List<MatiereExam> getMatiereExamList() {
        return matiereExamList;
    }

    public void setMatiereExamList(List<MatiereExam> matiereExamList) {
        this.matiereExamList = matiereExamList;
    }

    @XmlTransient
    public List<EtudiantClasse> getEtudiantClasseList() {
        return etudiantClasseList;
    }

    public void setEtudiantClasseList(List<EtudiantClasse> etudiantClasseList) {
        this.etudiantClasseList = etudiantClasseList;
    }

    @XmlTransient
    public List<UeClasse> getUeClasseList() {
        return ueClasseList;
    }

    public void setUeClasseList(List<UeClasse> ueClasseList) {
        this.ueClasseList = ueClasseList;
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
