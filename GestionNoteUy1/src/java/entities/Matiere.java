/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "matiere")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Matiere.findAll", query = "SELECT m FROM Matiere m"),
    @NamedQuery(name = "Matiere.findByIdmatiere", query = "SELECT m FROM Matiere m WHERE m.idmatiere = :idmatiere"),
    @NamedQuery(name = "Matiere.findByCode", query = "SELECT m FROM Matiere m WHERE m.code = :code"),
    @NamedQuery(name = "Matiere.findByLibelle", query = "SELECT m FROM Matiere m WHERE m.libelle = :libelle")})
public class Matiere implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmatiere")
    private Integer idmatiere;
    @Size(max = 30)
    @Column(name = "code")
    private String code;
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private Collection<EnseignantMat> enseignantMatCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private Collection<MatiereUe> matiereUeCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private Collection<Inscription> inscriptionCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private Collection<MatiereExam> matiereExamCollection;

    public Matiere() {
    }

    public Matiere(Integer idmatiere) {
        this.idmatiere = idmatiere;
    }

    public Integer getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(Integer idmatiere) {
        this.idmatiere = idmatiere;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    @XmlTransient
    public Collection<EnseignantMat> getEnseignantMatCollection() {
        return enseignantMatCollection;
    }

    public void setEnseignantMatCollection(Collection<EnseignantMat> enseignantMatCollection) {
        this.enseignantMatCollection = enseignantMatCollection;
    }

    @XmlTransient
    public Collection<MatiereUe> getMatiereUeCollection() {
        return matiereUeCollection;
    }

    public void setMatiereUeCollection(Collection<MatiereUe> matiereUeCollection) {
        this.matiereUeCollection = matiereUeCollection;
    }

    @XmlTransient
    public Collection<Inscription> getInscriptionCollection() {
        return inscriptionCollection;
    }

    public void setInscriptionCollection(Collection<Inscription> inscriptionCollection) {
        this.inscriptionCollection = inscriptionCollection;
    }

    @XmlTransient
    public Collection<MatiereExam> getMatiereExamCollection() {
        return matiereExamCollection;
    }

    public void setMatiereExamCollection(Collection<MatiereExam> matiereExamCollection) {
        this.matiereExamCollection = matiereExamCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmatiere != null ? idmatiere.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Matiere)) {
            return false;
        }
        Matiere other = (Matiere) object;
        if ((this.idmatiere == null && other.idmatiere != null) || (this.idmatiere != null && !this.idmatiere.equals(other.idmatiere))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Matiere[ idmatiere=" + idmatiere + " ]";
    }
    
}
