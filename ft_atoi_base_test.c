#include "libasm.h"

int check_whitespace(char *str, int index){
    int isEnd = 0;
    while (!isEnd){
        if (str[index] == '\0')
            isEnd = 1;
        else if((str[index] < 9 || str[index] > 13) && str[index] != 32)
            isEnd = 1;
        else
            index++;
    }
    return index;
}

int validateAllSignsAndSpaces(char *base){
    for(int i = 0; base[i] != '\0'; i++){
        if (base[i] == '+' || base[i] == '-' || base[i] == 32)
            return 0;
        if (base[i] > 8 && base[i] < 14)
            return 0;
    }
    return 1;
}

int isDuplicateChar(char *base){
    for (int i = 0; base[i] != '\0'; i++){
        for (int y = i + 1; base[y] != '\0'; y++){
            if (base[i] == base[y])
                return 0;
        }
    }
    return (1);
}

int getValFromBase(char c, char *base){
    for (int i = 0; base[i] != '\0'; i++){
        if (base[i] == c)
            return i;
    }
    return -1;
}

int ft_atoi_base_test(char *str, char *base){
    int size = strlen(base);
    int sign = 1;
    long num = 0;
    if (size <= 1) return 0;
    if (!validateAllSignsAndSpaces(base)) return 0;
    if (!isDuplicateChar(base)) return 0;
    int index = 0;
    index = check_whitespace(str, index);
    while (str[index] != '\0' && (str[index] == '+' || str[index] == '-')){
        if (str[index] == '+') sign = 1;
        else sign = -1;
        index++;
    }

    while (str[index] != '\0'){
        int valAdd = getValFromBase(str[index], base);
        if (valAdd == -1)
            break;
        num *= (long)size;
        num += (long)valAdd;
        index++;
    }
    return ((int)num * sign);
}
