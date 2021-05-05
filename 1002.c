#include <stdio.h>

typedef struct	location
{
	int x;
	int y;
} loc;

typedef struct	ab_location
{
	int a1;
	int b1;
	int a2;
	int b2;
} r_ab;


loc		g_location_A[12];
loc		g_location_B[12];

int		ft_fitagoras_a(int r, loc N)
{
	int a;
	int b;

	a = N.x - r + 1;
	b = 2*a / 2;
	while (a < (N.x + r) && a > (N.x - r))
	{
		while (b < a + 1 && b > a - 1 )
		{
			if ( (a * a) + (b * b)  == r*r )
			{
				if (a < 0)
					a *= -1;
				return (a);
			}
			b++;
		}
		b = 2*a / 2;
		a++;
	}
	if (a == r)
		return (0);
	return (0);
}

int		ft_fitagoras_b(int r, loc N)
{
	int a;
	int b;

	a = N.x -r + 1;
	b = N.y -r + 1;
	while (a < (N.x + r) && a > (N.x - r))
	{
		while ( b < a + 1 && b > a - 1 )
		{
			if ( (a * a) + (b * b)  == r*r )
			{
				if (b < 0)
					b *= -1;
				return (b);
			}
			b++;
		}
		b = 2*a / 2;
		a++;
	}
	if (a == r)
		return (0);
	return (0);
}

	
void		ft_location_A(loc N, int r, r_ab ab)
{
	g_location_A[0].x = N.x - r;
	g_location_A[0].y = N.y;

	g_location_A[1].x = N.x + r;
	g_location_A[1].y = N.y;

	g_location_A[2].x = N.x;
	g_location_A[2].y = N.y - r;

	g_location_A[3].x = N.x;
	g_location_A[3].y = N.y + r;

	g_location_A[4].x = ab.a1;
	g_location_A[4].y = ab.b1;

	g_location_A[5].x = ab.a1;
	g_location_A[5].y = ab.b1 * -1;

	g_location_A[6].x = ab.a1 * -1;
	g_location_A[6].y = ab.b1;

	g_location_A[7].x = ab.a1 * -1;
	g_location_A[7].y = ab.a1 * -1;

	g_location_A[8].x = ab.b1;
	g_location_A[8].y = ab.a1;

	g_location_A[9].x = ab.b1;
	g_location_A[9].y = ab.a1 * -1;

	g_location_A[10].x = ab.b1 * -1;
	g_location_A[10].y = ab.a1;

	g_location_A[11].x = ab.b1 * -1;
	g_location_A[11].y = ab.a1 * -1;
}

void		ft_location_B(loc N, int r, r_ab ab)
{
	g_location_B[0].x = N.x - r;
	g_location_B[0].y = N.y;

	g_location_B[1].x = N.x + r;
	g_location_B[1].y = N.y;

	g_location_B[2].x = N.x;
	g_location_B[2].y = N.y - r;

	g_location_B[3].x = N.x;
	g_location_B[3].y = N.y + r;

	g_location_B[4].x = ab.a2;
	g_location_B[4].y = ab.b2;

	g_location_B[5].x = ab.a2;
	g_location_B[5].y = ab.b2 * -1;

	g_location_B[6].x = ab.a2 * -1;
	g_location_B[6].y = ab.b2;

	g_location_B[7].x = ab.a2 * -1;
	g_location_B[7].x = ab.a2 * -1;

	g_location_B[8].x = ab.b2;
	g_location_B[8].y = ab.a2;

	g_location_B[9].x = ab.b2;
	g_location_B[9].y = ab.a2 * -1;

	g_location_B[10].x = ab.b2 * -1;
	g_location_B[10].y = ab.a2;

	g_location_B[11].x = ab.b2 * -1;
	g_location_B[11].y = ab.a2 * -1;
}


int 		main ()
{
	int T;
	loc A;
	loc B;
	r_ab ab; 
	int r1;
	int r2;
	int i;
	int j;
	int count;

	scanf("%d", &T);
	
	while (T)
	{
		scanf("%d %d %d %d %d %d", 
			&A.x, &A.y, &r1, &B.x, &B.y, &r2);

		if (A.x == B.x && A.y == B.y && r1 == r2)
		{
			printf("-1");
			return (0);
		}

		ab.a1 = ft_fitagoras_a(r1, A);
		ab.b1 = ft_fitagoras_b(r1, A);
		ab.a2 = ft_fitagoras_a(r2, B);
		ab.b2 = ft_fitagoras_b(r2, B);

		printf("a1 : %d || b1 : %d\n", ab.a1, ab.b1);
		printf("a2 : %d || b2 : %d\n", ab.a2, ab.b2);

		ft_location_A(A, r1, ab);
		ft_location_B(B, r2, ab);
		if (ab.a1 == 0 || ab.a2 == 0 || ab.b1 == 0 || ab.b2 == 0)
		{
			i = 0;
			j = 0;
			while (i < 4)
			{
				while (j < 4)
				{
					if (g_location_A[i].x == g_location_B[j].x 
							&& g_location_A[i].y == g_location_B[j].y)
						count++;
					j++;
				}
				j = 0;
				i++;
			}
		}

		else
		{
			i = 0;
			j = 0;
			while (i < 12)
			{
				while (j < 12)
				{
					if (g_location_A[i].x == g_location_B[j].x
							&& g_location_A[i].y == g_location_B[j].y)
						count++;
					j++;
				}
				j = 0;
				i++;
			}
		}
		printf("%d %d\n", g_location_A[4].x, g_location_B[6].x);
		printf("%d %d\n", g_location_A[4].y, g_location_B[6].y);

		printf("%d\n", count);
		count = 0;
		T--;
	}
	return (0);
}
