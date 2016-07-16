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
@Table(name = "requetejury")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requetejury.findAll", query = "SELECT r FROM Requetejury r"),
    @NamedQuery(name = "Requetejury.findByIdrequetejury", query = "SELECT r FROM Requetejury r WHERE r.idrequetejury = :idrequetejury")})
public class Requetejury implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "idrequetejury")
    private String idrequetejury;
    @JoinColumn(name = "idrequete", referencedColumnName = "idrequete")
    @ManyToOne(optional = false)
    private Requete idrequete;
    @JoinColumn(name = "idclasse", referencedColumnName = "idclasse")
    @ManyToOne(optional = false)
    private Classe idclasse;

    public Requetejury() {
    }

    public Requetejury(String idrequetejury) {
        this.idrequetejury = idrequetejury;
    }

    public String getIdrequetejury() {
        return idrequetejury;
    }

    public void setIdrequetejury(String idrequetejury) {
        this.idrequetejury = idrequetejury;
    }

    public Requete getIdrequete() {
        return idrequete;
    }

    public void setIdrequete(Requete idrequete) {
        this.idrequete = idrequete;
    }

    public Classe getIdclasse() {
        return idclasse;
    }

    public void setIdclasse(Classe idclasse) {
        this.idclasse = idclasse;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrequetejury != null ? idrequetejury.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requetejury)) {
            return false;
        }
        Requetejury other = (Requetejury) object;
        if ((this.idrequetejury == null && other.idrequetejury != null) || (this.idrequetejury != null && !this.idrequetejury.equals(other.idrequetejury))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requetejury[ idrequetejury=" + idrequetejury + " ]";
    }
    
}
