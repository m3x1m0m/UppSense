/////////////////////////////////////////////////////////////////////////////////
// Module for the front and back lid.
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


module lid_f_b(logo)
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
		// Logo 
		// Can be turned off by setting logo to 0
		translate([-47.5, 15, -lids_depth/2 + 0.01])
		rotate([180, 0, 0])
		linear_extrude(height = logo*1)
		scale(0.95)
		import("logo.dxf");
		// Actual lid
		cube([lid_f_b_x - allowance05, lid_f_b_y - allowance05, lids_depth], center = true);
		translate([0, 0, housing_thickness/2 - 0.01])
		cube([lid_f_b_width - allowance05, lid_f_b_height - allowance05, housing_thickness - lids_depth], center = true);
		// Mounting cylinders
		translate([0, 0, (housing_thickness - lids_depth/2 + motherboard_mounting_h/2 - 0.01)])
		screw_holes(motherboard_mounting_x, motherboard_mounting_y, motherboard_mounting_d, motherboard_mounting_h);
	}

	union()
	{
		// Cut out cylindric holes for screws to mount the lid on the housing
		screw_holes(lid_f_b_holes_x, lid_f_b_holes_y, drill_dia_m3, 2*lids_depth);
		// Cut out sinking holes
		translate([0, 0, -lids_depth/2 + drill_sinking_height_m3/2 + 0.5])
		screw_sinkings(lid_f_b_holes_x, lid_f_b_holes_y, drill_sinking_dia1_m3, drill_sinking_dia2_m3, drill_sinking_height_m3);
		// Cut out drill holes in mounting cylinders
		translate([0, 0, (housing_thickness - lids_depth/2 + motherboard_mounting_h/2 - 0.01)])
                screw_holes(motherboard_mounting_x, motherboard_mounting_y, drill_thread_dia_m3, motherboard_mounting_h + 1); 
	}
}
}
