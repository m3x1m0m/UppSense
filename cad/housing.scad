/////////////////////////////////////////////////////////////////////////////////
// Housing box for UppSense first tries.
//
// Author:              Maximilian Stiefel
// Last modification:   26.04.3017
/////////////////////////////////////////////////////////////////////////////////

use <open_box.scad>

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
length = 50; 
width = 80;
height = 45;
thickness = 10;
allowance = 1;
lid_depth = 5;
bolt_diameter = 4;
bolt_spacing = 5;
my_color = "SteelBlue";

union(){
	// Using my open box module for creating a simple box 
	color(my_color, 0.8)
		open_box(length, width, height, thickness, allowance);
	// Creating a depening for the lid
	color(my_color, 0.9)
	*translate([thickness/2, thickness/2, height])
		cube([length + 2*allowance + thickness, width + 2*allowance + thickness, lid_depth]);	
	// Cylindric holes for the PCB
	*color(my_color, 1.0) translate([0, 0, thickness/2]){
		translate([thickness + bolt_spacing, bolt_spacing + thickness, 0])
			cylinder(r=bolt_diameter/2, h=thickness/2+1);
	}
	*translate([0,0,0])
	cube([90, thickness, 50]);

}
