import java.util.*;
public class Units {
    public static void main(String[] atgs){
        Scanner sc=new Scanner(System.in);
        System.out.print("Customer ID: ");
        int customerId=sc.nextInt();
        System.out.print("units Consumed : ");
        int unitsConsumed = sc.nextInt();
        float charge=0;
        if(unitsConsumed <= 100){
            charge = unitsConsumed * 5;
        }
        else if(unitsConsumed <= 250){
            charge = 100*5 + (unitsConsumed-100) * 8.5f;
        }
        else if(unitsConsumed <= 500){
            charge = 100*5 + 150*8.5f + (unitsConsumed-250) * 12.5f;
        }
        else{
            charge = 100*5 + 150*8.5f + 250*12.5f + (unitsConsumed-500) * 15;
        }
        System.out.println("Total Bill : "+ charge );
    }
}