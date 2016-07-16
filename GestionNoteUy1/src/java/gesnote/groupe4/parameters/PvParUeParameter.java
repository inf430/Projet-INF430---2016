/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe4.parameters;

import java.util.HashMap;

/**
 *
 * @author MBOUOPDA MICHAEL
 */
public class PvParUeParameter extends HashMap<String, Object> {

    public PvParUeParameter() {
        super();
    }
    
    public PvParUeParameter(String codeUe, String codeFiliere, String niveau, String annee_aca, int id_semestre){
        super();
        setCodeFiliere(codeFiliere);
        setCodeUe(codeUe);
        setNiveau(niveau);
        setAnneeAcademique(annee_aca);
        setIdSemestre(id_semestre);
    }
    public void setCodeUe(String code) {
        this.put("code_ue", code);
    }

    public void setCodeFiliere(String code) {
        this.put("code_filiere", code);
    }

    public void setNiveau(String niveau) {
        this.put("niveau", niveau);
    }

    public void setIdSemestre(int id) {
        this.put("id_semestre", id);
    }

    public void setAnneeAcademique(String annee) {
        this.put("aneaca", annee);
    }

}
