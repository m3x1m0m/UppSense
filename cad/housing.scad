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
allowance_pcb = 1;
allowance_glass = 0.5;
width = 50 + 2*allowance_pcb; 
length = 80 + 2*allowance_pcb;
height = 45;
thickness = 5;
lid_depth = 5;
bolt_diameter = 5.5;		// According to the Farnell datasheet
bolt_spacing = 5;
my_color = "DarkRed";
glass_width = 26;
glass_height = 2 + allowance_glass;

difference(){

	// Using my open box module for creating a simple box 
	color(my_color, 0.8)
		open_box(length, width, height, thickness);
	
	// Creating a depening for the lid
	color(my_color, 0.9)
	translate([thickness/2, thickness/2, height+1])
		cube([length + thickness, width + thickness, lid_depth+1]);	
	
	// Cylindric holes for the PCBs
	color(my_color, 1.0) translate([0, 0, thickness/2]){
		translate([thickness + bolt_spacing, thickness + bolt_spacing, 0])
			cylinder(r=bolt_diameter/2, h=thickness/2+1);
		translate([length + thickness - bolt_spacing, thickness + bolt_spacing, 0])
			cylinder(r=bolt_diameter/2, h=thickness/2+1);
		translate([length + thickness - bolt_spacing, width + thickness - bolt_spacing, 0])
			cylinder(r=bolt_diameter/2, h=thickness/2+1);
		translate([thickness + bolt_spacing, width + thickness - bolt_spacing, 0])
			cylinder(r=bolt_diameter/2, h=thickness/2+1);
	}
	
	color(my_color, 0.6) union(){
		// Slots for glass slide
		// Slot in the back
		translate([length + thickness/2, thickness + (width - glass_width)/2, (height + thickness)/2])
			cube([thickness, glass_width, glass_height]);
		// Slot in the front
		translate([-1, thickness + (width - glass_width)/2, (height + thickness)/2])
			cube([thickness + 2, glass_width, glass_height]);
	}
}

color(my_color, 0.8)
translate([thickness/2, thickness/2, height + 10]) 
import("lid.stl");
