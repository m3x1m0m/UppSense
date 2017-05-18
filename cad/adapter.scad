/////////////////////////////////////////////////////////////////////////////////
// Housing box for UppSense first tries.
//
// Author:              Maximilian Stiefel
// Last modification:   28.04.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
allowance_glass = 0.2;
my_color = "DarkRed";
glass_width = 26 + allowance_glass;
glass_height = 2 + allowance_glass;
glass_length = 76 + allowance_glass;
slot = 3;				// Depness of the glass slot
adapter_length = 2 + 5 + 4 + slot; 	// 2*allowance_pcb + thickness + distance(glass_slide, wall_inside) + slot

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
translate([-glass_width - 0.6*glass_width, -adapter_length, 1.5*glass_height]) difference(){
	color(my_color, 0.6) union(){
		// Front part of adapter 
		translate([glass_width/2-0.1*glass_width, adapter_length - 1, -1.5*glass_height]) cube([1.2*glass_width, adapter_length + 1, 3*glass_height]);
		// Back part of adapter
		translate([0, 0, -3*glass_height]) cube([2*glass_width, adapter_length, 6*glass_height]);
	}
	// Slot for the glass
	color(my_color, 0.5)
	translate([glass_width/2, 2*adapter_length-slot, -0.5*glass_height]) 
	cube([glass_width, slot + 2, glass_height]);

}
