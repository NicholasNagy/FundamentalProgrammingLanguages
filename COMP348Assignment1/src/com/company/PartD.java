package com.company;

public class PartD {
    public static void main(String[] args){
        Runnable anonymousRunnable = new Runnable(){
            @Override
            public void run(){
                PartA.printNumbers();
            }
        };
        Runnable lambdaRunnable = () -> PartA.printNumbers();
        anonymousRunnable.run();
        System.out.println("THE END");
        lambdaRunnable.run();
        System.out.println("THE END2");
    }

}
