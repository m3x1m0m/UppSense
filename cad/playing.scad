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
thickness = 5;
allowance = 1;
lid_depth = 5;

difference(){
	// Using my open box module for creating a simple box 
	open_box(length, width, height, thickness, allowance);
	// Creating a depening for the lid
	translate([0, 0, height])
		cube([length + 2*allowance + 2*thickness, width + 2*allowance + 2*thickness, lid_depth]);
}
