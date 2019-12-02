#include <stdio.h>
#include <stdbool.h>

void printArray(char bits[], int size){
    for (int i = size - 1; i >= 0 ; i--){
        if(i%4 == 0){
            printf("%c%c", bits[i],' ');
        }else {
            printf("%c", bits[i]);
        }
    }
}

typedef struct {
    int numberOfBytes;
    bool isFloat;
} floatOrDouble;

typedef union {
    float aFloat;
    double aDouble;
    unsigned char bits;
} number;

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
        return floatOrDouble{};
    }
}

int main()
{
    char floatOrDoubl;
    printf("[F]loat or [D]ouble? ");
    scanf("%c",&floatOrDoubl);

    floatOrDouble decimalNumber = defineDecimalNumber(floatOrDoubl);

    number bytes;
    if (decimalNumber.isFloat){
        printf("Enter the number: ");
        float f;
        scanf("%f", &f);
        bytes.aFloat = f;
        printf("Number %f in floating point representation is:\n", bytes.aFloat);
    } else {
        printf("Enter the number: ");
        double d;
        scanf("%lf", &d);
        bytes.aDouble = d;
        printf("Number %lf in double point representation is:\n", bytes.aDouble);
    }

    char repbits[decimalNumber.numberOfBytes*8];

    for (int i = 0; i< decimalNumber.numberOfBytes; i++){
        for (int x = 0; x < 8; x++){
            if(0x01 & ((&bytes.bits)[i] >> x) ){
                repbits[i*8 + x] = 'X';
            } else{
                repbits[i*8 + x] = '0';
            }
        }
    }

    printArray(repbits, decimalNumber.numberOfBytes*8);

    return 0;
}