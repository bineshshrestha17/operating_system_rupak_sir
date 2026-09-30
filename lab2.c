#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int global_init = 150;   // Data segment
int global_uninit;       // BSS segment

int main() {
    int local_var = 30;                          // Stack
    int *heap_var = (int *)malloc(sizeof(int));  // Heap
    *heap_var = 500;

    printf("global_init   (Data):  %p\n", (void *)&global_init);
    printf("global_uninit (BSS):   %p\n", (void *)&global_uninit);
    printf("local_var     (Stack): %p\n", (void *)&local_var);
    printf("*heap_var     (Heap):  %p\n", (void *)heap_var);

    uintptr_t diff = (uintptr_t)&local_var - (uintptr_t)heap_var;
    printf("\nStack - Heap difference: %lu bytes (0x%lx)\n",
           (unsigned long)diff, (unsigned long)diff);

    free(heap_var);
    return 0;
}
