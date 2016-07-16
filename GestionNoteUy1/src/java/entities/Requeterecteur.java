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
@Table(name = "requeterecteur")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requeterecteur.findAll", query = "SELECT r FROM Requeterecteur r"),
    @NamedQuery(name = "Requeterecteur.findByTyperequeterecteur", query = "SELECT r FROM Requeterecteur r WHERE r.typerequeterecteur = :typerequeterecteur"),
    @NamedQuery(name = "Requeterecteur.findByValeur", query = "SELECT r FROM Requeterecteur r WHERE r.valeur = :valeur"),
    @NamedQuery(name = "Requeterecteur.findByIdrequeterecteur", query = "SELECT r FROM Requeterecteur r WHERE r.idrequeterecteur = :idrequeterecteur")})
public class Requeterecteur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 128)
    @Column(name = "typerequeterecteur")
    private String typerequeterecteur;
    @Size(max = 128)
    @Column(name = "valeur")
    private String valeur;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idrequeterecteur")
    private Integer idrequeterecteur;

    public Requeterecteur() {
    }

    public Requeterecteur(Integer idrequeterecteur) {
        this.idrequeterecteur = idrequeterecteur;
    }

    public String getTyperequeterecteur() {
        return typerequeterecteur;
    }

    public void setTyperequeterecteur(String typerequeterecteur) {
        this.typerequeterecteur = typerequeterecteur;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    public Integer getIdrequeterecteur() {
        return idrequeterecteur;
    }

    public void setIdrequeterecteur(Integer idrequeterecteur) {
        this.idrequeterecteur = idrequeterecteur;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrequeterecteur != null ? idrequeterecteur.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requeterecteur)) {
            return false;
        }
        Requeterecteur other = (Requeterecteur) object;
        if ((this.idrequeterecteur == null && other.idrequeterecteur != null) || (this.idrequeterecteur != null && !this.idrequeterecteur.equals(other.idrequeterecteur))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requeterecteur[ idrequeterecteur=" + idrequeterecteur + " ]";
    }
    
}
