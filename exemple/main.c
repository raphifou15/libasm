/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/20 11:06:42 by rkhelif           #+#    #+#             */
/*   Updated: 2021/05/20 12:45:08 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int	maxofthree(int a, int b, int c);

int	main(void)
{
	printf("%d\n", maxofthree(1, -4, -7));
	printf("%d\n", maxofthree(12, 45, -345));
	printf("%d\n", maxofthree(145, -4, 456));
	printf("%d\n", maxofthree(10, 11, 12));
	printf("%d\n", maxofthree(-1, 0, -2));
	return (0);
}
