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
@Table(name = "enseignant_chef_departement")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EnseignantChefDepartement.findAll", query = "SELECT e FROM EnseignantChefDepartement e"),
    @NamedQuery(name = "EnseignantChefDepartement.findByIdenseignantchefdepartement", query = "SELECT e FROM EnseignantChefDepartement e WHERE e.idenseignantchefdepartement = :idenseignantchefdepartement")})
public class EnseignantChefDepartement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idenseignantchefdepartement")
    private Integer idenseignantchefdepartement;
    @JoinColumn(name = "matricule", referencedColumnName = "matricule")
    @ManyToOne(optional = false)
    private Enseignant matricule;
    @JoinColumn(name = "iddepartement", referencedColumnName = "iddepartement")
    @ManyToOne(optional = false)
    private Departement iddepartement;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public EnseignantChefDepartement() {
    }

    public EnseignantChefDepartement(Integer idenseignantchefdepartement) {
        this.idenseignantchefdepartement = idenseignantchefdepartement;
    }

    public Integer getIdenseignantchefdepartement() {
        return idenseignantchefdepartement;
    }

    public void setIdenseignantchefdepartement(Integer idenseignantchefdepartement) {
        this.idenseignantchefdepartement = idenseignantchefdepartement;
    }

    public Enseignant getMatricule() {
        return matricule;
    }

    public void setMatricule(Enseignant matricule) {
        this.matricule = matricule;
    }

    public Departement getIddepartement() {
        return iddepartement;
    }

    public void setIddepartement(Departement iddepartement) {
        this.iddepartement = iddepartement;
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
        hash += (idenseignantchefdepartement != null ? idenseignantchefdepartement.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EnseignantChefDepartement)) {
            return false;
        }
        EnseignantChefDepartement other = (EnseignantChefDepartement) object;
        if ((this.idenseignantchefdepartement == null && other.idenseignantchefdepartement != null) || (this.idenseignantchefdepartement != null && !this.idenseignantchefdepartement.equals(other.idenseignantchefdepartement))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.EnseignantChefDepartement[ idenseignantchefdepartement=" + idenseignantchefdepartement + " ]";
    }
    
}
