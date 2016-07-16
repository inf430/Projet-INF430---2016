/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

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
    @NamedQuery(name = "Requete.findByObjetrequete", query = "SELECT r FROM Requete r WHERE r.objetrequete = :objetrequete"),
    @NamedQuery(name = "Requete.findByDaterequete", query = "SELECT r FROM Requete r WHERE r.daterequete = :daterequete"),
    @NamedQuery(name = "Requete.findByEtatrequete", query = "SELECT r FROM Requete r WHERE r.etatrequete = :etatrequete"),
    @NamedQuery(name = "Requete.findByContenu", query = "SELECT r FROM Requete r WHERE r.contenu = :contenu"),
    @NamedQuery(name = "Requete.findByPiecejointe", query = "SELECT r FROM Requete r WHERE r.piecejointe = :piecejointe"),
    @NamedQuery(name = "Requete.findByTyperequete", query = "SELECT r FROM Requete r WHERE r.typerequete = :typerequete")})
public class Requete implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrequete")
    private Integer idrequete;
    @Size(max = 2147483647)
    @Column(name = "objetrequete")
    private String objetrequete;
    @Column(name = "daterequete")
    @Temporal(TemporalType.TIMESTAMP)
    private Date daterequete;
    @Size(max = 30)
    @Column(name = "etatrequete")
    private String etatrequete;
    @Size(max = 2147483647)
    @Column(name = "contenu")
    private String contenu;
    @Size(max = 2147483647)
    @Column(name = "piecejointe")
    private String piecejointe;
    @Size(max = 128)
    @Column(name = "typerequete")
    private String typerequete;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idrequete")
    private List<Reponse> reponseList;
    @JoinColumn(name = "idreaueteenseignant", referencedColumnName = "idreaueteenseignant")
    @ManyToOne(optional = false)
    private Requeteenseignant idreaueteenseignant;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idrequete")
    private List<Requetedecanat> requetedecanatList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idrequete")
    private List<Requetematiere> requetematiereList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idrequete")
    private List<Requetejury> requetejuryList;

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

    public String getObjetrequete() {
        return objetrequete;
    }

    public void setObjetrequete(String objetrequete) {
        this.objetrequete = objetrequete;
    }

    public Date getDaterequete() {
        return daterequete;
    }

    public void setDaterequete(Date daterequete) {
        this.daterequete = daterequete;
    }

    public String getEtatrequete() {
        return etatrequete;
    }

    public void setEtatrequete(String etatrequete) {
        this.etatrequete = etatrequete;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public String getPiecejointe() {
        return piecejointe;
    }

    public void setPiecejointe(String piecejointe) {
        this.piecejointe = piecejointe;
    }

    public String getTyperequete() {
        return typerequete;
    }

    public void setTyperequete(String typerequete) {
        this.typerequete = typerequete;
    }

    @XmlTransient
    public List<Reponse> getReponseList() {
        return reponseList;
    }

    public void setReponseList(List<Reponse> reponseList) {
        this.reponseList = reponseList;
    }

    public Requeteenseignant getIdreaueteenseignant() {
        return idreaueteenseignant;
    }

    public void setIdreaueteenseignant(Requeteenseignant idreaueteenseignant) {
        this.idreaueteenseignant = idreaueteenseignant;
    }

    @XmlTransient
    public List<Requetedecanat> getRequetedecanatList() {
        return requetedecanatList;
    }

    public void setRequetedecanatList(List<Requetedecanat> requetedecanatList) {
        this.requetedecanatList = requetedecanatList;
    }

    @XmlTransient
    public List<Requetematiere> getRequetematiereList() {
        return requetematiereList;
    }

    public void setRequetematiereList(List<Requetematiere> requetematiereList) {
        this.requetematiereList = requetematiereList;
    }

    @XmlTransient
    public List<Requetejury> getRequetejuryList() {
        return requetejuryList;
    }

    public void setRequetejuryList(List<Requetejury> requetejuryList) {
        this.requetejuryList = requetejuryList;
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
