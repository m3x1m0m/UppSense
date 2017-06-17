/////////////////////////////////////////////////////////////////////////////////
// File for all dimensions, so they can be changed globally.
//
// Author:              Maximilian Stiefel
// Last modification:   17.06.2017
/////////////////////////////////////////////////////////////////////////////////

// Allowance
allowance05 = 0.5;
allowance1 = 1;
allowance2 = 2;

// Dimesions holder
holder_height = 172;
holder_width = 18;
holder_depth = 8;

// Dimensions notch
notch_height = 161;
// Calculations to construct a triangle which can take a PCB
biggest_pcb = 2;
c = biggest_pcb + 1;
x = c/sqrt(2);
y = sqrt( pow(x,2) - pow(c/2,2) );

// Dimensions cuvette
glass_thickness = 6;
cuvette_width = 180 + 2*glass_thickness + allowance2;
cuvette_depth = 50 + 2*glass_thickness + allowance2;

// Dimensions lid
lid_thickness = 4;
lid_width = 180 + 2*glass_thickness + 2*lid_thickness + allowance2;
lid_depth = 50 + 2*glass_thickness + 2*lid_thickness + allowance2;
lid_height = 20;

// Dimensions holder heater
heater_diameter = 25 + allowance1; 
heater_offset = 55;
heater_pos = -lid_width/2 + heater_diameter/2 + 2*lid_thickness + 3;

// Dimensions slot for the PCB holder arms
slot_width = lid_width - heater_diameter - 2*lid_thickness - 20;
slot_depth = holder_depth + allowance05;
slot_height = 1.5 * lid_height;
slot_pos = heater_pos + heater_diameter/2 + lid_thickness + 3;  

// Dimensions service holes for temp. sensor and air tube
service_hole_width = 10;
service_hole_depth = 10;
service_hole_height = lid_height;

// Dimensions crossbar
crossbar_height = 2.5 + allowance05;
crossbar_width = 8 + allowance05;

// Dimensions lid
lid_thickness = 4;
lid_slot_width = 8;

// Dimensions neck
neck_diameter = holder_depth;
neck_height = lid_thickness + allowance05;

// Dimensions head 
head_width = holder_width;
head_depth = holder_depth;
head_height = 5;

// Suitable for M3 screw thread
hole_diameter = 2.5;

// Air system diameter
air_system = 10;

// Height difference between notch for PCB and the actual holder
height_diff_1 = holder_height - notch_height;

// Width difference between crossbar and holder
width_diff_1 = holder_width - crossbar_width;

// Dimensions bar that PCB does not fall down
bar_width = holder_width/2;
bar_depth = 6;
// The height of this thing should exactely use the space which is available
// between the notch for the PBC and the crossbar slot 
bar_height = height_diff_1/4 - crossbar_height/2;

// My color for everything
myColor = "FireBrick";
