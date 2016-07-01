/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "requete")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requete.findAll", query = "SELECT r FROM Requete r"),
    @NamedQuery(name = "Requete.findByIdrequete", query = "SELECT r FROM Requete r WHERE r.idrequete = :idrequete"),
    @NamedQuery(name = "Requete.findByObjet", query = "SELECT r FROM Requete r WHERE r.objet = :objet"),
    @NamedQuery(name = "Requete.findByDate", query = "SELECT r FROM Requete r WHERE r.date = :date"),
    @NamedQuery(name = "Requete.findByEtat", query = "SELECT r FROM Requete r WHERE r.etat = :etat")})
public class Requete implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrequete")
    private Integer idrequete;
    @Size(max = 2147483647)
    @Column(name = "objet")
    private String objet;
    @Size(max = 10)
    @Column(name = "date")
    private String date;
    @Size(max = 30)
    @Column(name = "etat")
    private String etat;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "idrequete")
    private Reponse reponse;
    @JoinColumn(name = "matricule", referencedColumnName = "matricule")
    @ManyToOne(optional = false)
    private Etudiant matricule;

    public Requete() {
    }

    public Requete(Integer idrequete) {
        this.idrequete = idrequete;
    }

    public Integer getIdrequete() {
        return idrequete;
    }

    public void setIdrequete(Integer idrequete) {
        this.idrequete = idrequete;
    }

    public String getObjet() {
        return objet;
    }

    public void setObjet(String objet) {
        this.objet = objet;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public Reponse getReponse() {
        return reponse;
    }

    public void setReponse(Reponse reponse) {
        this.reponse = reponse;
    }

    public Etudiant getMatricule() {
        return matricule;
    }

    public void setMatricule(Etudiant matricule) {
        this.matricule = matricule;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrequete != null ? idrequete.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requete)) {
            return false;
        }
        Requete other = (Requete) object;
        if ((this.idrequete == null && other.idrequete != null) || (this.idrequete != null && !this.idrequete.equals(other.idrequete))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requete[ idrequete=" + idrequete + " ]";
    }
    
}
