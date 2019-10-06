package com.company;

public class PartA implements Runnable {

    @Override
    public void run() {
        printNumbers();
    }

    public static void printNumbers(){
        for (int i = 0; i<10000; i++){
            System.out.println(i+1);
        }
    }

    public static void main(String[] args){
        Runnable mythread = new PartA();
        mythread.run();
        System.out.println("THE END");
    }
}
