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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "etudiant_exam")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EtudiantExam.findAll", query = "SELECT e FROM EtudiantExam e"),
    @NamedQuery(name = "EtudiantExam.findByIdetudiantexam", query = "SELECT e FROM EtudiantExam e WHERE e.idetudiantexam = :idetudiantexam"),
    @NamedQuery(name = "EtudiantExam.findByNote", query = "SELECT e FROM EtudiantExam e WHERE e.note = :note"),
    @NamedQuery(name = "EtudiantExam.findByAnonymat", query = "SELECT e FROM EtudiantExam e WHERE e.anonymat = :anonymat")})
public class EtudiantExam implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idetudiantexam")
    private Integer idetudiantexam;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "note")
    private Float note;
    @Size(max = 20)
    @Column(name = "anonymat")
    private String anonymat;
    @JoinColumn(name = "idexamen", referencedColumnName = "idexamen")
    @ManyToOne(optional = false)
    private Examen idexamen;
    @JoinColumn(name = "matricule", referencedColumnName = "matricule")
    @ManyToOne(optional = false)
    private Etudiant matricule;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public EtudiantExam() {
    }

    public EtudiantExam(Integer idetudiantexam) {
        this.idetudiantexam = idetudiantexam;
    }

    public Integer getIdetudiantexam() {
        return idetudiantexam;
    }

    public void setIdetudiantexam(Integer idetudiantexam) {
        this.idetudiantexam = idetudiantexam;
    }

    public Float getNote() {
        return note;
    }

    public void setNote(Float note) {
        this.note = note;
    }

    public String getAnonymat() {
        return anonymat;
    }

    public void setAnonymat(String anonymat) {
        this.anonymat = anonymat;
    }

    public Examen getIdexamen() {
        return idexamen;
    }

    public void setIdexamen(Examen idexamen) {
        this.idexamen = idexamen;
    }

    public Etudiant getMatricule() {
        return matricule;
    }

    public void setMatricule(Etudiant matricule) {
        this.matricule = matricule;
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
        hash += (idetudiantexam != null ? idetudiantexam.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EtudiantExam)) {
            return false;
        }
        EtudiantExam other = (EtudiantExam) object;
        if ((this.idetudiantexam == null && other.idetudiantexam != null) || (this.idetudiantexam != null && !this.idetudiantexam.equals(other.idetudiantexam))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.EtudiantExam[ idetudiantexam=" + idetudiantexam + " ]";
    }
    
}
