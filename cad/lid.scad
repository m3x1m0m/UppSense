/////////////////////////////////////////////////////////////////////////////////
// Lid for the housing box for UppSense first tries.
//
// Author:              Maximilian Stiefel
// Last modification:   27.04.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
allowance = 1; 
thickness = 5;
length = 80 +  2*allowance;
width = 50 + 2*allowance;
lid_depth = 5;
my_color = "DarkRed";
knob_r = 10;
knob_h = 20;
allowance = 0.1;

color(my_color, 0.8) union(){
	//cube([length + thickness, width + thickness, lid_depth]);
	translate([thickness/2, thickness/2, 0])
        hull()
        {
                cylinder(r=thickness/2-allowance, h=lid_depth);
                translate([0, width, 0])
                cylinder(r=thickness/2-allowance, h=lid_depth);
                translate([length, 0, 0])
                cylinder(r=thickness/2-allowance, h=lid_depth);
                translate([length, width, 0])
                cylinder(r=thickness/2-allowance, h=lid_depth);

        }
	translate([(length + thickness)/2, (width + thickness)/2, lid_depth-1])
	cylinder(r=knob_r,h=knob_h);
}
