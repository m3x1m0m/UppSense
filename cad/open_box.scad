/////////////////////////////////////////////////////////////////////////////////
// Module for a open box with rounded edges.
//
// Author: 		Maximilian Stiefel
// Last modification: 	26.04.3017
/////////////////////////////////////////////////////////////////////////////////

module open_box(width, length, height, thickness, allowance)
{

	/////////////////////////////////////////////////////////////////////////
	// Vars
	/////////////////////////////////////////////////////////////////////////
	edge_rounding = 6;
	compensation = abs(thickness-edge_rounding);

	/////////////////////////////////////////////////////////////////////////
	// Action
	/////////////////////////////////////////////////////////////////////////
	difference(){		
		// Hull 4 cylinders which are compensated against the thickness
		// so the actual desired thickness and edge rounding is always achieved.
		hull(){
			translate([+compensation, +compensation, 0])
				cylinder(r = edge_rounding, h = height + thickness);
			translate([width + 2*allowance + 2*thickness - compensation, compensation, 0])
				cylinder(r = edge_rounding, h = height + thickness);
			translate([compensation, length + 2*allowance + 2*thickness - compensation,0])
				cylinder(r = edge_rounding, h = height + thickness);
			translate([width + 2*allowance + 2*thickness - compensation, length + 2*allowance + 2*thickness - compensation,0])
				cylinder(r = edge_rounding, h = height + thickness);
		}

		translate([thickness, thickness, thickness])
			cube([width + 2*allowance, length + 2*allowance, height + 1]);
	}
}
