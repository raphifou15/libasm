/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_parse_int.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/03 16:55:45 by rkhelif           #+#    #+#             */
/*   Updated: 2021/05/06 09:49:45 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>

void	ft_putchar(char c)
{
	write(1, &c, 1);
}

char	*ft_strcpy(char *dest, char *src)
{
	int	i;

	i = -1;
	while (src[++i] != '\0')
		dest[i] = src[i];
	dest[i] = '\0';
	return (dest);
}

void	ft_putnbr_base(long nbr, int  base, char *base2)
{
	long	nb;

	(nbr < 0) ? ft_putchar('-') : 0;
	nb = (nbr < 0) ? nbr * -1 : nbr;
	(nb > base - 1) ? ft_putnbr_base(nb / base, base, base2) : 0;
	(nb > base - 1) ? ft_putchar(base2[nb % base]) : ft_putchar(base2[nb]);
}

void	ft_parse_int(long nbr, ...)
{
	va_list		list;
	int			i;
	long		nb;
	int			base;
	char		base2[18];

	ft_strcpy(base2, "0123456789ABCDEF");
	base = 10;
	i = -1;
	va_start(list, nbr);
	nb = nbr;
	base = va_arg(list, int);
	if (base != 2 && base != 16)
		base = 10;
	ft_putnbr_base(nb, base, base2);
	va_end(list);
}

int		main(int argc, char *argv[])
{
	(void)argc;
	ft_parse_int(atol(argv[1]), atoi(argv[2]));
	return (0);
}
