/////////////////////////////////////////////////////////////////////////////////
// Illuminator for LED to keep the UV light away from the photodiode. 
//
// Author:              Maximilian Stiefel
// Last modification:   28.08.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////////

// Dimesnions
include <dimensions.scad>
use <dimensions.scad>

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
module illuminator()
{
	difference()
	{
		union()
		{
			// Main body
			difference()
			{
				cylinder(r = led_illuminator_dia/2 + led_illuminator_thickness, h = led_illuminator_height + allowance03, center = true);
				translate([0, led_illuminator_dia/2 + window_y, 0])
				cube([2*led_illuminator_dia, led_illuminator_dia, led_illuminator_height + 1], center = true);
			}
			// The two legs	
			translate([led_illuminator_leg1_pos_x, 0, - (led_illuminator_height + led_illuminator_leg_height)/2 - 0.01 ])
			cylinder(r = (led_illuminator_leg_dia)/2, h = led_illuminator_leg_height, center = true);
			translate([led_illuminator_leg2_pos_x, led_illuminator_leg2_pos_y, - (led_illuminator_height + led_illuminator_leg_height)/2 - 0.01 ])
			cylinder(r = (led_illuminator_leg_dia)/2, h = led_illuminator_leg_height, center = true);
		}
			difference()
			{
				cylinder(r = led_illuminator_dia/2 , h = led_illuminator_height + 1, center = true);
				translate([0, led_illuminator_dia/2 + window_y - led_illuminator_thickness, 0])
				cube([2*led_illuminator_dia, led_illuminator_dia, led_illuminator_height + 1], center = true);
			}	
}
}

