package com.company;

public class Math101 {
    public static interface Callback<T> {
        void process(T notification);
    }
    public static void Divide(int a, int b,
                              Callback<Integer> onSuccess,
                              Callback<String> onError) {
        try {
            int result = a / b;
            onSuccess .process(result);
        }
        catch(Exception e) {
            onError .process(e.getMessage());
        }
    }

    public static void main(String[] args){

        // Problem A.
        System.out.println("The following output is for problem A:");
        int a = 1;
        int b = 2;
        Callback onSuccess1 = (s) -> System.out.println("The result of " + a + "/" + b + " is " + s);
        Callback onError = (s) -> System.out.println("Error occurred: " + s);
        Divide(a, b, onSuccess1, onError);

        //Problem B
        System.out.println("\nThe following output is for problem B:");
        int c, d;
        c = 3; d = 0;

        Callback onSuccess2 = (s) -> System.out.println("The result of " + c + "/" + d + " is " + s);
        Divide(c, d, onSuccess2, onError);
    }
}
