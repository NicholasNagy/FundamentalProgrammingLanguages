package com.company;


public class PartB {
    public static void main(String[] args){
        PartA myProgram = new PartA();
        new Thread(myProgram).start();
        System.out.println("THE END");
    }
}

/*
* Changes are sometimes seen in the output result.
* I imagine this is as a result of scheduling since
* the loop was very short.
*/
