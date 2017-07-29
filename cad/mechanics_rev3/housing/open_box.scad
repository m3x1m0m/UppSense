/////////////////////////////////////////////////////////////////////////////////
// Module for a open box with rounded edges.
//
// Author: 		Maximilian Stiefel
// Last modification: 	26.04.2017
/////////////////////////////////////////////////////////////////////////////////

module open_box(width, length, height, thickness)
{

	/////////////////////////////////////////////////////////////////////////
	// Vars
	/////////////////////////////////////////////////////////////////////////
	edge_rounding = 8;
	compensation = 2*abs(edge_rounding-thickness);

	/////////////////////////////////////////////////////////////////////////
	// Action
	/////////////////////////////////////////////////////////////////////////
	translate([0, 0, 0]) difference(){		
		// Hull 4 cylinders which are compensated against the thickness
		// so the actual desired thickness/2 and edge rounding is always achieved.
		hull(){
			// x=0, y=0
			translate([edge_rounding, edge_rounding, 0])
				cylinder(r = edge_rounding, h = height + thickness);
			// x=width, y=0
			translate([width + edge_rounding - compensation, edge_rounding, 0])
				cylinder(r = edge_rounding, h = height + thickness);
			// x=0, y=length
			translate([edge_rounding, length + edge_rounding - compensation,0])
				cylinder(r = edge_rounding, h = height + thickness);
			//x=width, y=length
			translate([width + edge_rounding - compensation, length + edge_rounding - compensation,0])
				cylinder(r = edge_rounding, h = height + thickness);
		}

		translate([thickness, thickness, thickness])
			cube([width, length, height + 1]);
	}
}
