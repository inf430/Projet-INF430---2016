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
    @Size(min = 1, max = 255)
    @Column(name = "matricule")
    private String matricule;
    @JoinTable(name = "roleetudiant", joinColumns = {
        @JoinColumn(name = "matricule", referencedColumnName = "matricule")}, inverseJoinColumns = {
        @JoinColumn(name = "idrole", referencedColumnName = "idrole")})
    @ManyToMany
    private Collection<Role> roleCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<Requete> requeteCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<EtudiantExam> etudiantExamCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<Inscription> inscriptionCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<EtudiantClasse> etudiantClasseCollection;
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
    public Collection<Role> getRoleCollection() {
        return roleCollection;
    }

    public void setRoleCollection(Collection<Role> roleCollection) {
        this.roleCollection = roleCollection;
    }

    @XmlTransient
    public Collection<Requete> getRequeteCollection() {
        return requeteCollection;
    }

    public void setRequeteCollection(Collection<Requete> requeteCollection) {
        this.requeteCollection = requeteCollection;
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
    public Collection<EtudiantClasse> getEtudiantClasseCollection() {
        return etudiantClasseCollection;
    }

    public void setEtudiantClasseCollection(Collection<EtudiantClasse> etudiantClasseCollection) {
        this.etudiantClasseCollection = etudiantClasseCollection;
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
