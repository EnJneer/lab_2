#include <stdio.h>
#include <string.h>

// External function 
extern long get_hamming_distance(const char *s1, const char *s2, size_t len);

int main() {
    //string limit of 255
    char str1[256];
    char str2[256];

    printf("Enter first string: ");
    if (!fgets(str1, 256, stdin)) return 1;
    str1[strcspn(str1, "\n")] = 0; 

    printf("Enter second string: ");
    if (!fgets(str2, 256, stdin)) return 1;
    str2[strcspn(str2, "\n")] = 0;


    size_t len1 = strlen(str1);
    size_t len2 = strlen(str2);
    //should the input be less than 256 characters
    if (len1 <= 255 && len2 <= 255){
    size_t min_len;
if (len1 < len2) {
    min_len = len1;
} else {
    min_len = len2;
}
    long distance = get_hamming_distance(str1, str2, min_len);
    //final print statements   
    printf("String 1 length: %zu\n", len1);
    printf("String 2 length: %zu\n", len2);
    printf("We are comparing up to this length: %zu\n", min_len);
    printf("Hamming Distance: %ld\n", distance);
    }

    //if input exceeds 255 characters
    else{
        printf("The range has been exceeded.");
    }

    return 0;
}