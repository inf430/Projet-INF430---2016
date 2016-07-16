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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "requetedecanat")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requetedecanat.findAll", query = "SELECT r FROM Requetedecanat r"),
    @NamedQuery(name = "Requetedecanat.findByCible", query = "SELECT r FROM Requetedecanat r WHERE r.cible = :cible"),
    @NamedQuery(name = "Requetedecanat.findByIdvaleur", query = "SELECT r FROM Requetedecanat r WHERE r.idvaleur = :idvaleur"),
    @NamedQuery(name = "Requetedecanat.findByIdrequetedecanat", query = "SELECT r FROM Requetedecanat r WHERE r.idrequetedecanat = :idrequetedecanat")})
public class Requetedecanat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 128)
    @Column(name = "cible")
    private String cible;
    @Column(name = "idvaleur")
    private Integer idvaleur;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idrequetedecanat")
    private Integer idrequetedecanat;
    @JoinColumn(name = "idrequete", referencedColumnName = "idrequete")
    @ManyToOne(optional = false)
    private Requete idrequete;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public Requetedecanat() {
    }

    public Requetedecanat(Integer idrequetedecanat) {
        this.idrequetedecanat = idrequetedecanat;
    }

    public String getCible() {
        return cible;
    }

    public void setCible(String cible) {
        this.cible = cible;
    }

    public Integer getIdvaleur() {
        return idvaleur;
    }

    public void setIdvaleur(Integer idvaleur) {
        this.idvaleur = idvaleur;
    }

    public Integer getIdrequetedecanat() {
        return idrequetedecanat;
    }

    public void setIdrequetedecanat(Integer idrequetedecanat) {
        this.idrequetedecanat = idrequetedecanat;
    }

    public Requete getIdrequete() {
        return idrequete;
    }

    public void setIdrequete(Requete idrequete) {
        this.idrequete = idrequete;
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
        hash += (idrequetedecanat != null ? idrequetedecanat.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requetedecanat)) {
            return false;
        }
        Requetedecanat other = (Requetedecanat) object;
        if ((this.idrequetedecanat == null && other.idrequetedecanat != null) || (this.idrequetedecanat != null && !this.idrequetedecanat.equals(other.idrequetedecanat))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requetedecanat[ idrequetedecanat=" + idrequetedecanat + " ]";
    }
    
}
