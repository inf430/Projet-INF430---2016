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
public class ListeEtudiantParameter extends HashMap<String,Object>{
    public ListeEtudiantParameter(String classe, String annee){
        this.put("classe", classe);
        this.put("annee", annee);
    
}
    
}
