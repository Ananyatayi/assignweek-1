class AppUser {
    int userId;
    String name;
    String phone;

    AppUser(int userId, String name, String phone) {
        this.userId = userId;
        this.name = name;
        this.phone = phone;
    }

    void login() {
        System.out.println(name + " logged in");
    }

    void logout() {
        System.out.println(name + " logged out");
    }
}

class Customer extends AppUser {
    String deliveryAddress;

    Customer(int userId, String name, String phone, String deliveryAddress) {
        super(userId, name, phone);
        this.deliveryAddress = deliveryAddress;
    }

    void placeOrder() {
        System.out.println(name + " placed order to " + deliveryAddress);
    }

    void viewOrderHistory() {
        System.out.println(name + " viewing order history");
    }
}

class DeliveryPartner extends AppUser {
    String vehicleType;

    DeliveryPartner(int userId, String name, String phone, String vehicleType) {
        super(userId, name, phone);
        this.vehicleType = vehicleType;
    }

    void acceptDelivery() {
        System.out.println(name + " accepted delivery using " + vehicleType);
    }

    void updateDeliveryStatus() {
        System.out.println(name + " updated delivery status");
    }
}

class RestaurantOwner extends AppUser {
    String restaurantName;

    RestaurantOwner(int userId, String name, String phone, String restaurantName) {
        super(userId, name, phone);
        this.restaurantName = restaurantName;
    }

    void addMenuItem() {
        System.out.println(name + " added menu item in " + restaurantName);
    }

    void updateOrderStatus() {
        System.out.println(name + " updated order status in " + restaurantName);
    }
}

public class FoodDelivery {
    public static void main(String[] args) {

        Customer c = new Customer(1, "Ananya", "9999999999", "Bangalore");
        DeliveryPartner d = new DeliveryPartner(2, "tayi", "980965688", "Bike");
        RestaurantOwner r = new RestaurantOwner(3, "helo", "7876543217", "Spicy Hub");

        c.login();
        c.placeOrder();
        c.viewOrderHistory();
        c.logout();

        System.out.println();

        d.login();
        d.acceptDelivery();
        d.updateDeliveryStatus();
        d.logout();

        System.out.println();

        r.login();
        r.addMenuItem();
        r.updateOrderStatus();
        r.logout();
    }
}