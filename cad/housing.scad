/////////////////////////////////////////////////////////////////////////////////
// Housing box for UppSense first tries.
//
// Author:              Maximilian Stiefel
// Last modification:   26.04.2017
/////////////////////////////////////////////////////////////////////////////////

use <open_box.scad>

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
allowance_pcb = 1;
width = 50 + 2*allowance_pcb; 
length = 80 + 2*allowance_pcb;
height = 45;
thickness = 5;

lid_depth = 5;

bolt_diameter = 6;		// According to the Farnell datasheet
bolt_spacing = 5;

my_color = "DarkRed";

allowance_glass = 0.2;
allowance_adapter = 0.2;
glass_width = 26 + allowance_glass;
glass_height = 2 + allowance_glass;
glass_length = 76 + allowance_glass;

slot = 3;
adapter_length = 2 + 5 + 4 + slot; // 2*allowance_pcb + thickness + distance(glass_slide, wall_inside) + slot;

cables_diameter = 3;

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
difference(){

	// Using my open box module for creating a simple box 
	color(my_color, 0.8)
		open_box(length, width, height, thickness);
	
	// Creating a depening for the lid
	color(my_color, 0.9)
	translate([thickness, thickness, height+1])
	hull()
	{
		cylinder(r=thickness/2, h=lid_depth+1);
		translate([0, width, 0])
		cylinder(r=thickness/2, h=lid_depth+1);
		translate([length, 0, 0])
		cylinder(r=thickness/2, h=lid_depth+1);
		translate([length, width, 0])
		cylinder(r=thickness/2, h=lid_depth+1);

	}
	// If it shall not be round
	//cube([length + thickness, width + thickness, lid_depth+1]);	
		

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

	// Cylindric holes for cables
	color(my_color, 1.0) union(){
		translate([thickness + length - 1, 3*thickness, thickness + (1/4)*height])
		rotate([0, 90, 0])
		cylinder(r=cables_diameter, h=thickness + 2);

		translate([thickness + length - 1, 3*thickness, thickness + (3/4)*height])
		rotate([0, 90, 0])
		cylinder(r=cables_diameter, h=thickness + 2);
	}

	// Slots for the glass slide	
	color(my_color, 0.6) union(){
		// Slots for glass slide
		// Slot in the back
		//translate([length + thickness/2, thickness + (width - glass_width)/2, (height + thickness)/2 - glass_height])
		translate([length + thickness/2, -(glass_width-1.2*glass_width)/2 + thickness + (width - 1.2*glass_width + allowance_adapter)/2, (3*glass_height + allowance_adapter - glass_height)/2 +(height + thickness)/2])
		cube([thickness, glass_width, glass_height]);
		// Slot in the front
		translate([thickness + 1, thickness + (width - 1.2*glass_width + allowance_adapter)/2, (height + thickness)/2])
		rotate([0, 0, 90])
		cube([1.2*glass_width + allowance_adapter, thickness + 2, 3*glass_height + allowance_adapter]);			
	}
}

/////////////////////////////////////////////////////////////////////////////////
// Import other models
/////////////////////////////////////////////////////////////////////////////////
// Lid
*color(my_color, 0.8)
translate([thickness/2, thickness/2, height]) 
import("lid.stl");

// Adapter
*color(my_color, 0.8)
translate([-30,thickness + (width - 1.2*glass_width)/2,(height + thickness)/2]) 
rotate([0, 0, 270])
import("adapter.stl");
