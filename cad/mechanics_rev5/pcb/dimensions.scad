/////////////////////////////////////////////////////////////////////////////////
// File for all dimensions, so they can be changed globally.
//
// Author:              Maximilian Stiefel
// Last modification:   29.07.2017
/////////////////////////////////////////////////////////////////////////////////

allowance03 = 0.3;
allowance05 = 0.5;
allowance1 = 1;

// Glass dimensions
glass_slide_height = 1;
glass_slide_depth = 26 + allowance05;
glass_slide_width = 76;

// Holder dimensions
window_size = 25;
holder_height = 3 + glass_slide_height + allowance05;
holder_depth = glass_slide_depth + allowance05 + 4;
holder_width = 80; // Width of the PCB
echo(holder_height=holder_height);
holder_bottom_side_thickness = 2;

// LED illuminator dimensions
led_illuminator_thickness = 2; 
led_illuminator_dia = 12.5 - led_illuminator_thickness;
led_illuminator_height = 9;
led_illuminator_leg1_pos_y = -6.25;
led_illuminator_leg2_pos_y = 4;
led_illuminator_leg2_pos_x = -4.75;
led_illuminator_leg_dia = 2.2 - allowance05; 
led_illuminator_leg_height = 2;
led_pos_x = 18;
led_pos_y = 13;
led_illuminator_slot = 4;
led_illuminator_angle = 35;

// Screw dimensions
drill_dia_m3 = 3.2;
drill_depth = 7;
drill_sinking_dia1_m3 = 5.5;
drill_sinking_dia2_m3 = 3;
drill_sinking_height_m3 = 2;

// Leg dimensions
leg_width = 7;
leg_depth = 13;
leg_height = led_illuminator_height;
leg_inner_dia = 2.5;
leg_pos_y = 13;
leg_pos_x = 2.5;
leg_distance = 6.5;
leg_diff1 = leg_depth - leg_distance;
//leg_drill_depth = 7;
leg_drill_depth = leg_height + 1;

myColor1 = "Grey";
