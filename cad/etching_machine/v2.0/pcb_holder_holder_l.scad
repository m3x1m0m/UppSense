/////////////////////////////////////////////////////////////////////////////////
// Adapter for drilling machine in the embedded lab.
//
// Author:              Maximilian Stiefel
// Last modification:   10.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
// Dimesions holder
holder_height = 160;
holder_width = 15;
holder_depth = 6;

// Dimensions notch
notch_height = 135;
notch_width = 2;
notch_depth = 3;

// General allowance
allowance = 0.5;

// Dimensions crossbar
crossbar_height = 5 + allowance;
crossbar_width = 5 + allowance;

// Dimensions lid
lid_thickness = 3;
lid_slot_width = 8;

// Dimensions neck
neck_diameter = holder_depth;
neck_height = lid_thickness + allowance;

// Dimensions head 
head_width = holder_width;
head_depth = holder_depth;
head_height = 5;

// Suitable for M3 screw thread
hole_diameter = 2.5;

// Height difference between notch for PCB and the actual holder
height_diff_1 = holder_height - notch_height;

// Width difference between crossbar and holder
width_diff_1 = holder_width - crossbar_width;

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
difference()
{
union()
{
	// Cube for the base holder
	cube([holder_width, holder_depth, holder_height], center = false);
	// Head
	translate([0, 0, holder_height + neck_height])
	cube([head_width, head_depth, head_height]);
	// Neck
	translate([holder_width/2, holder_depth/2, holder_height])
	cylinder(h = neck_height, r = neck_diameter/2);
}

union()
{
	// Cube for notch
	translate([holder_width/2 - notch_width/2, -1, height_diff_1/2])
	cube([notch_width, notch_depth, notch_height], center = false);

	// Slots for crossbars
	translate([width_diff_1/2, -1, (1/4)*height_diff_1 - crossbar_height/2])
	cube([crossbar_width, holder_depth + 2, crossbar_height], center = false);
	translate([width_diff_1/2, -1, (3/4)*height_diff_1 + notch_height - crossbar_height/2])
	cube([crossbar_width, holder_depth + 2, crossbar_height], center = false);

	// Drill holes for screws
	translate([-1, holder_depth/2, (1/4)*height_diff_1])
	rotate([0, 90, 0])
	cylinder(h = 9, r = hole_diameter/2);
	translate([0, holder_depth/2,(3/4)*height_diff_1 + notch_height])
	rotate([0, 90, 0])
	cylinder(h = 9, r = hole_diameter/2);
}
}
