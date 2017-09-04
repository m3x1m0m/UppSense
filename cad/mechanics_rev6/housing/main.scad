/////////////////////////////////////////////////////////////////////////////////
// Main file to assemble everything.
//
// Author:              Maximilian Stiefel
// Last modification:   20.07.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////////

// Dimesnions
include <dimensions.scad>
use <dimensions.scad>

// Module for male part of raw box
include <box_male.scad>
use <box_male.scad>

// Module for female part of raw box
include <box_female.scad>
use <box_female.scad>

// Module for raw box without any lids
include <lid_l_r.scad>
use <lid_l_r.scad>

// Module for raw box without any lids
include <lid_f_b.scad>
use <lid_f_b.scad>

// Module for raw box without any lids
include <lid_t_b.scad>
use <lid_t_b.scad>

////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
// 0 = put lids, 1 = remove lids
close = 1;
// Set minimum angle of a fragment
$fa = 0.5;
// Set minimum size of a fragment
$fs = 0.5;

////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
//difference()
//{
union()
{
color(myColor1)
{
// Lid right
translate([housing_outside_width/2 + close*20, 0, 0])
rotate([0, 0, 0])
lid_l_r();

// Lid left
translate([-housing_outside_width/2 - close*20, 0, 0])
rotate([0, 180, 0])
lid_l_r();

// Lid front
translate([0, -housing_outside_depth/2 - close*20, 0])
rotate([90, 0, 0])
//rotate([0, 180, 0])
lid_f_b(1,0);

// Lid back
translate([0, +housing_outside_depth/2 + close*20, 0])
rotate([-90, 180, 0])
//rotate([0, 180, 0])
lid_f_b(1,1);

color(myColor1, 0.8)
translate([0, 0, close*10 +0.0])
//translate([0, 0, housing_outside_height/2])
//rotate([0,180,0])
box_male();
translate([0, 0, -close*10 -0.0])
//translate([0, 0, housing_outside_height/2])
box_female();
}
}
//translate([-200, 0, 0])
//cube([400,400,400], center=true);
//}
