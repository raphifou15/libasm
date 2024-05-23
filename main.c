#include "libasm.h"

int ft_strcom(char *lala, char*lili){
        printf("lala = %s\n", lala);
        printf("lili = %s\n", lili);
        int i = 0;
        for (; lala[i] != '\0'; i++){
            if (lala[i] != lili[i])
                return lala[i] - lili[i];
        }
        return lala[i] - lili[i];
    }

char * malloc_str(char *str){
    int size = ft_strlen(str);
    char *str2 = malloc((sizeof(char) * size) + 1);
    for (int i = 0; i < size; i++){
        str2[i] = str[i];
    }
    str2[size] = '\0';
    return str2;
}

int main(int argc, char **argv){
   
    if (argc == 2 && (strcmp(argv[1], "ft_strlen") == 0)){
        char *a = NULL;
        srand(time(NULL));
        for (int i = 0; i < 100; i++){
            int size = rand() % 100;
            a = malloc(sizeof(char) * size + 1);
            if (a == NULL) return 0;
            for (int y = 0; y < size; y++){
                char c = rand() % 256;
                a[y] = c;
            }
            a[size] = '\0';
            int lib = strlen(a);
            int myLib = ft_strlen(a);
            if (lib == myLib){
                printf("\033[0;32m strlen: %d  ft_strlen: %d\n\033[0m", lib, myLib);
            }
            else{
                printf("\033[0;31m strlen: %d ft_strlen = %d\n\033[0m", lib , myLib);
            }
            free(a);
        }
		char *b = "";
       	int lib = strlen(b);
       	int myLib = ft_strlen(b);
       	printf("chaine de charactere vide lib:%d, mylib:%d\n", lib, myLib);
    }
    else if(argc == 2 && (strcmp(argv[1], "ft_strcpy") == 0)){

        srand(time(NULL));
    
        for (int i = 0 ; i < 100 ; i++){
            int size = rand() % 100 + 51;
            int size2 = rand() % 50;
            char *a = malloc(sizeof(char) * size + 1);
            if (a == NULL) return 0;
            char *d = malloc(sizeof(char) * size + 1);
            if (d == NULL) return (free(a),0);
            char *b = malloc(sizeof(char) * size2 + 1);  
            if (b == NULL) return (free(a), free(d), 0);
        
            for (int y = 0; y < size; y++){
                char c = rand() % 256;
                a[y] = c;
            }
            a[size] = '\0';

            for (int y = 0; y < size; y++){
                char c = rand() % 256;
                d[y] = c;
            }
            d[size] = '\0';

            for (int y = 0; y < size2; y++){
                char c = rand() % 256;
                b[y] = c;
            }
            b[size2] = '\0';

            char *dest = strcpy(a, b);
            char *dest2 = ft_strcpy(d, b);

            int res = strcmp(dest, dest2);
            int res2 = strcmp(a, d);
            if (res == 0 || res2 == 0){
                printf("\033[0;32m dest : %s = mydest %s\n\033[0m", dest, dest2);
            }else{
                printf("\033[0;31m dest = %s\n mydest = %s\n\033[0m", dest , dest2);
            }
            free(a);
            free(b);
            free(d);
        }
		char a[2] = "";
        char b[5] = "lala";
        char c[5] = "lala";
        char *dest = strcpy(b, a);
        char *dest2 = ft_strcpy(c, a);
        printf("chaine de charactere vide dest:%s, dest2:%s\n", dest, dest2);
    }
    else if(argc == 2 && (strcmp(argv[1], "ft_strcmp") == 0)){
        srand(time(NULL));

        for (int i = 0; i < 100; i++){
            int size = rand() % 50;
            int size2 = rand() % 50;
            char *str = malloc(sizeof(char) * size + 1);
            char *str2 = malloc(sizeof(char) * size2 + 1);
            for (int y = 0; y < size; y++){
                char c = rand() % 256;
                str[y] = c;
            }
            str[size] = '\0';
            for (int y = 0; y < size2; y++){
                char c = rand() % 256;
                str2[y] = c;
            }
            str2[size2] = '\0';

            int a = strcmp(str, str2);
            int b = ft_strcmp(str, str2);
            if ((a == 0 && b == 0) || (a > 0 && b > 0) || (a < 0 && b < 0)){
                printf("\033[0;32m strcmp = %d ; mon strcmp = %d\n \033[0m", a, b);
            }else{
                printf("\033[0;31m strcmp = %d ; mon strcmp = %d\n \033[0m", a, b);
            }
            free(str);
            free(str2);
        }
		 char chain_vide[1] = "";
 
          int a = ft_strcmp(chain_vide, chain_vide);
          int abis = strcmp(chain_vide, chain_vide);
          printf("\n lib:%d  mylib:%d \n",a, abis);
  
          int b = ft_strcmp("0", chain_vide);
          int bbis = strcmp("0", chain_vide);
          printf("\n lib:%d  mylib:%d \n",b, bbis);
  
          int c = ft_strcmp(chain_vide, "0");
          int cbis = strcmp(chain_vide, "0");
          printf("\n lib:%d  mylib:%d \n",c, cbis);
    }
    else if(argc == 2 && (strcmp(argv[1], "ft_write") == 0)){
        char *str = "Hello, World!";
        strlen(str);
        ft_write(1, str, strlen(str));
        char *shortStr = "Hi!\n";
        char *longStr = "This is a longer string to test the write function.\n";
        ft_write(1, shortStr, strlen(shortStr));
        ft_write(1, longStr, strlen(longStr));
        char *emptyStr = "";
        ft_write(1, emptyStr, strlen(emptyStr));
        char *specialStr = "Hello,\nWorld!\tTabbed.\n";
        ft_write(1, specialStr, strlen(specialStr));
        char *str2 = "This should fail.\n";
        int err = ft_write(-1, str2, strlen(str2));
        if (err < 0)
            printf("error = %s\n",strerror(errno));
        int fd = open("testfile.txt", O_WRONLY | O_CREAT, 0644);
        if (fd != -1) {
            char *fileStr = "Writing to a file.";
            ft_write(fd, fileStr, strlen(fileStr));
            close(fd);
        }
        char *partialStr = "This string is longer than the buffer size.\n";
        ft_write(1, partialStr, 10);
    }
    else if(argc == 2 && (strcmp(argv[1], "ft_read") == 0)){
        int fd = open("testfile.txt", O_RDONLY);
        if (fd != -1) {
            char buffer[20];
            ssize_t bytesRead = ft_read(fd, buffer, sizeof(buffer) - 1);
            if (bytesRead >= 0) {
                buffer[bytesRead] = '\0'; // Assurez-vous que la chaîne est terminée
                printf("Read: %s\n", buffer);
            }
            close(fd);
        }
        char buffer[50];
        printf("Enter some text: ");
        ssize_t bytesRead2 = ft_read(0, buffer, sizeof(buffer) - 1);
        if (bytesRead2 >= 0) {
            buffer[bytesRead2] = '\0';
            printf("You entered: %s\n", buffer);
        }

        char buffer2[20];
        int bytesRead3 = ft_read(-1, buffer2, sizeof(buffer2) - 1); // -1 est un descripteur de fichier non valide
        if (bytesRead3 == -1) {
            printf("error = %s\n", strerror(errno));
        }
    }
    else if(argc == 2 && (strcmp(argv[1], "ft_strdup") == 0)){
        srand(time(NULL));

        for (int i = 0; i < 100; i++){
            int size = rand() % 50;
            char *str = malloc(sizeof(char) * size + 1);
            for (int y = 0; y < size; y++){
                char c = rand() % 256;
                str[y] = c;
            }
            str[size] = '\0';

            char *str2 = ft_strdup(str);
            char *str3 = strdup(str);

            int a = strcmp(str2, str3);

            if (a == 0){
                printf("\033[0;32m strdup = %s ; mon strdup = %s\n \033[0m", str3, str2);
            }else{
                printf("\033[0;31m strdup = %s ; mon strdup = %s\n \033[0m", str3, str2);
            }
            if (str != NULL) free(str);
            if (str2 != NULL) free(str2);
            if (str3 != NULL) free(str3);
        }
		 char l[1] = "";
         char *lib = strdup(l);
         char *myLib = ft_strdup(l);
         printf("chaine de charactere vide lib:%s, mylib:%s\n", lib, myLib);
         free(lib);
         free(myLib);
    }
    




    // char *a = ft_strdup("");
    // if (a == NULL)
    //     return (0);
    // printf("a = %s\n", a);
    // free(a);

    // int a = ft_atoi_base_test("\n\n++-abcdg", "abcd");
    // printf("%d\n", a);
    
    //  int b = ft_atoi_base("\n\n++-abcdg", "abcd");
    // printf("%d\n", b);

    // int b = atoi("-1");
    // printf("%d\n", b);
    // printf("la taille de sizeOf est de %ld\n",sizeof(t_list));

    // char *lala = malloc_str("clear");
    // t_list *raph = ft_create_elem(lala);
    // printf("raph te dis %s\n", (char *)raph->data);

    // ft_list_push_front(&raph, malloc_str("clear"));
    // ft_list_push_front(&raph, malloc_str("lili"));
    // ft_list_push_front(&raph, malloc_str("clear"));
    // ft_list_push_front(&raph, malloc_str("clear"));
    //ft_list_push_front(&raph, "jiji");
    // printf("raph te dis %s\n", (char *)raph->data);

    // while (raph != NULL)
    // {
    //     printf("raph te dis %s\n", (char *)raph->data);
    //     t_list *raph2 = raph->next;
    //     // free(raph);
    //     raph = raph2;
    // }

    // t_list *raphifou = NULL;    

    // int size = ft_list_size(raph);
    // printf("size = %d\n", size);
    // // ft_list_sort(&raph, ft_strcmp);
    
    // int l = ft_list_remove_if(&raph, "clear", ft_strcom, free);

    // printf("remove = %d\n", l);

    // while (raph != NULL)
    // {
    //     printf("raph te dis %s\n", (char *)raph->data);
    //     t_list *raph2 = raph->next;
    //     free(raph->data);
    //     free(raph);
    //     raph = raph2;
    // }
}




