/////////////////////////////////////////////////////////////////////////////////
// Floor protection for cuvette.
//
// Author:              Maximilian Stiefel
// Last modification:   12.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////////
include <roundy.scad>
use <roundy.scad>
include <dimensions.scad>
use <dimensions.scad>

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
