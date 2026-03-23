interface Connectable {
    void connectToWifi();
}

interface Controllable {
    void turnOn();
    void turnOff();
}

class SmartProjector implements Connectable, Controllable {
    private int deviceId;
    private String brand;

    public SmartProjector(int deviceId, String brand) {
        this.deviceId = deviceId;
        this.brand = brand;
    }

    public void connectToWifi() {
        System.out.println("\nWiFi Connected");
        System.out.println("Device ID : " + deviceId);
        System.out.println("Brand     : " + brand);
    }

    public void turnOn() {
        System.out.println("Projector " + deviceId + " is turned ON");
    }

    public void turnOff() {
        System.out.println("Projector " + deviceId + " is turned OFF");
    }

    void displayDeviceInfo() {
        System.out.println(" Smart Projector Details");
        connectToWifi();
        turnOn();
        turnOff();
    }
}

public class SmartDevice {
    public static void main(String[] args) {

        SmartProjector sp = new SmartProjector(123, "Sony");

        sp.displayDeviceInfo();
    }
}