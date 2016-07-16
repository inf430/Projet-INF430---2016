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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "interdit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Interdit.findAll", query = "SELECT i FROM Interdit i"),
    @NamedQuery(name = "Interdit.findByIdinterdit", query = "SELECT i FROM Interdit i WHERE i.idinterdit = :idinterdit")})
public class Interdit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idinterdit")
    private Integer idinterdit;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @ManyToOne(optional = false)
    private Personne idpersonne;
    @JoinColumn(name = "iddroit", referencedColumnName = "iddroit")
    @ManyToOne(optional = false)
    private Droit iddroit;

    public Interdit() {
    }

    public Interdit(Integer idinterdit) {
        this.idinterdit = idinterdit;
    }

    public Integer getIdinterdit() {
        return idinterdit;
    }

    public void setIdinterdit(Integer idinterdit) {
        this.idinterdit = idinterdit;
    }

    public Personne getIdpersonne() {
        return idpersonne;
    }

    public void setIdpersonne(Personne idpersonne) {
        this.idpersonne = idpersonne;
    }

    public Droit getIddroit() {
        return iddroit;
    }

    public void setIddroit(Droit iddroit) {
        this.iddroit = iddroit;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idinterdit != null ? idinterdit.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Interdit)) {
            return false;
        }
        Interdit other = (Interdit) object;
        if ((this.idinterdit == null && other.idinterdit != null) || (this.idinterdit != null && !this.idinterdit.equals(other.idinterdit))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Interdit[ idinterdit=" + idinterdit + " ]";
    }
    
}