/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/23 14:02:00 by rkhelif           #+#    #+#             */
/*   Updated: 2021/06/01 16:34:20 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


// #include "libasm.h"


// int	main(int argc, char **argv)
// {
// 	int		rest;
// 	int		count;
// 	int		start;
// 	char	dest[10];
// 	char	dest2[10];
// 	int		err;
// 	int		fd;
// 	char	buf[200];
// 	char	*str;

// 	start = argc;
// 	count = -1;
// 	printf("ft_strlen\n\n");
// 	while (argc > ++count)
// 	{
// 		printf("%lu\n", strlen(argv[count]));
// 		printf("%lu\n", ft_strlen(argv[count]));
// 		printf("-------------------------------------------------------------\n");
// 	}
// 	argc = start;
// 	count = -1;
// 	printf("ft_strcpy\n\n");
// 	while (argc > ++count)
// 	{
// 		printf("%s\n", strcpy(dest, argv[count]));
// 		printf("%s\n", ft_strcpy(dest2, argv[count]));
// 		bzero(dest, 10);
// 		bzero(dest2, 10);
// 		printf("-------------------------------------------------------------\n");
// 	}

// 	printf("ft_strcmp\n\n");
// 	printf("%d\n", strcmp("raph", "raph"));
// 	printf("%d\n", ft_strcmp("raph", "raph"));
// 	printf("-------------------------------------------------------------\n");
// 	printf("%d\n", strcmp("1", "2"));
// 	printf("%d\n", ft_strcmp("1", "2"));
// 	printf("-------------------------------------------------------------\n");
// 	printf("%d\n", strcmp("raph", "aph"));
// 	printf("%d\n", ft_strcmp("raph", "aph"));
// 	printf("-------------------------------------------------------------\n");
// 	printf("%d\n", strcmp("", ""));
// 	printf("%d\n", ft_strcmp("", ""));
// 	printf("-------------------------------------------------------------\n");

// 	printf("\nft_write\n\n");

// 	rest = write(-1, "taaaaaaaa",9);
// 	err = errno;
// 	errno = 0;
// 	printf("%s\n", strerror(err));
// 	printf("rest = %d\n", rest);
// 	rest = ft_write(-1, "taaaaaaaa",9);
// 	err = errno;
// 	errno = 0;
// 	printf("%s\n", strerror(err));
// 	printf("rest = %d\n\n", rest);

// 	rest = write(1, "ta",-1);
// 	err = errno;
// 	errno = 0;
// 	printf("%s\n", strerror(err));
// 	printf("rest = %d\n", rest);
// 	rest = ft_write(1, "ta",-1);
// 	err = errno;
// 	errno = 0;
// 	printf("%s\n", strerror(err));
// 	printf("rest = %d\n", rest);
	

// 	printf("\n\nft_read\n\n");


// 	fd = open("main.c", O_RDONLY);
// 	ft_read(fd, buf, 199);
// 	printf("%s\n", buf);
// 	close(fd);
// 	fd = open("main.c", O_RDONLY);
// 	read(fd, buf, 199);
// 	printf("%s\n", buf);
// 	close(fd);

// 	fd = open("main.c", O_RDONLY);
// 	if (ft_read(250, buf, 100) < 0)
// 		printf("%s\n", strerror(errno));

// 	fd = open("main.c", O_RDONLY);
// 	read(250, buf, 100);
// 	printf("%s\n", strerror(errno));
	
// 	if (read(fd, NULL, 100) < 0)
// 		printf("%s\n", strerror(errno));
// 	if (ft_read(fd, NULL, 100) < 0)
// 		printf("%s\n", strerror(errno));

// 	printf("\nft_strdup\n\n");
	
// 	count = -1;
// 	while (argc > ++count)
// 	{
// 		str = strdup(argv[count]);
// 		printf("%s\n", str);
// 		free(str);
// 		str = NULL;
// 	}
// 	return (0);
// }