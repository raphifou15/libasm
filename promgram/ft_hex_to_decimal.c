/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_hex_to_decimal.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/06 10:11:32 by rkhelif           #+#    #+#             */
/*   Updated: 2021/05/06 11:00:50 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

void	ft_putchar(char c)
{
	write(1, &c, 1);
}


void	ft_putnbr(long nbr)
{
	(nbr < -1) ? ft_putchar('-') : 0;
	nbr = (nbr < -1) ? nbr * -1 : nbr;
	(nbr > 9) ? ft_putnbr(nbr / 10) : 0;
	(nbr > 9) ? ft_putchar(nbr % 10 + 48) : ft_putchar(nbr + 48);
}

int		changevalue(char c)
{
	if (c >= 48 && c <= 57)
		return (c - 48);
	else
		return (c - 65 + 10);
}

long	ft_power(int nbr, int power)
{
	long	res;
	
	res = 1;
	if (power == 0)
		return (1);
	while (--power >= 0)
		res = res * nbr;
	return (res);
}

int		ft_strlen(char *str)
{
	int	length;

	length = -1;
	while (str[++length] != '\0')
		;
	return (length);
}

long	atol_to_decimal(char *str, int length)
{
	long	nbr;
	int		power;
	
	power = -1;
	nbr = 0;
	while (--length >= 0)
		nbr += (long)changevalue(str[length]) * ft_power(16, ++power);
	return (nbr);
}

void	ft_hex_to_decimal(char  *str)
{
	long	nbr;
	int		length;

	length = ft_strlen(str);
	nbr = atol_to_decimal(str, length);
	ft_putnbr(nbr);
	ft_putchar('\n');
	ft_putnbr((int)nbr);
}


int		main(int argc, char **argv)
{
	if (argc != 2)
		return (0);
	ft_hex_to_decimal(argv[1]);
	return (0);
}
