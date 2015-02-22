include <ConfigurationParameters.scad>;

module rotated_menger_negative()
{
	for (a_degrees = NEGATIVE_MENGER_SPONGE_ROTATION)
	{
		rotate(a_degrees)
		{
			generate_menger_negative(EDGE_SIZE, EDGE_SIZE, FRACTAL_DEPTH);
		}
	}
}

module generate_menger_negative(side = DEFAULT_SIDE_SIZE,
										maxside = DEFAULT_MAX_SIDES,
										level = DEFAULT_DEPTH_LEVEL)
{
	side = side / REGULAR_SIDE_SPLIT;
	draw_negative_menger(side, maxside);
	translate_negative_menger(side, maxside, level);
}

module draw_negative_menger(side, maxside)
{
	x_side = maxside * DIMENSION;
	size = [x_side, side, side];

  	cube(size, CENTERED);
}

module translate_negative_menger(side, maxside, level)
{
  	if (level > LEVEL_GRANULARITY)
	{
		for (y_sign = BLOCK_RANGE)
		{
			for (z_sign = BLOCK_RANGE)
			{
				if (y_sign || z_sign)
				{
					translate(
						[ORIGIN,
						y_sign * side,
						z_sign * side])
					{
          			generate_menger_negative(
							side,
							maxside,
							level - LEVEL_GRANULARITY
						);
					}
				}
			}
		}
  	}
}