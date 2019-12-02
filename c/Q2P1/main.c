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

    int size = getSize(floatOrDouble);
    if(size == 0){
        printf("Wrong Input!");
    }

    unsigned char* bytes;
    if (isFloat(floatOrDouble)){
        float f;
        printf("Enter the number: ");
        scanf("%f", &f);
        bytes = (unsigned char*)(void*)&f;
        printf("Number %f in floating point representation is:\n", f);
    } else {
        double f;
        printf("Enter the number: ");
        scanf("%lf", &f);
        bytes = (unsigned char*)(void*)&f;
        printf("Number %lf in double point representation is:\n", f);
    }

    char bits[size*8];

    for (int i = 0; i< size; i++){
        for (int x = 0; x < 8; x++){
            if(0x01 & (bytes[i] >> x) ){
                bits[i*8 + x] = 'X';
            } else{
                bits[i*8 + x] = '0';
            }
        }
    }

    printArray(bits, size*8);

    return 0;
}