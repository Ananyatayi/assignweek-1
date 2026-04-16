import java.util.*;
import java.util.stream.*;

public class Main {
    public static void main(String[] args) {

        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "IPhone 15", "Electronics", "Apple", 80000, 10, 4.8, 10, true));
        products.add(new Product(2, "T-Shirt", "Fashion", "Nike", 2000, 50, 4.2, 20, true));
        products.add(new Product(3, "Laptop", "Electronics", "Dell", 60000, 5, 4.6, 15, true));
        products.add(new Product(4, "Shoes", "Fashion", "Adidas", 5000, 0, 4.0, 25, false));
        products.add(new Product(5, "TV", "Electronics", "Sony", 90000, 3, 4.7, 12, true));
        //all values
        products.forEach(p -> System.out.println(p.productName));
        //Price > 5000
        System.out.println("------");
        products.stream().filter(p -> p.price > 5000).forEach(System.out::println);
        //elctronic only
        System.out.println("------");
        products.stream().filter(p -> p.category.equals("Electronics")).forEach(System.out::println);
        //stock check
        System.out.println("------");
        products.stream().filter(p -> p.inStock).forEach(System.out::println);
        System.out.println("Ascending order of places");
        products.stream().sorted((a, b) -> Double.compare(a.price, b.price)).forEach(System.out::println);
        System.out.println("descending order of prices");
        products.stream().sorted((a, b) -> Double.compare(b.price, a.price)).forEach(System.out::println);
        System.out.println("Descending order of ratings:");
        products.stream().sorted((a, b) -> Double.compare(b.rating, a.rating)).forEach(System.out::println);
        System.out.println("Nmaes comparing");
        products.stream().sorted((a, b) -> a.productName.compareTo(b.productName)).forEach(System.out::println);
        System.out.println("prices gretae rthan 7000:");
        boolean result = products.stream()
                .anyMatch(p -> p.price > 70000);

        System.out.println(result);
        System.out.println("rating > 3.5");
        boolean result2 = products.stream()
                .allMatch(p -> p.rating > 3.5);
        System.out.println(result2);

        System.out.println(" No Medical category:");
        System.out.println(products.stream().noneMatch(p -> p.category.equals("Medical")));


        System.out.println(" Max Price Product:");
        System.out.println(products.stream().max((a, b) -> Double.compare(a.price, b.price)).get());


        System.out.println("Min Price Product:");
        System.out.println(products.stream().min((a, b) -> Double.compare(a.price, b.price)).get());


        products.stream()
                .filter(p -> p.category.equals("Electronics"))
                .forEach(p -> p.price *= 1.05);


        products.stream()
                .filter(p -> p.category.equals("Fashion"))
                .forEach(p -> p.discountPercentage += 10);

        products.stream()
                .filter(p -> p.stock == 0)
                .forEach(p -> p.inStock = false);

        System.out.println("Fashion Count:");
        System.out.println(products.stream().filter(p -> p.category.equals("Fashion")).count());


        System.out.println(" Rating > 4.5 Count:");
        System.out.println(products.stream().filter(p -> p.rating > 4.5).count());


        System.out.println(" Out of Stock Count:");
        System.out.println(products.stream().filter(p -> !p.inStock).count());


    }}
