include <ConstantsFile.scad>;
include <ConfigurationParameters.scad>;
include <NegativeMengerSpongeObject.scad>;

module menger_sponge()
{
	difference()
	{
    	cube(EDGE_SIZE, CENTERED);
    	rotated_menger_negative();
  	}
}

module rotated_menger_sponge()
{
	rotate(MENGER_SPONGE_ROTATION)
	{
		menger_sponge();
	}
}