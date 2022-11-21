package model;

import java.util.ArrayList;
import java.util.List;

public class Milktea {
    private int price;
    private String name;
    private String description;
    private String imagePath;
    private String freebie;
    
    public Milktea(int price, String name, String description, String imagePath) {
        this.price = price;
        this.name = name;
        this.description = description;
        this.imagePath = imagePath;
    }
    
    public void setFreebie(String freebie) {
        this.freebie = freebie;
    }
    
    public String getPrice() {
        return Integer.toString(price);
    }
    
    public String getName() {
        return name;
    }
    
    public String getDescription() {
        return description;
    }
    
    public String getImagePath() {
        return imagePath;
    }
    
    public String getFreebie() {
        return freebie;
    }
}