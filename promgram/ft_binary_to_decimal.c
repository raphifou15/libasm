/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_binary_to_decimal.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/05 19:26:33 by rkhelif           #+#    #+#             */
/*   Updated: 2021/05/05 19:57:40 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>

void	ft_putchar(char c)
{
	write(1, &c, 1);
}

void	ft_putnbr(int nbr)
{
	long	nb;

	nb = nbr;
	(nb < 0) ? ft_putchar('-') : 0;
	nb = (nb < 0) ? nb * -1 : nb;
	(nb > 9) ? ft_putnbr(nb / 10) : 0;
	(nb > 9) ? ft_putchar(nb % 10 + 48) : ft_putchar(nb + 48);
}

int		ft_strlen(char *str)
{
	int	length;

	length = -1;
	while (str[++length] != '\0')
		;
	return (length);
}

int		ft_power(int nb, int power)
{
	int	res;

	res = 1;
	if (power == 0)
		return (1);
	while (--power >= 0)
		res = res * nb;
	return (res);
}

int		ft_calcul(char *str, int length)
{
	int	power;
	int	nb;

	nb = 0;
	power = -1;
	while (--length >= 0 && ++power != -1)
		nb += (str[length] == '0') ? 0 : ft_power(2, power);
	return (nb);
}

void	ft_binary_to_decimal(char *str)
{
	int	length;
	int	nb;

	length = ft_strlen(str);
	nb = ft_calcul(str, length);
	ft_putnbr(nb);
}

int	main(int argc, char **argv)
{
	if (argc != 2)
		return (0);
	ft_binary_to_decimal(argv[1]);
	return (0);
}
