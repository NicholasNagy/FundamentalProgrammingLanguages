#include <stdio.h>
#include <stdbool.h>

// Prints array backwards, because that is the way the bits are oriented in memory
void printArray(char bits[], int size){
    for (int i = size - 1; i >= 0 ; i--){
        if(i%4 == 0){
            printf("%c%c", bits[i],' ');
        }else {
            printf("%c", bits[i]);
        }
    }
}

// A struct the defines the resources for a number (float or double)
typedef struct {
    int numberOfBytes;
    bool isFloat;
} floatOrDouble;

// A union defining where the number will be stored
typedef union {
    float aFloat;
    double aDouble;
    unsigned char bits; // Used for accessing the bits of the number
} number;

// Returns the struct that defines the resources of a number (float or double)
floatOrDouble defineDecimalNumber(char floatOrDouble2){
    if('F' == floatOrDouble2){
        floatOrDouble desc = {sizeof(float), true};
        return desc;
    } else if ('D' == floatOrDouble2){
        floatOrDouble desc = {sizeof(double), false};
        return desc;
    } else {
        printf("%c", floatOrDouble2);
        printf("\nWrong Input!\n");
        // Returning default value
        floatOrDouble desc = {0, false};
        return desc;
    }
}

int main()
{
    char floatOrDoubl;
    printf("[F]loat or [D]ouble? ");
    scanf("%c",&floatOrDoubl); // Using a reference, because no choice for scanner

    // Defines the resources for a decimal number
    floatOrDouble decimalNumber = defineDecimalNumber(floatOrDoubl);

    number bytes;
    if (decimalNumber.isFloat){
        printf("Enter the number: ");
        float f;
        scanf("%f", &f); // Using a reference, because no choice for scanner
        bytes.aFloat = f;
        printf("Number %f in floating point representation is:\n", bytes.aFloat);
    } else {
        printf("Enter the number: ");
        double d;
        scanf("%lf", &d); // Using a reference, because no choice for scanner
        bytes.aDouble = d;
        printf("Number %lf in double point representation is:\n", bytes.aDouble);
    }

    // initializing representative bits array. This array will represent the bits
    // with X's and 0's
    char repbits[decimalNumber.numberOfBytes*8];

    for (int i = 0; i< decimalNumber.numberOfBytes; i++){
        for (int x = 0; x < 8; x++){
            // The below if statement checks if a bit is 1 with "0x01 & " and compares it
            // to the bit that is returned from the bit operation "(&bytes.bits[i] >> x)", which
            // returns the bit at index x, starting from the starting bit of byte i.
            if(0x01 & ((&bytes.bits)[i] >> x) ){
                repbits[i*8 + x] = 'X';
            } else{
                repbits[i*8 + x] = '0';
            }
        }
    }

    // Prints the array backwards, since they are stored backwards in the memory for some reason
    // Ask TA why?
    printArray(repbits, decimalNumber.numberOfBytes*8);

    return 0;
}