/////////////////////////////////////////////////////////////////////////////////
// File for all dimensions, so they can be changed globally.
//
// Author:              Maximilian Stiefel
// Last modification:   07.07.2017
/////////////////////////////////////////////////////////////////////////////////

// Allowance
allowance15 = 15;
allowance10 = 10;
allowance5 = 5;
allowance1 = 1;
allowance05 = 0.5;

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
housing_inside_width = motherboard_width + allowance15;
housing_inside_depth = pluginboard_height + extra_space_magnet + allowance5;
housing_inside_height = motherboard_height + battery_holder_height + allowance10;

echo(housing_inside_width=housing_inside_width);
echo(housing_inside_depth=housing_inside_depth);
echo(housing_inside_height=housing_inside_height);

// Dimensions housing 
housing_thickness = 12; // Make it thick to avoid light comming through the walls
housing_outside_width = housing_inside_width + 2*housing_thickness;
housing_outside_depth = housing_inside_depth + 2*housing_thickness;
housing_outside_height = housing_inside_height + 2*housing_thickness;

echo(housing_outside_width=housing_outside_width);
echo(housing_outside_depth=housing_outside_depth);
echo(housing_outside_height=housing_outside_height);

// Colors
myColor1 = "DodgerBlue";
myColor2 = "Maroon";

// Lids dimensions
lids_depth = housing_thickness/3;

echo(lids_depth=lids_depth);
 
lid_l_r_height = housing_inside_height/2;
lid_l_r_width = (3/4)*housing_inside_depth;
lid_l_r_overlap = (1.7)*housing_thickness; 
lid_l_r_x = lid_l_r_height + lid_l_r_overlap;
lid_l_r_y = lid_l_r_width + lid_l_r_overlap; 

lid_f_b_width = housing_inside_width - 10;
lid_f_b_height = housing_inside_height - 5;
lid_f_b_overlap = (1.7)*housing_thickness;
lid_f_b_x = lid_f_b_width + lid_f_b_overlap;
lid_f_b_y = lid_f_b_height + lid_f_b_overlap; 

lid_t_b_width = housing_inside_width;
lid_t_b_height = housing_inside_depth;
lid_t_b_overlap = (1.7)*housing_thickness;
lid_t_b_x = lid_t_b_width + lid_t_b_overlap;
lid_t_b_y = lid_t_b_height + lid_t_b_overlap; 

// Screw holes
drill_dia_m3 = 3.2;
drill_thread_dia_m3 = 2.5;
drill_depth_m3 = 6;
drill_sinking_dia1_m3 = 5.5;
drill_sinking_dia2_m3 = 3;
drill_sinking_height_m3 = 2; 

echo(drill_depth_m3=drill_depth_m3);

lid_l_r_holes_x = lid_l_r_width + (5/10)*lid_l_r_overlap;
lid_l_r_holes_y = lid_l_r_height + (5/10)*lid_l_r_overlap;

lid_f_b_holes_x = lid_f_b_width + (5/10)*lid_f_b_overlap;
lid_f_b_holes_y = lid_f_b_height + (5/10)*lid_f_b_overlap;

lid_t_b_holes_x = lid_t_b_width + (5/10)*lid_t_b_overlap;
lid_t_b_holes_y = lid_t_b_height + (5/10)*lid_t_b_overlap;

motherboard_mounting_x = motherboard_width - 5;
motherboard_mounting_y = motherboard_height - 5;
motherboard_mounting_d = 6;
motherboard_mounting_h = 6;

// O-rings
oring_channel_depth = 1.2;
oring_channel_width = 2;

oring_l_r_x = lid_l_r_width + 2*oring_channel_width + 6;
oring_l_r_y = lid_l_r_height + 2*oring_channel_width + 6;

oring_f_b_x = lid_f_b_width + 2*oring_channel_width + 6;
oring_f_b_y = lid_f_b_height + 2*oring_channel_width + 6;

oring_t_b_x = lid_t_b_width + 2*oring_channel_width + 6;
oring_t_b_y = lid_t_b_height + 2*oring_channel_width + 6;
