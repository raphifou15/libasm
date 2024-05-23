#include "libasm.h"
int main(int argc, char **argv){
    if(argc == 2 && (strcmp(argv[1], "ft_atoi_base") == 0)){
        srand(time(NULL));
        for (int i = 0; i != 50; i++){
            int sign = rand() % 2;
            int size = rand() % 20;
            char *str = malloc(sizeof(char) * size + 2);
            for (int y = 0; y < size + 1; y++){
                if (y == 0){
                   str[y] = (sign > 0) ? '+' : '-';
                }else{
                    int num = (rand() % 10) + 48;
                    str[y] = num;
                }
            }
            str[size + 1] = '\0';
            int a = atoi(str);
            int base = ft_atoi_base(str, "0123456789");
            if (a == base){
                printf("\033[0;32m ft_atoi_base = %d ; atoi = %d\n \033[0m", base, a);
            }else if(a != base){
                printf("\033[0;31m ft_atoi_base = %d ; atoi = %d\n \033[0m", base, a);
            }
            free(str);
        }
        printf("//// check if param null /////\n");
        printf("premier paramettre null = %d\n",ft_atoi_base(NULL, "012345"));
        printf("deuxiemme paramettre null = %d\n",ft_atoi_base("lala", NULL));
        printf("les deux paramettre null = %d\n",ft_atoi_base(NULL, NULL));

        int a = 0;
        int b = 0;

        (a = ft_atoi_base_test("abfg", "0123abfg456789")) == (b = ft_atoi_base("abfg", "0123abfg456789")) ?
        printf("\033[0;32m res a = %d, res b = %d \n\033[0m", a, b): printf("\033[0;31m res a = %d, res b = %d \n\033[0m", a, b);

        (a = ft_atoi_base_test("031", "01233")) == (b = ft_atoi_base("031", "01233")) ?
        printf("\033[0;32m res a = %d, res b = %d \n\033[0m", a, b) : printf("\033[0;31m res a = %d, res b = %d \n\033[0m", a, b);

          (a = ft_atoi_base_test("  ++d", "fd+")) == (b = ft_atoi_base("  ++d", "fd+")) ?
        printf("\033[0;32m res a = %d, res b = %d \n\033[0m", a, b) : printf("\033[0;31m res a = %d, res b = %d \n\033[0m", a, b);

          (a = ft_atoi_base_test("uhhhuh", "ok-hu")) == (b = ft_atoi_base("uhhhuh", "ok-hu")) ?
        printf("\033[0;32m res a = %d, res b = %d \n\033[0m", a, b) : printf("\033[0;31m res a = %d, res b = %d \n\033[0m", a, b);
        (a = ft_atoi_base_test("     \n\n\n\t\turuhuifikdje 878iro", "qwertyuioplkjhgfdsa")) == (b = ft_atoi_base("     \n\n\n\t\turuhuifikdje 878iro", "qwertyuioplkjhgfdsa")) ?
        printf("\033[0;32m res a = %d, res b = %d \n\033[0m", a, b) : printf("\033[0;31m res a = %d, res b = %d \n\033[0m", a, b);
        (a = ft_atoi_base_test("     \n\n\n\t\t +++---++--ururhtjfn", "qwertyuioplkjhgfdsa")) == (b = ft_atoi_base("     \n\n\n\t\t +++---++--ururhtjfn", "qwertyuioplkjhgfdsa")) ?
        printf("\033[0;32m res a = %d, res b = %d \n\033[0m", a, b) : printf("\033[0;31m res a = %d, res b = %d \n\033[0m", a, b);
    }
    else if(argc == 2 && (strcmp(argv[1], "ft_list_push_front") == 0)){
        char *lala = ft_strdup("clear");
        t_list *raph = ft_create_elem(NULL);
        ft_list_push_front(&raph, lala);
        ft_list_push_front(&raph, ft_strdup("Bonjour"));
        ft_list_push_front(&raph, NULL);
        ft_list_push_front(&raph, ft_strdup("salut"));

        while (raph != NULL)
        {
            printf("raph te dis %s\n", (char *)raph->data);
            t_list *raph2 = raph->next;
            free(raph->data);
            free(raph);
            raph = raph2;
        }
    }
    else if(argc == 2 && (strcmp(argv[1], "ft_list_size") == 0)){
        char *lala = ft_strdup("clear");
        t_list *raph = NULL;
        t_list *raph3 = NULL;
        ft_list_push_front(&raph, lala);
        ft_list_push_front(&raph, ft_strdup("Bonjour"));
        ft_list_push_front(&raph, ft_strdup("lala"));
        ft_list_push_front(&raph, ft_strdup("salut"));

        raph3 = raph;
        int size = ft_list_size(raph3);
        int sizeNull = ft_list_size(NULL);
        printf("taille de la t_list est NULL : %d\n",sizeNull);

        printf("taille de la t_list est de %d\n",size);


        while (raph != NULL)
        {
            printf("raph te dis %s\n", (char *)raph->data);
            t_list *raph2 = raph->next;
            free(raph->data);
            free(raph);
            raph = raph2;
        }
    } else if(argc == 2 && (strcmp(argv[1], "ft_list_sort") == 0)){
        char *lala = ft_strdup("clear");
        t_list *raph = NULL;
        t_list *raph3 = NULL;
        ft_list_push_front(&raph, lala);
        ft_list_push_front(&raph, ft_strdup("bonjour"));
        ft_list_push_front(&raph, ft_strdup("lala"));
        ft_list_push_front(&raph, ft_strdup("salut"));
        ft_list_push_front(&raph, ft_strdup("bonjour"));

        ft_list_sort(&raph, ft_strcmp);
        ft_list_sort(&raph, NULL);
        ft_list_sort(NULL, ft_strcmp);
        ft_list_sort(NULL, NULL);

        while (raph != NULL)
        {
            printf("raph te dis %s\n", (char *)raph->data);
            t_list *raph2 = raph->next;
            free(raph->data);
            free(raph);
            raph = raph2;
        }
    }else if(argc == 2 && (strcmp(argv[1], "ft_list_remove_if") == 0)){
        char *lala = ft_strdup("clear");
        t_list *raph = NULL;
        t_list *raph3 = NULL;
        ft_list_push_front(&raph, lala);
        ft_list_push_front(&raph, ft_strdup("clear"));
        ft_list_push_front(&raph, ft_strdup("lala"));
        ft_list_push_front(&raph, ft_strdup("clear"));
        ft_list_push_front(&raph, ft_strdup("bonjour"));

        
        ft_list_remove_if(&raph, "clear", ft_strcmp, free);

        while (raph != NULL)
        {
            printf("raph te dis %s\n", (char *)raph->data);
            t_list *raph2 = raph->next;
            free(raph->data);
            free(raph);
            raph = raph2;
        }
    }
}