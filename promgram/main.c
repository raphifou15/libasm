/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/30 15:08:07 by rkhelif           #+#    #+#             */
/*   Updated: 2021/04/30 15:21:53 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int	main(void)
{
	unsigned long long	x = 0x0000000000000042;
	unsigned long long	*x_p = &x;
	unsigned int		*y_p = (unsigned int *)x_p;
	unsigned int		y = *y_p;
	printf("litle-endian\n");
	printf("y = %#.8x\n", y);
	printf("\n\n");
	printf("big-endian\n");
	x = __builtin_bswap64(0x0000000000000042);
	x_p = &x;
	y_p = (unsigned int *)x_p;
	y = __builtin_bswap32(*y_p);
	printf("y = %#.8x\n", y);
}
