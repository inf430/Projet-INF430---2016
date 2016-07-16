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
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "etudiant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Etudiant.findAll", query = "SELECT e FROM Etudiant e"),
    @NamedQuery(name = "Etudiant.findByMatriculeetudiant", query = "SELECT e FROM Etudiant e WHERE e.matriculeetudiant = :matriculeetudiant")})
public class Etudiant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "matriculeetudiant")
    private String matriculeetudiant;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeetudiant")
    private List<Requeteenseignant> requeteenseignantList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeetudiant")
    private List<DroitRole> droitRoleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeetudiant")
    private List<EtudiantExam> etudiantExamList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeetudiant")
    private List<EtablirDroit> etablirDroitList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeetudiant")
    private List<Inscription> inscriptionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeetudiant")
    private List<EtudiantClasse> etudiantClasseList;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @OneToOne(optional = false)
    private Personne idpersonne;

    public Etudiant() {
    }

    public Etudiant(String matriculeetudiant) {
        this.matriculeetudiant = matriculeetudiant;
    }

    public String getMatriculeetudiant() {
        return matriculeetudiant;
    }

    public void setMatriculeetudiant(String matriculeetudiant) {
        this.matriculeetudiant = matriculeetudiant;
    }

    @XmlTransient
    public List<Requeteenseignant> getRequeteenseignantList() {
        return requeteenseignantList;
    }

    public void setRequeteenseignantList(List<Requeteenseignant> requeteenseignantList) {
        this.requeteenseignantList = requeteenseignantList;
    }

    @XmlTransient
    public List<DroitRole> getDroitRoleList() {
        return droitRoleList;
    }

    public void setDroitRoleList(List<DroitRole> droitRoleList) {
        this.droitRoleList = droitRoleList;
    }

    @XmlTransient
    public List<EtudiantExam> getEtudiantExamList() {
        return etudiantExamList;
    }

    public void setEtudiantExamList(List<EtudiantExam> etudiantExamList) {
        this.etudiantExamList = etudiantExamList;
    }

    @XmlTransient
    public List<EtablirDroit> getEtablirDroitList() {
        return etablirDroitList;
    }

    public void setEtablirDroitList(List<EtablirDroit> etablirDroitList) {
        this.etablirDroitList = etablirDroitList;
    }

    @XmlTransient
    public List<Inscription> getInscriptionList() {
        return inscriptionList;
    }

    public void setInscriptionList(List<Inscription> inscriptionList) {
        this.inscriptionList = inscriptionList;
    }

    @XmlTransient
    public List<EtudiantClasse> getEtudiantClasseList() {
        return etudiantClasseList;
    }

    public void setEtudiantClasseList(List<EtudiantClasse> etudiantClasseList) {
        this.etudiantClasseList = etudiantClasseList;
    }

    public Personne getIdpersonne() {
        return idpersonne;
    }

    public void setIdpersonne(Personne idpersonne) {
        this.idpersonne = idpersonne;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (matriculeetudiant != null ? matriculeetudiant.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Etudiant)) {
            return false;
        }
        Etudiant other = (Etudiant) object;
        if ((this.matriculeetudiant == null && other.matriculeetudiant != null) || (this.matriculeetudiant != null && !this.matriculeetudiant.equals(other.matriculeetudiant))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Etudiant[ matriculeetudiant=" + matriculeetudiant + " ]";
    }
    
}
