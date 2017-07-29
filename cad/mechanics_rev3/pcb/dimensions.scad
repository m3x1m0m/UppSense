/////////////////////////////////////////////////////////////////////////////////
// File for all dimensions, so they can be changed globally.
//
// Author:              Maximilian Stiefel
// Last modification:   29.07.2017
/////////////////////////////////////////////////////////////////////////////////

allowance05 = 0.5;

// Glass dimensions
glass_slide_height = 1;
glass_slide_depth = 26 + allowance05;
glass_slide_width = 76;

// Holder dimensions
window_size = 20;
holder_height = 3 + glass_slide_height + allowance05;
holder_depth = glass_slide_depth + allowance05 + 4;
holder_width = 80; // Width of the PCB
echo(holder_height=holder_height);

// LED illuminator dimensions
led_illuminator_dia = 10;
led_illuminator_height = 15;
led_pos_x = 18;
led_pos_y = 13;
led_illuminator_thickness = 2; 
led_illuminator_slot = 4;
led_illuminator_angle = 35;

leg_outer_dia = 5;
leg_inner_dia = 2.5;
leg_height = led_illuminator_height;
leg_pos_y = 13;
leg_pos_x = 2.5;
leg_distance = 6.5;
leg_drill_depth = 7;

myColor1 = "LimeGreen";
