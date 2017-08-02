/////////////////////////////////////////////////////////////////////////////////
// Glass slide holder to be mounted on the PCB. 
//
// Author:              Maximilian Stiefel
// Last modification:   29.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////////

// Dimesnions
include <dimensions.scad>
use <dimensions.scad>

// Dimesnions
include <screw_sinkings.scad>
use <screw_sinkings.scad>

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
module glass_holder()
{
	//translate([0, 0, holder_height/2 + leg_height -0.01])
	difference()
	{
		// Main body
		cube([holder_width, holder_depth, holder_height], center = true);
		union()
		{
			// Cut glass slide out and make an entrance
			translate([-2.5, 0, holder_bottom_side_thickness])
			cube([glass_slide_width + allowance05 + 5, glass_slide_depth + allowance05, holder_height], center = true);
			// Cut out a cylinder for the LED
			translate([glass_slide_width/2 - led_pos_x, 0, 0])
			cylinder(r = led_illuminator_dia/2, h = 20, center = true);
			// Cut out a "window" where the receiver photodiode is sitting
			translate([glass_slide_width/2 - led_pos_x, glass_slide_depth/2, 2])
			cube([window_size, 10, 10], center = true);	
			// Cut out holes for screws
			translate([0, 0, -holder_bottom_side_thickness + 0.5])
			rotate([180, 0, 0])
			screw_sinkings(glass_slide_width - 2*leg_pos_x, 0, drill_sinking_dia1_m3, drill_sinking_dia2_m3, drill_sinking_height_m3);
		}
	}
}
