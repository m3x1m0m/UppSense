/////////////////////////////////////////////////////////////////////////////////
// Adapter for drilling machine in the embedded lab.
//
// Author:              Maximilian Stiefel
// Last modification:   10.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
holder_height = 175;
holder_width = 15;
holder_depth = 5;

notch_height = 120;
notch_width = 2;
notch_depth = 3;

allowance = 0.5;

crossbar_height = 10 + allowance;
crossbar_width = 5 + allowance;
crossbar_depth = 175;

pillar_height = 20;
pillar_width = 15;
pillar_depth = holder_depth;

airpump_diameter = 30;

// Suitable for M3 screw thread
hole_diameter = 2.5;

// Height difference between notch for PCB and the actual holder
height_diff_1 = holder_height - notch_height;

// Height difference between notch position and crossbar_slot
height_diff_2 = 0.7*height_diff_1 - airpump_diameter/2;

// Width difference between crossbar and holder
width_diff_1 = holder_width - crossbar_width; 

// With difference between 
width_diff_2 = pillar_width - holder_width;

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
difference()
{
union()
{
	// Cube for the base holder
	cube([holder_width, holder_depth, holder_height], center = false);
	// Pillars
	translate([holder_width, 0, 0])
	cube([pillar_width, pillar_depth, pillar_height]);
	translate([-pillar_width , 0, 0])
	cube([pillar_width, pillar_depth, pillar_height]);
}

union()
{
	// Drill holes for air pump
	translate([holder_width/2, holder_depth + 1, 0])
	rotate([90, 0, 0])
	cylinder(h = holder_depth + 2, r = airpump_diameter/2);

	// Cube for notch
	translate([holder_width/2 - notch_width/2, -1, 0.7*height_diff_1])
	cube([notch_width, notch_depth, notch_height], center = false);

	// Slots for crossbars
	translate([width_diff_1/2, -1, height_diff_2/2 + airpump_diameter/2 - crossbar_height/2])
	cube([crossbar_width, holder_depth + 2, crossbar_height], center = false);
	translate([width_diff_1/2, -1, holder_height - 0.3*height_diff_1/2 - crossbar_height/2])
	cube([crossbar_width, holder_depth + 2, crossbar_height], center = false);

	// Drill holes for screws
	translate([-1, holder_depth/2, height_diff_2/2 + airpump_diameter/2])
	rotate([0, 90, 0])
	cylinder(h = 9, r = hole_diameter/2);
	translate([-1, holder_depth/2, holder_height - 0.3*height_diff_1/2])
	rotate([0, 90, 0])
	cylinder(h = 9, r = hole_diameter/2);
}
}
