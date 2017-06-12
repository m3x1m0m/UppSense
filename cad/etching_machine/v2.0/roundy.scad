/////////////////////////////////////////////////////////////////////////////////
// Module for a open box with rounded edges.
//
// Author: 		Maximilian Stiefel
// Last modification: 	26.04.2017
/////////////////////////////////////////////////////////////////////////////////

module roundy(width, depth, height, center)
{
/////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////
edge_rounding = 8;
transx = -width/2;
transy = -depth/2;
transz = -height/2;

/////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////
// Hull 4 cylinders	
translate([transx, transy, transz])
hull(){
	// x=0, y=0
	translate([edge_rounding, edge_rounding, 0])
	cylinder(r = edge_rounding, h = height);
	// x=width, y=0
	translate([width - edge_rounding, edge_rounding, 0])
	cylinder(r = edge_rounding, h = height);
	// x=0, y=depth
	translate([edge_rounding, depth - edge_rounding,0])
	cylinder(r = edge_rounding, h = height);
	//x=width, y=length
	translate([width - edge_rounding, depth - edge_rounding,0])
	cylinder(r = edge_rounding, h = height);
}
}
