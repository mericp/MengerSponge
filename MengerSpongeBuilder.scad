include <ConstantsFile.scad>;
include <MengerSpongeObject.scad>;
include <ConfigurationParameters.scad>;

module build_menger_sponge()
{ 
	difference()
	{
		rotated_menger_sponge();
		base_cube();
	}
}

module base_cube()
{
	translate([ORIGIN, ORIGIN, -EDGE_SIZE])
	{
		cube(2 * EDGE_SIZE, CENTERED);
	}
}