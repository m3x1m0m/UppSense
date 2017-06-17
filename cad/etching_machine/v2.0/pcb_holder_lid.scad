/////////////////////////////////////////////////////////////////////////////////
// Lid for cuvette with pcb holder slots and a possibility to put a heater.
//
// Author:              Maximilian Stiefel
// Last modification:   17.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Include
/////////////////////////////////////////////////////////////////////////////////
include <roundy.scad>
use <roundy.scad>
include <dimensions.scad>
use <dimensions.scad>

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
color(myColor)
difference()
{
	union()
	{
		// Basic lid
		translate([0, 0, lid_height/2])
		roundy(lid_width, lid_depth, lid_height, true);
		//cube([lid_width, lid_depth, lid_height], center = true);
		translate([heater_pos, 0, lid_height - 1])
		cylinder(h = heater_offset + 1, r = heater_diameter/2 + lid_thickness);
		
		// Uppsala University Logo
		translate([0, 5, lid_height])
		linear_extrude(height = 1)
		scale(0.08)
		import("uppsla_university.dxf");
		
		// Text
		translate([-lid_width/2 + 5, -lid_depth/2 + 2, lid_height/2])
		rotate([90, 0, 0])
		linear_extrude(height = 6, center = true, convexity = 10, twist = 0)
		union()
		{
		translate([0, 4, 0])
		text("Embedded Etcher", size = 6, valign = "center");
		translate([0, -4, 0])
		text("Revision 1.0", size = 6, valign = "center");
		}
	}
	union()
	{
		// Depening to put it over the cuvette
		translate([0, 0, lid_height/2 - lid_thickness])
		cube([cuvette_width, cuvette_depth, lid_height], center = true);
		
		// Hole for heater
		translate([heater_pos, 0, -1])
		cylinder(h = heater_offset + lid_height + 2, r = heater_diameter/2);
		// Slot for the PCB holder arms
		translate([slot_pos, -slot_depth/2, 0])
		cube([slot_width, slot_depth, slot_height], center = false);
		
		// Service holes
		translate([-lid_width/2 + lid_thickness + 5, -lid_depth/2 + lid_thickness + 3, (1/2)*lid_height])
		cube([service_hole_width, service_hole_depth, service_hole_height]);
		translate([lid_width/2 - lid_thickness - service_hole_width -5, -lid_depth/2 + lid_thickness + 3, (1/2)*lid_height])
		cube([service_hole_width, service_hole_depth, service_hole_height]);

	}
}
