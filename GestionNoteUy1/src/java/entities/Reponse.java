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
import javax.persistence.OneToOne;
import javax.persistence.Table;
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
    @NamedQuery(name = "Reponse.findByDate", query = "SELECT r FROM Reponse r WHERE r.date = :date"),
    @NamedQuery(name = "Reponse.findByContenu", query = "SELECT r FROM Reponse r WHERE r.contenu = :contenu")})
public class Reponse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idreponse")
    private Integer idreponse;
    @Size(max = 10)
    @Column(name = "date")
    private String date;
    @Size(max = 2147483647)
    @Column(name = "contenu")
    private String contenu;
    @JoinColumn(name = "idrequete", referencedColumnName = "idrequete")
    @OneToOne(optional = false)
    private Requete idrequete;
    @JoinColumn(name = "matricule", referencedColumnName = "matricule")
    @ManyToOne(optional = false)
    private Enseignant matricule;

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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public Requete getIdrequete() {
        return idrequete;
    }

    public void setIdrequete(Requete idrequete) {
        this.idrequete = idrequete;
    }

    public Enseignant getMatricule() {
        return matricule;
    }

    public void setMatricule(Enseignant matricule) {
        this.matricule = matricule;
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
