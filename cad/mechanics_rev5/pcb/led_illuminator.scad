/////////////////////////////////////////////////////////////////////////////////
// Illuminator for LED to keep the UV light away from the photodiode. 
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
			cylinder(r = led_illuminator_dia/2 + led_illuminator_thickness, h = led_illuminator_height + allowance03, center = true);
			// The two legs	
			translate([0, led_illuminator_leg1_pos_y, - (led_illuminator_height + led_illuminator_leg_height)/2 - 0.01 ])
			cylinder(r = (led_illuminator_leg_dia)/2, h = led_illuminator_leg_height, center = true);
			translate([led_illuminator_leg2_pos_x, led_illuminator_leg2_pos_y, - (led_illuminator_height + led_illuminator_leg_height)/2 - 0.01 ])
			cylinder(r = (led_illuminator_leg_dia)/2, h = led_illuminator_leg_height, center = true);
		}
		union()
		{
			// Cut out inner cylinder
			cylinder(r = led_illuminator_dia/2, led_illuminator_height + +allowance03 + 0.01, center = true);	
			// Cut out slot
			rotate([0, 0, led_illuminator_angle + 180])
			translate([led_illuminator_dia/2, 0, -led_illuminator_height/2 - 0.01])
			cube([led_illuminator_dia/2, led_illuminator_slot, led_illuminator_height], center = true);
		}
	}
}

