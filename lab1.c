#include <stdio.h>

int main() {
    printf("=== Data Type Sizes on This System ===\n\n");

    printf("char:         %zu bytes\n", sizeof(char));
    printf("int:          %zu bytes\n", sizeof(int));
    printf("float:        %zu bytes\n", sizeof(float));
    printf("double:       %zu bytes\n", sizeof(double));
    printf("long:         %zu bytes\n", sizeof(long));
    printf("unsigned int: %zu bytes\n", sizeof(unsigned int));
    printf("long long:    %zu bytes\n", sizeof(long long));

    return 0;
}
