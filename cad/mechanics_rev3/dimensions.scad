/////////////////////////////////////////////////////////////////////////////////
// File for all dimensions, so they can be changed globally.
//
// Author:              Maximilian Stiefel
// Last modification:   07.07.2017
/////////////////////////////////////////////////////////////////////////////////

// Allowance
allowance5 = 5;
allowance1 = 1;

// Dimensions battery holder
battery_holder_width = 53.5;
battery_holder_depth = 50.5; 
battery_holder_height = 13;

// Dimensions motherboard
motherboard_width = 80;
motherboard_depth = 1.6;
motherboard_height = 50;

// Dimensions plugin boards
pluginboard_width = 80;
pluginboard_depth = 1.6;
pluginboard_height = 50;

// Dimensions magnet
extra_space_magnet = 10;

// Dimensions housing inside (cubic)
housing_inside_width = motherboard_width + allowance5;
housing_inside_depth = pluginboard_height + extra_space_magnet + allowance5;
housing_inside_height = motherboard_height + battery_holder_height + allowance5;

echo(housing_inside_width=housing_inside_width);
echo(housing_inside_depth=housing_inside_depth);
echo(housing_inside_height=housing_inside_height);

// Dimensions housing 
housing_thickness = 10; // Make it thick to avoid light comming through the walls
housing_outside_width = housing_inside_width + 2*housing_thickness;
housing_outside_depth = housing_inside_depth + 2*housing_thickness;
housing_outside_height = housing_inside_height + 2*housing_thickness;

echo(housing_outside_width=housing_outside_width);
echo(housing_outside_depth=housing_outside_depth);
echo(housing_outside_height=housing_outside_height);

// Colors
myColor1 = "DodgerBlue";
myColor2 = "Maroon";

// Screws
drill_dia_m3 = 2.5;

// Lids dimensions
lids_depth = housing_thickness/4;
 
lid_l_r_height = housing_inside_height/2;
lid_l_r_width = (3/4)*housing_inside_depth;
lid_l_r_overlap = (3/2)*housing_thickness; 

lid_f_b_width = housing_inside_width + (1.0)*housing_thickness;
lid_f_b_height = housing_inside_height + (1.0)*housing_thickness;
