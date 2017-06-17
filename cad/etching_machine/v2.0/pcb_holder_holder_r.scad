/////////////////////////////////////////////////////////////////////////////////
// Left holder part to anchor PCB with in the etching bath.
//
// Author:              Maximilian Stiefel
// Last modification:   17.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
// Dimesions holder
holder_height = 160;
holder_width = 15;
holder_depth = 6;

// Dimensions notch
notch_height = 115;
// Calculations to construct a triangle which can take a PCB
biggest_pcb = 2;
c = biggest_pcb + 1;
x = c/sqrt(2);
y = sqrt( pow(x,2) - pow(c/2,2) );

// General allowance
allowance = 0.5;

// Dimensions crossbar
crossbar_height = 5 + allowance;
crossbar_width = 5 + allowance;

// Dimensions lid
lid_thickness = 4;
lid_slot_width = 8;

// Dimensions neck
neck_diameter = holder_depth;
neck_height = lid_thickness + allowance;

// Dimensions head 
head_width = holder_width;
head_depth = holder_depth;
head_height = 5;

// Dimensions bar that PCB does not fall down
bar_width = holder_width/2;
bar_depth = 5;
bar_height = 2;

// Suitable for M3 screw thread
hole_diameter = 2.5;

// Air system diameter
air_system = 10;

// Height difference between notch for PCB and the actual holder
height_diff_1 = holder_height - notch_height;

// Width difference between crossbar and holder
width_diff_1 = holder_width - crossbar_width;

// My color for everything
myColor = "FireBrick";

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
color(myColor)
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
		
		// Bar, that PCB does not fall 
		translate([holder_width/2 - bar_width/2, -bar_depth, height_diff_1/2 - bar_height])
		cube([bar_width, bar_depth, bar_height]);
		
		// Text
		translate([holder_width/2 + 3, holder_depth, 0.2*holder_height])
		rotate([90,0,180])
		linear_extrude(height = 3, center = true, convexity = 10, twist = 0)
		text("R", size = 10, valign = "center");
		translate([holder_width, 0, (1/4)*height_diff_1 + 6])
		rotate([90, 0, 90])
		linear_extrude(height = 2, center = true, convexity = 10, twist = 0)
		text("M3", size = 3, valign = "center");
		translate([0, holder_depth/2, holder_height/2])
		rotate([90, -90, 270])
		linear_extrude(height = 2, center = true, convexity = 10, twist = 0)
		text("Maximilian Stiefel 2017", size = 3, valign = "center");

	}

	union()
	{
		// Cube for notch
		//translate([holder_width/2 - notch_width/2, -notch_depth +2, height_diff_1/2])
		//cube([notch_width, notch_depth, notch_height], center = false);

		// Triangular notch
		translate([-c/2 + holder_width/2, -0.01, height_diff_1/2])
		linear_extrude(height = notch_height, center = false)
		polygon(points=[[0,0],[c/2,y], [c,0]], paths = [[0,1,2]]);	
		
		// Slots for crossbars
		translate([width_diff_1/2, -1, (1/4)*height_diff_1 - crossbar_height/2])
		cube([crossbar_width, holder_depth + 2, crossbar_height], center = false);
		translate([width_diff_1/2, -1, (3/4)*height_diff_1 + notch_height - crossbar_height/2])
		cube([crossbar_width, holder_depth + 2, crossbar_height], center = false);

		// Drill holes for screws
		translate([holder_width/2, holder_depth/2, (1/4)*height_diff_1])
		rotate([0, 90, 0])
		cylinder(h = 9, r = hole_diameter/2);
		translate([holder_width/2, holder_depth/2,(3/4)*height_diff_1 + notch_height])
		rotate([0, 90, 0])
		cylinder(h = 9, r = hole_diameter/2);

		// Holes for the air system
		translate([holder_width/2, holder_depth + 1, 0])
		rotate([90, 0, 0])
		cylinder(h = holder_depth + 2, r = air_system/2);	
	}
}
