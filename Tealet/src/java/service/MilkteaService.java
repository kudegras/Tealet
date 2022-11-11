package service;

import java.util.ArrayList;
import java.util.List;
import model.Milktea;

/**
 *
 * @author maxim
 */
public class MilkteaService {
    private List<Milktea> milkteas;
    
    public MilkteaService() {
        milkteas = new ArrayList<>();
        Milktea bobaMilkTea = new Milktea(100, "Boba Milk Tea", "A certified classic. Classic milk tea with boba pearls.", "./images/boba.jpg");
        Milktea wintermelonTea = new Milktea(120, "Wintermelon Tea", "A fan favorite. Tea made from winter melon, brown sugar, and rock sugar.", "./images/wintermelon.png");
        Milktea matchaSpecialtyTea = new Milktea(135, "Matcha Specialty Tea", "A healthy option. Green tea made with authentic matcha leaves.", "./images/matcha.png");
        milkteas.add(bobaMilkTea);
        milkteas.add(wintermelonTea);
        milkteas.add(matchaSpecialtyTea);
    }
    
    public void addMilktea(Milktea milktea) {
        milkteas.add(milktea);
    }
    
    public Milktea findMilkteaByName(String milkteaName) {
        for (Milktea milktea: milkteas) {
            if (milktea.getName().equals(milkteaName)) {
                return milktea;
            }
        }
        return null;
    }
    
    public List<Milktea> getMilkteas() {
        return milkteas;
    }
}
