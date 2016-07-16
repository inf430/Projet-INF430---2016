/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "requeteenseignant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Requeteenseignant.findAll", query = "SELECT r FROM Requeteenseignant r"),
    @NamedQuery(name = "Requeteenseignant.findByTypeexamen", query = "SELECT r FROM Requeteenseignant r WHERE r.typeexamen = :typeexamen"),
    @NamedQuery(name = "Requeteenseignant.findByNote", query = "SELECT r FROM Requeteenseignant r WHERE r.note = :note"),
    @NamedQuery(name = "Requeteenseignant.findByIdreaueteenseignant", query = "SELECT r FROM Requeteenseignant r WHERE r.idreaueteenseignant = :idreaueteenseignant")})
public class Requeteenseignant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 128)
    @Column(name = "typeexamen")
    private String typeexamen;
    @Column(name = "note")
    private Integer note;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idreaueteenseignant")
    private Integer idreaueteenseignant;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idreaueteenseignant")
    private List<Requete> requeteList;
    @JoinColumn(name = "idmatiere", referencedColumnName = "idmatiere")
    @ManyToOne(optional = false)
    private Matiere idmatiere;
    @JoinColumn(name = "matriculeetudiant", referencedColumnName = "matriculeetudiant")
    @ManyToOne(optional = false)
    private Etudiant matriculeetudiant;
    @JoinColumn(name = "matriculeenseignant", referencedColumnName = "matriculeenseignant")
    @ManyToOne(optional = false)
    private Enseignant matriculeenseignant;

    public Requeteenseignant() {
    }

    public Requeteenseignant(Integer idreaueteenseignant) {
        this.idreaueteenseignant = idreaueteenseignant;
    }

    public String getTypeexamen() {
        return typeexamen;
    }

    public void setTypeexamen(String typeexamen) {
        this.typeexamen = typeexamen;
    }

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }

    public Integer getIdreaueteenseignant() {
        return idreaueteenseignant;
    }

    public void setIdreaueteenseignant(Integer idreaueteenseignant) {
        this.idreaueteenseignant = idreaueteenseignant;
    }

    @XmlTransient
    public List<Requete> getRequeteList() {
        return requeteList;
    }

    public void setRequeteList(List<Requete> requeteList) {
        this.requeteList = requeteList;
    }

    public Matiere getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(Matiere idmatiere) {
        this.idmatiere = idmatiere;
    }

    public Etudiant getMatriculeetudiant() {
        return matriculeetudiant;
    }

    public void setMatriculeetudiant(Etudiant matriculeetudiant) {
        this.matriculeetudiant = matriculeetudiant;
    }

    public Enseignant getMatriculeenseignant() {
        return matriculeenseignant;
    }

    public void setMatriculeenseignant(Enseignant matriculeenseignant) {
        this.matriculeenseignant = matriculeenseignant;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idreaueteenseignant != null ? idreaueteenseignant.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Requeteenseignant)) {
            return false;
        }
        Requeteenseignant other = (Requeteenseignant) object;
        if ((this.idreaueteenseignant == null && other.idreaueteenseignant != null) || (this.idreaueteenseignant != null && !this.idreaueteenseignant.equals(other.idreaueteenseignant))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Requeteenseignant[ idreaueteenseignant=" + idreaueteenseignant + " ]";
    }
    
}
