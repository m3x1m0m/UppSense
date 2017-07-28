/////////////////////////////////////////////////////////////////////////////////
// Module for the box without lids just to structure the code a bit better.
//
// Author: 		Maximilian Stiefel
// Last modification: 	20.07.2017
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

// Module for orings
include <oring.scad>
use <oring.scad>



module box()
{
/////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////
difference()
{
        // Main body
        roundy(housing_outside_width, housing_outside_depth, housing_outside_height);
        union()
        {
                // Cut out all six sides
                // Left and right
                cube([housing_inside_width + 3*housing_thickness, lid_l_r_width, lid_l_r_height], center = true);
                // Front and back
                cube([lid_f_b_width, housing_inside_depth + 3*housing_thickness, lid_f_b_height], center = true);
                // Top and bottom
                cube([lid_t_b_width, lid_t_b_height, housing_inside_height + 3*housing_thickness], center = true);

                // Cut deepenings for lids
                // Left and right
                for(x = [-1, 1])
                translate([x*housing_outside_width/2 - x*lids_depth/2 + x*0.1, 0, 0])
                rotate([0, 90, 0])
                roundy(lid_l_r_height + lid_l_r_overlap, lid_l_r_width + lid_l_r_overlap, lids_depth + 0.2, center = true);
                // Front and back
                for(y = [-1, 1])
                translate([0, y*housing_outside_depth/2 - y*lids_depth/2 + y*0.1, 0])
                rotate([90, 0, 0])
                cube([lid_f_b_width + lid_f_b_overlap, lid_f_b_height + lid_f_b_overlap, lids_depth + 0.2], center = true);
                // Top and bottom
                for(z = [-1, 1])
                translate([0, 0, z*housing_outside_height/2 - z*lids_depth/2 + z*0.1])
                roundy(lid_t_b_width + lid_t_b_overlap, lid_t_b_height + lid_t_b_overlap, lids_depth + 0.2);

                // Screw holes
                // Left and right
                for(x = [-1, 1])
                translate([x*housing_outside_width/2 - x*drill_depth_m3, 0, 0])
                rotate([90, 0, 90])
                screw_holes(lid_l_r_holes_x, lid_l_r_holes_y, drill_dia_m3, 2*lids_depth);
                // Front and back
                for(y = [-1, 1])
                translate([0, y*housing_outside_depth/2 - y*drill_depth_m3, 0])
                rotate([90, 0, 0])
                screw_holes(lid_f_b_holes_x, lid_f_b_holes_y, drill_dia_m3, 2*lids_depth);
                // Top and bottom
                for(z = [-1, 1])
                translate([0, 0, z*housing_outside_height/2 - z*drill_depth_m3])
                screw_holes(lid_t_b_holes_x, lid_t_b_holes_y, drill_dia_m3, 2*lids_depth);

		// O-rings	
		// Left and right
                for(x = [-1, 1])
                translate([x*housing_outside_width/2 - x*lids_depth - x*oring_channel_depth/2, 0, 0])
                rotate([90, 0, 90])
                oring(oring_l_r_x, oring_l_r_y, oring_channel_width, oring_channel_depth);
		// Front and back
		for(y = [-1, 1])
                translate([0, y*housing_outside_depth/2 - y*lids_depth - y*oring_channel_depth/2, 0])
		rotate([90, 0, 0])
		oring(oring_f_b_x, oring_f_b_y, oring_channel_width, oring_channel_depth);
		// Top and bottom		
		for(z = [-1, 1])
                translate([0, 0, z*housing_outside_height/2 - z*lids_depth - z*oring_channel_depth/2])
		oring(oring_t_b_x, oring_t_b_y, oring_channel_width, oring_channel_depth);
	}
}
}
