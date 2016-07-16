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
@Table(name = "requetematiere")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requetematiere.findAll", query = "SELECT r FROM Requetematiere r"),
    @NamedQuery(name = "Requetematiere.findByTypeexamen", query = "SELECT r FROM Requetematiere r WHERE r.typeexamen = :typeexamen"),
    @NamedQuery(name = "Requetematiere.findByIdrequetematiere", query = "SELECT r FROM Requetematiere r WHERE r.idrequetematiere = :idrequetematiere")})
public class Requetematiere implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 128)
    @Column(name = "typeexamen")
    private String typeexamen;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idrequetematiere")
    private Integer idrequetematiere;
    @JoinColumn(name = "idrequete", referencedColumnName = "idrequete")
    @ManyToOne(optional = false)
    private Requete idrequete;
    @JoinColumn(name = "idmatiere", referencedColumnName = "idmatiere")
    @ManyToOne(optional = false)
    private Matiere idmatiere;

    public Requetematiere() {
    }

    public Requetematiere(Integer idrequetematiere) {
        this.idrequetematiere = idrequetematiere;
    }

    public String getTypeexamen() {
        return typeexamen;
    }

    public void setTypeexamen(String typeexamen) {
        this.typeexamen = typeexamen;
    }

    public Integer getIdrequetematiere() {
        return idrequetematiere;
    }

    public void setIdrequetematiere(Integer idrequetematiere) {
        this.idrequetematiere = idrequetematiere;
    }

    public Requete getIdrequete() {
        return idrequete;
    }

    public void setIdrequete(Requete idrequete) {
        this.idrequete = idrequete;
    }

    public Matiere getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(Matiere idmatiere) {
        this.idmatiere = idmatiere;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrequetematiere != null ? idrequetematiere.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requetematiere)) {
            return false;
        }
        Requetematiere other = (Requetematiere) object;
        if ((this.idrequetematiere == null && other.idrequetematiere != null) || (this.idrequetematiere != null && !this.idrequetematiere.equals(other.idrequetematiere))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requetematiere[ idrequetematiere=" + idrequetematiere + " ]";
    }
    
}
