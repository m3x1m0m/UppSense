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

// Module for raw box without any lids
include <box.scad>
use <box.scad>

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

////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////

color(myColor1)
{
// Lid left
translate([housing_outside_width/2 + close*20, 0, 0])
lid_l_r();

// Lid left
translate([-housing_outside_width/2 - close*20, 0, 0])
rotate([0, 180, 0])
lid_l_r();

// Lid front
translate([0, -housing_outside_depth/2 - close*20, 0])
rotate([90, 0, 0])
lid_f_b(1);

// Lid back
translate([0, +housing_outside_depth/2 + close*20, 0])
rotate([-90, 180, 0])
lid_f_b(0);

// Lid top 
translate([0, 0, housing_outside_height/2 + close*20])
lid_t_b();

// Lid bottom
translate([0, 0, -housing_outside_height/2 - close*20])
rotate([180, 0, 0])
lid_t_b();
}

color(myColor1, 0.8)
box();

