/////////////////////////////////////////////////////////////////////////////////
// Floor protection for cuvette.
//
// Author:              Maximilian Stiefel
// Last modification:   12.06.2017
/////////////////////////////////////////////////////////////////////////////////

include <roundy.scad>
use <roundy.scad>

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
// Allowance
allowance05 = 0.5;
allowance1 = 1;
allowance2 = 2;

// Dimensions cuvette
glass_thickness = 6;
cuvette_width = 180 + 2*glass_thickness + allowance2;
cuvette_depth = 50 + 2*glass_thickness + allowance2;

// Dimensions lid
lid_thickness = 4;
lid_width = 180 + 2*glass_thickness + 2*lid_thickness + allowance2;
lid_depth = 50 + 2*glass_thickness + 2*lid_thickness + allowance2;
lid_height = 20;

// My color for everything
myColor = "FireBrick";

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
color(myColor)
difference()
{
	union()
	{
		// Basic lid
		translate([0, 0, lid_height/2])
		roundy(lid_width, lid_depth, lid_height, true);
		translate([-lid_width/2 + 5, -lid_depth/2 + 2, lid_height/2])
		rotate([90, 0, 0])
		linear_extrude(height = 6, center = true, convexity = 10, twist = 0)
		union()
		{
		translate([0, 4, 0])
		text("Etching Machine of the Embedded Systems Master", size = 6, valign = "center");
		translate([0, -4, 0])
		text("Designed by Maximilian Stiefel 2017", size = 6, valign = "center");
		}
	}
	// Depening to put it over the cuvette
	translate([0, 0, lid_height - lid_thickness])
	cube([cuvette_width, cuvette_depth, lid_height], center = true);
}
