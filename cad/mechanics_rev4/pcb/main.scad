/////////////////////////////////////////////////////////////////////////////////
// Main file to bring everything together. 
//
// Author:              Maximilian Stiefel
// Last modification:   29.06.2017
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Includes
/////////////////////////////////////////////////////////////////////////////////

// Dimesnions
include <dimensions.scad>
use <dimensions.scad>

// Module for the glass holder
include <glass_hollder.scad>
use <glass_holder.scad>

// Module for the legs 
include <legs.scad>
use <legs.scad>

// Module for the legs 
include <led_illuminator.scad>
use <led_illuminator.scad>

/////////////////////////////////////////////////////////////////////////////////
// Vars
/////////////////////////////////////////////////////////////////////////////////
$fa = 0.5; // minimum facet angle is now 0.5
$fs = 0.5; // minimum facet size is now 0.5 mm

/////////////////////////////////////////////////////////////////////////////////
// Action
/////////////////////////////////////////////////////////////////////////////////
color(myColor1)
{
	glass_holder();
	legs();
	illuminator();
}
