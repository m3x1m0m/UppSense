/////////////////////////////////////////////////////////////////////////////////
// Main file to assemble everything.
//
// Author:              Maximilian Stiefel
// Last modification:   07.07.2017
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

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
color(myColor1)
difference()
{
	roundy(housing_outside_width, housing_outside_depth, housing_outside_height);
	union()
	{
		// Cut out all six sides
		// Left and right
		cube([housing_inside_width + 3*housing_thickness, lid_l_r_width, lid_l_r_height], center = true);
		// Front and back
		cube([housing_inside_width, housing_inside_depth + 3*housing_thickness, housing_inside_height], center = true);
		// Top and bottom
		cube([housing_inside_width, housing_inside_depth, housing_inside_height + 3*housing_thickness], center = true);

		// Cut deepenings for lids
		// Left and right
		for(x = [-1, 1])
		translate([x*housing_outside_width/2 - x*lids_depth + x, 0, 0])
		rotate([0, 90, 0])
		roundy(lid_l_r_height + lid_l_r_overlap, lid_l_r_width + lid_l_r_overlap, lids_depth + 2, center = true);
		// Front and back
		for(y = [-1, 1])
		translate([0, y*housing_outside_depth/2 - y*lids_depth + y, 0])
		rotate([90, 0, 0])
		cube([lid_f_b_width, lid_f_b_height, housing_thickness/4 + 2], center = true);	
		// Top and bottom
		for(z = [-1, 1])
		translate([0, 0, z*housing_outside_height/2 - z*lids_depth + z])
		roundy(housing_inside_width + (3/2)*housing_thickness, housing_inside_depth + (3/2)*housing_thickness, housing_thickness/4 + 2);
	
		// Screw holes
		// Left and right
		for(x = [-1, 1])
		translate([x*housing_outside_width/2 - x*housing_thickness/2, 0, 0])
		rotate([90, 0, 90])
		screw_holes(lid_l_r_width + (1/2)*lid_l_r_overlap, lid_l_r_height + (1/2)*lid_l_r_overlap, drill_dia_m3, housing_thickness/2);

		// Top and bottom
		for(z = [-1, 1])
		translate([0, 0, z*housing_outside_height/2 - z*0.95*housing_thickness/2])
		screw_holes(housing_outside_width - (4/3)*housing_thickness, housing_outside_depth - (4/3)*housing_thickness, drill_dia_m3, housing_thickness/2);
			
	}
}
