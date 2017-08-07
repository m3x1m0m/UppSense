/////////////////////////////////////////////////////////////////////////////////
// Female part of the box.
//
// Author:              Maximilian Stiefel
// Last modification:   31.07.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////////

// Dimesnions
include <dimensions.scad>
use <dimensions.scad>

// Module for raw box without any lids
include <box.scad>
use <box.scad>

// Module for screw holes
include <screw_holes.scad>
use <screw_holes.scad>

////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////

// Set minimum angle of a fragment
//$fa = 0.5;
// Set minimum size of a fragment
//$fs = 0.5;


////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
module box_female()
{
//translate([0, 0, housing_outside_height/2])
//rotate([180, 0, 0])
{
difference()
{
	// Draw hole box
	box();
	union()
	{
	// Cut off half of it
	translate([0, 0, housing_outside_height/4])
	cube([housing_outside_width + 1, housing_outside_depth + 1, housing_outside_height/2 + 0.01], center = true);
	
	// Draw cylinders for mortise joint
	translate([0, 0, -(mortise_joint_height + allowance5)/2])
	screw_holes(housing_inside_width + housing_thickness/2, housing_inside_depth + housing_thickness/2, mortise_joint_dia + allowance1, mortise_joint_height + allowance5);
	}
}
}
}
