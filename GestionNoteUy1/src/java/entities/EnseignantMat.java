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
@Table(name = "enseignant_mat")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EnseignantMat.findAll", query = "SELECT e FROM EnseignantMat e"),
    @NamedQuery(name = "EnseignantMat.findByIdenseignantmat", query = "SELECT e FROM EnseignantMat e WHERE e.idenseignantmat = :idenseignantmat")})
public class EnseignantMat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idenseignantmat")
    private Integer idenseignantmat;
    @JoinColumn(name = "idmatiere", referencedColumnName = "idmatiere")
    @ManyToOne(optional = false)
    private Matiere idmatiere;
    @JoinColumn(name = "matricule", referencedColumnName = "matricule")
    @ManyToOne(optional = false)
    private Enseignant matricule;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public EnseignantMat() {
    }

    public EnseignantMat(Integer idenseignantmat) {
        this.idenseignantmat = idenseignantmat;
    }

    public Integer getIdenseignantmat() {
        return idenseignantmat;
    }

    public void setIdenseignantmat(Integer idenseignantmat) {
        this.idenseignantmat = idenseignantmat;
    }

    public Matiere getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(Matiere idmatiere) {
        this.idmatiere = idmatiere;
    }

    public Enseignant getMatricule() {
        return matricule;
    }

    public void setMatricule(Enseignant matricule) {
        this.matricule = matricule;
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
        hash += (idenseignantmat != null ? idenseignantmat.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EnseignantMat)) {
            return false;
        }
        EnseignantMat other = (EnseignantMat) object;
        if ((this.idenseignantmat == null && other.idenseignantmat != null) || (this.idenseignantmat != null && !this.idenseignantmat.equals(other.idenseignantmat))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.EnseignantMat[ idenseignantmat=" + idenseignantmat + " ]";
    }
    
}
