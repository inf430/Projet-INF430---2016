/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe4.modeles;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author MBOUOPDA MICHAEL
 */
@Entity 
public class ChartData implements Serializable {
    @Id
    @Column(name = "label")
    private String label;
    
    @Column(name = "valeur")
    private double y;

    public ChartData() {
    }

    public ChartData(String label, double y) {
        this.label = label;
        this.y = y;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }
    
}
