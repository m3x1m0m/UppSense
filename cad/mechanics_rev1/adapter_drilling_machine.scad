/////////////////////////////////////////////////////////////////////////////////
// Adapter for drilling machine in the embedded lab.
//
// Author:              Maximilian Stiefel
// Last modification:   07.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
cone_radius_1 = 31.8 /2;
cone_radius_2 = 48.1 /2;
cone_height = 31;

cylinder_radius = 43 /2;
cylinder_height = 21.5;

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////

difference()
{
difference()
{
	union()
	{
		// Draw the hole to hold the drilling machine
		translate([0, 0, cylinder_height/2])
		cylinder(h = cylinder_height, r = cylinder_radius, center = true);
		translate([0, 0, 1.5 + cylinder_height])
		cylinder(h = 3, r = 26, center = true);
	}

	translate([0, 0, cone_height/2 + 3])
	union()
	{
		translate([0, 0, -20])
		cylinder(h = 15, r = cone_radius_1, center = true);
		// Draw cone measured
		cylinder(h = cone_height, r1 = cone_radius_1, r2 = cone_radius_2, center = true);
	
	}
}
translate([cone_radius_2, 0, 0])
cube([30, 15, 60], center = true);

}
