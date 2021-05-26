/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/07 15:00:33 by rkhelif           #+#    #+#             */
/*   Updated: 2021/05/07 15:24:26 by rkhelif          ###   ########.fr       */
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
	int	i;

	i = -1;
	while (str[++i] != '\0')
		;
	return (i);
}

int		main(int argc, char **argv)
{
	int	nb;

	if (argc != 2)
		return (0);
	nb = ft_strlen(argv[1]);
	ft_putnbr(nb);
	return (0);
}
