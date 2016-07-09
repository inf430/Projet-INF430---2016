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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
    @NamedQuery(name = "Etudiant.findByMatricule", query = "SELECT e FROM Etudiant e WHERE e.matricule = :matricule")})
public class Etudiant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "matricule")
    private String matricule;
    @JoinTable(name = "roleetudiant", joinColumns = {
        @JoinColumn(name = "matricule", referencedColumnName = "matricule")}, inverseJoinColumns = {
        @JoinColumn(name = "idrole", referencedColumnName = "idrole")})
    @ManyToMany
    private List<Role> roleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<Requete> requeteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<EtudiantExam> etudiantExamList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<Inscription> inscriptionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<EtudiantClasse> etudiantClasseList;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @OneToOne(optional = false)
    private Personne idpersonne;

    public Etudiant() {
    }

    public Etudiant(String matricule) {
        this.matricule = matricule;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    @XmlTransient
    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    @XmlTransient
    public List<Requete> getRequeteList() {
        return requeteList;
    }

    public void setRequeteList(List<Requete> requeteList) {
        this.requeteList = requeteList;
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
        hash += (matricule != null ? matricule.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Etudiant)) {
            return false;
        }
        Etudiant other = (Etudiant) object;
        if ((this.matricule == null && other.matricule != null) || (this.matricule != null && !this.matricule.equals(other.matricule))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Etudiant[ matricule=" + matricule + " ]";
    }
    
}
