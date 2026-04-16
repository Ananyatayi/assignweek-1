class Customers {
    protected int customerId;
    protected String customerName;
    protected String email;

    public Customers(int customerId, String customerName, String email) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.email = email;
    }

    void registerCustomer() {
        System.out.println(customerName + " registered successfully");
    }

    void displayCustomer() {
        System.out.println("Customer ID      : " + customerId);
        System.out.println("Customer Name    : " + customerName);
        System.out.println("Customer Email   : " + email);
    }
}

class PremiumCustomer extends Customers {
    private String membershipLevel;
    private double rewardPoints;

    public PremiumCustomer(int customerId, String customerName, String email,
                           String membershipLevel, double rewardPoints) {
        super(customerId, customerName, email);
        this.membershipLevel = membershipLevel;
        this.rewardPoints = rewardPoints;
    }

    void applyPremiumBenefits() {
        System.out.println("Premium benefits applied for Customer ID: " + customerId);
        System.out.println("Free delivery enabled");
        System.out.println("Early access to offers");
    }

    void displayPremiumCustomer() {
        System.out.println("Premium Customer Details");
        super.displayCustomer();
        System.out.println("Membership Level : " + membershipLevel);
        System.out.println("Reward Points    : " + rewardPoints);
    }
}

public class Customer {
    public static void main(String[] args) {

        PremiumCustomer pc = new PremiumCustomer(
                100, "tayi", "ananya@gmail.com", "Gold", 50
        );

        pc.registerCustomer();
        pc.applyPremiumBenefits();
        pc.displayPremiumCustomer();
    }
}