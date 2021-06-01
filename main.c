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


#include "libasm.h"

int	main(int argc, char **argv)
{
	int		rest;
	int		count;
	int		start;
	char	dest[10];
	char	dest2[10];
	int		err;
	int		fd;
	char	buf[200];
	char	*str;

	start = argc;
	count = -1;
	printf("ft_strlen\n\n");
	while (argc > ++count)
	{
		printf("%lu\n", strlen(argv[count]));
		printf("%lu\n", ft_strlen(argv[count]));
		printf("-------------------------------------------------------------\n");
	}
	argc = start;
	count = -1;
	printf("ft_strcpy\n\n");
	while (argc > ++count)
	{
		printf("%s\n", strcpy(dest, argv[count]));
		printf("%s\n", ft_strcpy(dest2, argv[count]));
		bzero(dest, 10);
		bzero(dest2, 10);
		printf("-------------------------------------------------------------\n");
	}

	printf("ft_strcmp\n\n");
	printf("%d\n", strcmp("raph", "raph"));
	printf("%d\n", ft_strcmp("raph", "raph"));
	printf("-------------------------------------------------------------\n");
	printf("%d\n", strcmp("1", "2"));
	printf("%d\n", ft_strcmp("1", "2"));
	printf("-------------------------------------------------------------\n");
	printf("%d\n", strcmp("raph", "aph"));
	printf("%d\n", ft_strcmp("raph", "aph"));
	printf("-------------------------------------------------------------\n");
	printf("%d\n", strcmp("", ""));
	printf("%d\n", ft_strcmp("", ""));
	printf("-------------------------------------------------------------\n");

	printf("\nft_write\n\n");

	rest = write(-1, "taaaaaaaa",9);
	err = errno;
	errno = 0;
	printf("%s\n", strerror(err));
	printf("rest = %d\n", rest);
	rest = ft_write(-1, "taaaaaaaa",9);
	err = errno;
	errno = 0;
	printf("%s\n", strerror(err));
	printf("rest = %d\n\n", rest);

	rest = write(1, "ta",-1);
	err = errno;
	errno = 0;
	printf("%s\n", strerror(err));
	printf("rest = %d\n", rest);
	rest = ft_write(1, "ta",-1);
	err = errno;
	errno = 0;
	printf("%s\n", strerror(err));
	printf("rest = %d\n", rest);
	

	printf("\n\nft_read\n\n");


	fd = open("main.c", O_RDONLY);
	ft_read(fd, buf, 199);
	printf("%s\n", buf);
	close(fd);
	fd = open("main.c", O_RDONLY);
	read(fd, buf, 199);
	printf("%s\n", buf);
	close(fd);

	fd = open("main.c", O_RDONLY);
	if (ft_read(250, buf, 100) < 0)
		printf("%s\n", strerror(errno));

	fd = open("main.c", O_RDONLY);
	read(250, buf, 100);
	printf("%s\n", strerror(errno));
	
	if (read(fd, NULL, 100) < 0)
		printf("%s\n", strerror(errno));
	if (ft_read(fd, NULL, 100) < 0)
		printf("%s\n", strerror(errno));

	printf("\nft_strdup\n\n");
	
	count = -1;
	while (argc > ++count)
	{
		str = strdup(argv[count]);
		printf("%s\n", str);
		free(str);
		str = NULL;
	}
	return (0);
}
