#include <stdio.h>
#include <ctype.h>


#define MIDDLE_SIZE 16

void print_hexdump(const char *filename) {
    FILE *file = fopen(filename, "rb");
    if (!file) {
        perror("Error opening file");
        return;
    }

    unsigned char buffer[MIDDLE_SIZE];
    size_t bytes_read;
    unsigned int offset = 0;

    while ((bytes_read = fread(buffer, 1, MIDDLE_SIZE, file)) > 0) {
        //Print the 8-digit hexadecimal offset
        printf("%08x  ", offset);

        //Print the Hex Data section
        for (int i = 0; i < MIDDLE_SIZE; i++) {
            if (i < bytes_read) {
                printf("%02x ", buffer[i]);
            } else {
                printf("   "); // space for lines less than 16 bytes
            }
            
        }

        
        printf(" |");
        for (int i = 0; i < bytes_read; i++) {
            // Check if byte is printable (ASCII 32-126)
            if (isprint(buffer[i])) {
                printf("%c", buffer[i]);
            } else {
                printf(".");
            }
        }
        printf("|\n");

        offset += bytes_read;
    }

    fclose(file);
}

int main(void) {
    print_hexdump("binary.out");
    return 0;
}
