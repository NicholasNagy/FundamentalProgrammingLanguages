#include <stdio.h>
#include <stdbool.h>

// Prints the array backwards because the bits in the numbers are stored backwards.
void printArray(char bits[], int size){
    for (int i = size - 1; i >= 0 ; i--){
        if(i%4 == 0){
            printf("%c%c", bits[i],' ');
        }else {
            printf("%c", bits[i]);
        }
    }
}

// Based on the character entered, this function will return the size of a float if
// the character entered was 'F' for float or it will return the size of a double if
// the character entered was 'D' for double.
int getSize(char *floatOrDoubl){
    char floatOrDouble =  *floatOrDoubl;
    if('F' == floatOrDouble){
        return sizeof(float);
    } else if ('D' == floatOrDouble){
        return sizeof(double);
    } else {
        printf("%c", floatOrDouble);
        return 0;
    }
}

// Checks whether the character entered was an 'F' for float, if not, it returns false
bool isFloat(char *floatOrDoubl){
    char floatOrDouble = *floatOrDoubl;
    if('F' == floatOrDouble){
        return true;
    } else {
        return false;
    }
}

int main()
{
    char floatOrDouble[1];
    printf("[F]loat or [D]ouble? ");
    scanf("%s",floatOrDouble);

    int size = getSize(floatOrDouble); // gets the size of the float or double
    if(size == 0){
        printf("Wrong Input!");
    }

    unsigned char* bytes;
    // checks if the value entered earlier was a float otherwise it handles it as a double
    if (isFloat(floatOrDouble)){
        float f;
        printf("Enter the number: ");
        scanf("%f", &f);
        bytes = (unsigned char*)(void*)&f; // assigning bytes to point to float
        printf("Number %f in floating point representation is:\n", f);
    } else {
        double f;
        printf("Enter the number: ");
        scanf("%lf", &f);
        bytes = (unsigned char*)(void*)&f; // assigning bytes to point to double
        printf("Number %lf in double point representation is:\n", f);
    }

    char bits[size*8]; // Defining array where bits will be stored

    for (int i = 0; i< size; i++){
        for (int x = 0; x < 8; x++){
            // The below if statement checks if a bit is 1 with "0x01 & " and compares it
            // to the bit that is returned from the bit operation "(&bytes.bits[i] >> x)", which
            // returns the bit at index x, starting from the starting bit of byte i.
            if(0x01 & (bytes[i] >> x) ){
                bits[i*8 + x] = 'X';
            } else{
                bits[i*8 + x] = '0';
            }
        }
    }

    // Prints the array backwards, since they are stored backwards in the memory for some reason
    // Ask TA why?
    printArray(bits, size*8);
}