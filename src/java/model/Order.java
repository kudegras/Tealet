package model;

/**
 *
 * @author maxim
 */
public class Order {
    private String flavor;
    private double price;
    private String size;
    private int quantity;
    private String couponCode;
    private double discount;
    private double total;
    
    public Order(String flavor, double price, String size, int quantity, String couponCode, double discountRate) {
        this.flavor = flavor;
        this.price = price + priceIncreaseWhenUpsized(size);
        this.size = size;
        this.quantity = quantity;
        this.couponCode = couponCode;
        this.discount = computeDiscount(discountRate);
        this.total = (this.price - discount) * quantity;
    }
    
    private double computeDiscount(double discountRate) {
        if (discountRate != 0) {
            return price / discountRate;
        }
        return 0;
    }
    
    private int priceIncreaseWhenUpsized(String size) {
        if (size.equals("Medium")) {
            return 20;
        } else if (size.equals("Large")) {
            return 35;
        }
        return 0;
    }

    public String getFlavor() {
        return flavor;
    }
    
    public double getPrice() {
        return price;
    }

    public String getSize() {
        return size;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public double getDiscount() {
        return discount;
    }

    public double getTotal() {
        return total;
    }
}
