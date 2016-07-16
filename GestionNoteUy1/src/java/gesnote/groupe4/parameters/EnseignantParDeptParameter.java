/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.HashMap;
/**
 *
 * @author MBAKOP
 */
public class EnseignantParDeptParameter extends HashMap<String,Object> {
    public EnseignantParDeptParameter(String annee, String dept){
     this.put("annee",annee);
     this.put("dept", dept);
    }
    
}
