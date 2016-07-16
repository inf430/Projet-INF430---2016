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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "recteur")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Recteur.findAll", query = "SELECT r FROM Recteur r"),
    @NamedQuery(name = "Recteur.findByMatriculerecteur", query = "SELECT r FROM Recteur r WHERE r.matriculerecteur = :matriculerecteur"),
    @NamedQuery(name = "Recteur.findByDatearrive", query = "SELECT r FROM Recteur r WHERE r.datearrive = :datearrive"),
    @NamedQuery(name = "Recteur.findByDatedepart", query = "SELECT r FROM Recteur r WHERE r.datedepart = :datedepart")})
public class Recteur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "matriculerecteur")
    private String matriculerecteur;
    @Column(name = "datearrive")
    @Temporal(TemporalType.DATE)
    private Date datearrive;
    @Column(name = "datedepart")
    @Temporal(TemporalType.DATE)
    private Date datedepart;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @OneToOne(optional = false)
    private Personne idpersonne;

    public Recteur() {
    }

    public Recteur(String matriculerecteur) {
        this.matriculerecteur = matriculerecteur;
    }

    public String getMatriculerecteur() {
        return matriculerecteur;
    }

    public void setMatriculerecteur(String matriculerecteur) {
        this.matriculerecteur = matriculerecteur;
    }

    public Date getDatearrive() {
        return datearrive;
    }

    public void setDatearrive(Date datearrive) {
        this.datearrive = datearrive;
    }

    public Date getDatedepart() {
        return datedepart;
    }

    public void setDatedepart(Date datedepart) {
        this.datedepart = datedepart;
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
        hash += (matriculerecteur != null ? matriculerecteur.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Recteur)) {
            return false;
        }
        Recteur other = (Recteur) object;
        if ((this.matriculerecteur == null && other.matriculerecteur != null) || (this.matriculerecteur != null && !this.matriculerecteur.equals(other.matriculerecteur))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Recteur[ matriculerecteur=" + matriculerecteur + " ]";
    }
    
}
