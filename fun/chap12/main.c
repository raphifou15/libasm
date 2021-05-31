/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkhelif <rkhelif@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/30 14:53:18 by rkhelif           #+#    #+#             */
/*   Updated: 2021/05/31 09:39:04 by rkhelif          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

int		ft_num(int *x);
void	ft_sort(int *arr, int len);
void	stats1(int *arr, int len, int *sum, int *ave);
void	stats2(int *arr, int len, int *min, int *med, int *max, int *sum, int *ave);

int	main(void)
{
//	int	x = -1;
	int	num;
	int	num2;
	int	arr[5] = {10, -10, 5, 10, 10};
//	int	arr2[5] = {-3, -34, 56, 45, 0};
//	int	arr3[5] = {-3, -34, 56, 45, 0};
//	int	arr4[5] = {-3, -34, 56, 45, 0};
	int	len = 5;
	int	med = 0;
	int	min = 0;
	int	max = 0;
	int	sum = 0;
	int	ave = 0;

	num = 5;
	num2 = ft_num(&num);
	printf("%d\n%d\n",num, num2);
	printf("------------------------------------------------------\n\n");
	//stats1(arr, len, &sum, &ave);
	stats2(arr, len, &min, &med, &max, &sum, &ave);
	printf("min = %d\nmax = %d\nmed = %d\nsum = %d\nave = %d\n", min, max, med, sum, ave);
	printf("\n-----------------------------------------\n");
	/*ft_sort(arr2, 5);
	ft_sort(arr3, 5);
	ft_sort(arr3, 5);
	ft_sort(arr4, 5);
	while (++x < 5)
		printf("%d\n", arr2[x]);
	x = -1;
	while (++x < 5)
		printf("%d\n", arr3[x]);
	x = -1;
	while (++x < 5)
		printf("%d\n", arr4[x]);*/
	return (0);
}
