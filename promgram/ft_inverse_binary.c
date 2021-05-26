#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

void	ft_putchar(char c)
{
	write(1, &c, 1);
}

void	ft_putstr(char *str)
{
	int	i;

	i = -1;
	while (str[++i])
		write(1, &str[i], 1);
}

int		ft_strlen(char *str)
{
	int	length;

	length = -1;
	while (str[++length] != '\0')
		;
	return (length);
}

void	ft_strcpy_inverse(char *str2, char *str)
{
	int	i;

	i = -1;
	while(str[++i])
		str2[i] = (str[i] == '1') ? '0' : '1';
	str2[i] = '\0';
}
void	ft_add_1(char * str2, int length)
{
	while (str2[--length] != '0')
		;
	str2[length] = '1';
	while (str2[++length] != '\0')
		str2[length] = '0';
}

long	ft_power(int nb, int power)
{
	long res;

	res = 1;
	if (power == 0)
		return (1);
	while (--power >= 0)
		res = res * (long)nb;
	return (res);
}

long	ft_str2_to_numb(char *str, int length)
{
	long nb;
	int	power;

	nb = 0;
	power = -1;
	while (--length >= 0 && ++power != -1)
		nb += (str[length] == '0') ? ft_power(2, power) * 0 : ft_power(2, power) * 1;
	return (nb);
}

void	ft_putnbr(long nbr)
{
	long nb;

	nb = nbr;
	(nb < 0) ? ft_putstr("-") : 0;
	nb = (nb < 0) ? nb * -1 : nb;
	(nb > 9) ? ft_putnbr(nb / 10) : 0;
	(nb > 9) ? ft_putchar(nb % 10 + 48) : ft_putchar(nb + 48);
}

int	ft_inverse_binary(char *str)
{
	int		length;
	char	*str2;
	long	nb;

	length = ft_strlen(str);
	if ((str2 = malloc(sizeof(char) * (length + 1))) == NULL)
		return(-1);
	ft_strcpy_inverse(str2, str);
	ft_add_1(str2, length);
	ft_putstr(str2);
	write(1,"\n",1);
	nb = ft_str2_to_numb(str2, length);
	ft_putnbr(nb);
	free(str2);
	str2 = NULL;
	return (0);
}


int	main(int argc, char **argv)
{
	(void)argc; (void)argv;
	if (ft_inverse_binary(argv[1]) == -1)
		write(1,"malloc fail\n",12);
	return (0);
}
