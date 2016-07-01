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
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "etudiant_classe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EtudiantClasse.findAll", query = "SELECT e FROM EtudiantClasse e"),
    @NamedQuery(name = "EtudiantClasse.findByIdetudiantclasse", query = "SELECT e FROM EtudiantClasse e WHERE e.idetudiantclasse = :idetudiantclasse")})
public class EtudiantClasse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idetudiantclasse")
    private Integer idetudiantclasse;
    @JoinColumn(name = "matricule", referencedColumnName = "matricule")
    @ManyToOne(optional = false)
    private Etudiant matricule;
    @JoinColumn(name = "idclasse", referencedColumnName = "idclasse")
    @ManyToOne(optional = false)
    private Classe idclasse;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public EtudiantClasse() {
    }

    public EtudiantClasse(Integer idetudiantclasse) {
        this.idetudiantclasse = idetudiantclasse;
    }

    public Integer getIdetudiantclasse() {
        return idetudiantclasse;
    }

    public void setIdetudiantclasse(Integer idetudiantclasse) {
        this.idetudiantclasse = idetudiantclasse;
    }

    public Etudiant getMatricule() {
        return matricule;
    }

    public void setMatricule(Etudiant matricule) {
        this.matricule = matricule;
    }

    public Classe getIdclasse() {
        return idclasse;
    }

    public void setIdclasse(Classe idclasse) {
        this.idclasse = idclasse;
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
        hash += (idetudiantclasse != null ? idetudiantclasse.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EtudiantClasse)) {
            return false;
        }
        EtudiantClasse other = (EtudiantClasse) object;
        if ((this.idetudiantclasse == null && other.idetudiantclasse != null) || (this.idetudiantclasse != null && !this.idetudiantclasse.equals(other.idetudiantclasse))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.EtudiantClasse[ idetudiantclasse=" + idetudiantclasse + " ]";
    }
    
}
