//
//  main.c
//  Question_3
//
//  Created by Emile Tabbakh on 12/1/19.
//  Copyright © 2019 Emile Tabbakh. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include<string.h>

struct node {
    char data[255];
    struct node *next;
};

void insert_dictionary_order (struct node** head_ref, char new_key[255]) {
    
    struct node* new_node = (struct node*) malloc(sizeof(struct node)); // Creating a new node using malloc
    strcpy(new_node->data, new_key); // Using strcpy to copy the content of the received string to the data of the newly created node
    new_node->next = (*head_ref);
    (*head_ref) = new_node;
}


// Recursively printing the linked list in an inverse order (LIFO)
void print_x (struct node* head) {
        // Base case
        if (head == NULL)
           return;
        
        // Recursively calling print_x
        print_x(head->next);
        
        printf("%s ", head->data);
}

// Head initially null
struct node* head = NULL;

int main() {
    
    
     printf("Enter words seperated by spaces and . or EOF to stop, we will store it in linked list and priting it back to you\n");
    
    /*
     do while loop basically we are doing scanf until the user decides to enter
     . or EOF to stop the process of reading from the terminal
     */
     do
     {
         char c[255]; // Declaring a String c of length 255
         scanf("%s",c);
         if(strcmp(c,".")==0 || strcmp(c,"EOF")==0)
         {
             insert_dictionary_order(&head,c);// Pushing value to the linked list when it's . or EOF
             break; // break out of the loop when you see . or EOF
         }
         else
         {
             insert_dictionary_order(&head,c); // If it's not . or EOF then we push the value to linked list
         }
     }
     while(1); // While always true..
    
    print_x(head); // Calling the printing function
    printf("\n");
    return 0;
    
}
