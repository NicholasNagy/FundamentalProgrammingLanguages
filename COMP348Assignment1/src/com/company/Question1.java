package com.company;

public class Question1 {
    public interface Interface1 {
        double returnFivePointFive();
    }
    public interface Interface2 {
        String formatNumber (int a);
    }
    public interface Interface3 {
        Boolean stringEqualsInt(int i, String s);
    }

    public static void main(String[] args){

        Interface1 myInt = () -> 5.5;
        Interface2 formatNumber = (a) -> String.format("The number is %d", a);
        Interface3 stringEqualsInt = ( i,  s) -> i == Integer.parseInt(s);

        System.out.println("Testing First Interface: ");
        System.out.println(myInt.returnFivePointFive());

        System.out.println("\nTesting Second Interface: ");
        System.out.println(formatNumber.formatNumber(3));

        System.out.println("\nTesting Third Interface: ");
        System.out.println(stringEqualsInt.stringEqualsInt( 2, "2"));
        System.out.println(stringEqualsInt.stringEqualsInt( 2, "5"));
    }


}
