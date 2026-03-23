class BankAccount {
    // Private variables
    private String accountNumber;
    private String customerName;
    private String accountType;
    private double balance;

    // Constructor
    public BankAccount(String accountNumber, String customerName, String accountType, double balance) {
        this.accountNumber = accountNumber;
        this.customerName = customerName;
        this.accountType = accountType;
        this.balance = balance;
    }

    // Display account details
    public void displayAccountInfo() {
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Customer Name: " + customerName);
        System.out.println("Account Type: " + accountType);
        System.out.println("Balance: " + balance);
    }

    // Deposit method
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Amount Deposited: " + amount);
            System.out.println("Updated Balance: " + balance);
        } else {
            System.out.println("Invalid deposit amount!");
        }
    }

    // Withdraw method
    public void withdraw(double amount) {
        if (amount <= 0) {
            System.out.println("Invalid withdrawal amount!");
        } else if (amount > balance) {
            System.out.println("Insufficient balance!");
        } else {
            balance -= amount;
            System.out.println("Amount Withdrawn: " + amount);
            System.out.println("Remaining Balance: " + balance);
        }
    }
}

// Main class
public class Main {
    public static void main(String[] args) {
        BankAccount acc = new BankAccount("12345", "Ananya", "Savings", 5000);

        acc.displayAccountInfo();
        System.out.println();

        acc.deposit(2000);
        System.out.println();

        acc.withdraw(3000);
        System.out.println();

        acc.withdraw(10000); // test insufficient balance
    }
}