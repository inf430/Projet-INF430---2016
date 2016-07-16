/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "reponse")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reponse.findAll", query = "SELECT r FROM Reponse r"),
    @NamedQuery(name = "Reponse.findByIdreponse", query = "SELECT r FROM Reponse r WHERE r.idreponse = :idreponse"),
    @NamedQuery(name = "Reponse.findByDatereponse", query = "SELECT r FROM Reponse r WHERE r.datereponse = :datereponse"),
    @NamedQuery(name = "Reponse.findByDecision", query = "SELECT r FROM Reponse r WHERE r.decision = :decision")})
public class Reponse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idreponse")
    private Integer idreponse;
    @Column(name = "datereponse")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datereponse;
    @Size(max = 2147483647)
    @Column(name = "decision")
    private String decision;
    @JoinColumn(name = "idrequete", referencedColumnName = "idrequete")
    @ManyToOne(optional = false)
    private Requete idrequete;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @ManyToOne(optional = false)
    private Personne idpersonne;

    public Reponse() {
    }

    public Reponse(Integer idreponse) {
        this.idreponse = idreponse;
    }

    public Integer getIdreponse() {
        return idreponse;
    }

    public void setIdreponse(Integer idreponse) {
        this.idreponse = idreponse;
    }

    public Date getDatereponse() {
        return datereponse;
    }

    public void setDatereponse(Date datereponse) {
        this.datereponse = datereponse;
    }

    public String getDecision() {
        return decision;
    }

    public void setDecision(String decision) {
        this.decision = decision;
    }

    public Requete getIdrequete() {
        return idrequete;
    }

    public void setIdrequete(Requete idrequete) {
        this.idrequete = idrequete;
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
        hash += (idreponse != null ? idreponse.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reponse)) {
            return false;
        }
        Reponse other = (Reponse) object;
        if ((this.idreponse == null && other.idreponse != null) || (this.idreponse != null && !this.idreponse.equals(other.idreponse))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Reponse[ idreponse=" + idreponse + " ]";
    }
    
}
