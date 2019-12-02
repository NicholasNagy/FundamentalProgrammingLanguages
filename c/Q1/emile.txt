#include <stdio.h>
#include <stdlib.h>

FILE *fp_read, *fp_write; // File pointers read and write
/* Functions used throughout the program */
char next_character(void);
void single_line_comment(void);
void multiple_line_comment(void);
void comment_check(char c);

int main() {
    fp_read = fopen("emile.txt", "r"); //Opening emile.txt with read access
    fp_write = fopen("emile_2.txt", "w"); // Opening emile_2.txt with write access
    char c; // Declaring character c
    
    /* Reading the whole file byte by byte and checking
     the byte we read using the comment check */
    while((c = next_character()) != EOF) {
        comment_check(c);
    }
    printf("\n");
    fclose(fp_read); // Closing the files after reading/writing
    static char* s = "/*This is not a comment!*/"; // This should be printed!! and the comment would be removed
    return 0;
}

/*
 The comment checkef function takes a character c and checks
 if its a single line comment or multiple line comment
 */
void comment_check(char c) {
    char c_2;
    
    if(c == '/') {
        c_2 = next_character();
        
        if(c_2 == '/') {
            single_line_comment();
        }
        else if (c_2 == '*') {
            multiple_line_comment();
        }
        else {
            fputc(c, fp_write);
            fputc(c_2, fp_write);
        }
    }
    // IF a string has been detected neglect what's inside and continue reading
    else if (c == '"') {
        char c_2;
        
        while ((c_2 = next_character()) !='"'){
            fputc(c_2, fp_write);
        }
        
    } else {
        fputc(c, fp_write);
    }
}

// Function that will be called when a single line comment has been detected
void single_line_comment() {
    char c_2;
    while((c_2=next_character()) != EOF){
        if (c_2 == '\n') { // Keep reading until the end of the line (a new line is inserted)
            fputc(c_2, fp_write);
            return;
        }
    }
}

/*
 A function that will be called when a multiple line comment has been detected
 
 */
void multiple_line_comment() {
    char c_2, c_3;

    while((c_2 = next_character()) != EOF) {
        if (c_2 == '*') {
            c_3 = next_character();
            if(c_3 == '/') { // Once we reach the end of multiple line comment exit
                return;
            }
        }
    }
}

// A function that reads the file character by character and move to the next character
char next_character() {
    char c;
    c = fgetc(fp_read);
    return c;
}


