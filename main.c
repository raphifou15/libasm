/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/23 14:02:00 by rkhelif           #+#    #+#             */
/*   Updated: 2021/05/23 19:53:04 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <strings.h>

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);

int	main(int argc, char **argv)
{
	int		count;
	int		start;
	char	dest[10];
	char	dest2[10];

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
	return (0);
}
