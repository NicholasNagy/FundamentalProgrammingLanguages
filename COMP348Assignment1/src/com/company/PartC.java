package com.company;

public class PartC {
    public static void main(String[] args){
        Runnable anonymousThread = new Runnable() {
            @Override
            public void run() {
                PartA.printNumbers();
            }
        };
        Runnable lambdaThread = () -> PartA.printNumbers();
        new Thread(anonymousThread).start();
        new Thread(lambdaThread).start();
    }
}
