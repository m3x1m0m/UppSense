/////////////////////////////////////////////////////////////////////////////////
// Module for the top and bottom lid.
//
// Author: 		Maximilian Stiefel
// Last modification: 	28.07.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////////

// Dimesnions
include <dimensions.scad>
use <dimensions.scad>

// Module to make a nice round box
include <roundy.scad>
use <roundy.scad>

// Module for screw holes
include <screw_holes.scad>
use <screw_holes.scad>

// Module for screw holes
include <screw_sinkings.scad>
use <screw_sinkings.scad>


module lid_t_b()
{
/////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////
translate([0, 0, -lids_depth/2])
rotate([180, 0, 0])
difference()
{
	// Main body for the lid
	union()
	{
		roundy(lid_t_b_x - allowance05, lid_t_b_y - allowance05, lids_depth);
		translate([0, 0, housing_thickness/2 - 0.01])
		cube([lid_t_b_width - allowance05, lid_t_b_height - allowance05, housing_thickness - lids_depth], center = true);
	}

	union()
	{
		// Cut out cylindric holes
		screw_holes(lid_t_b_holes_x, lid_t_b_holes_y, drill_dia_m3, 2*lids_depth);
		translate([0, 0, -lids_depth/2 + drill_sinking_height_m3/2 + 0.5])
		screw_sinkings(lid_t_b_holes_x, lid_t_b_holes_y, drill_sinking_dia1_m3, drill_sinking_dia2_m3, drill_sinking_height_m3);
	}
}
}
