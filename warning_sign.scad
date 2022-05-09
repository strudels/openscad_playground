// text_on_cube.scad - Example for text() usage in OpenSCAD

echo(version=version());

font = "Liberation Sans";

sign_length = 100;
sign_width = 50;
sign_thickness = 4;

module warning_sign(length, width, thickness) {
	translate([0, width/4, thickness]) text(
		"WARNING", valign="center", halign="center", size=width/6,
		font="Helvetica:style=Bold"
	);
	translate([0, width/32, thickness]) text(
		"ここにゴミ", valign="bottom", halign="center", font="Yu Mincho", size=width/10
	);
	translate([0, -width/32, thickness]) text(
		"捨てないで下さい", valign="top", halign="center", font="Yu Mincho", size=width/10
	);
	translate([0, -width/6, thickness]) text(
		"DO NOT DUMB HERE", valign="top", halign="center", size=width/10
	);
	translate([0, -width/3, thickness]) text(
		"NO DUMB AREA", valign="top", halign="center", size=width/10
	);
	cube([length, width, thickness], center=true);
}

warning_sign(sign_length, sign_width, sign_thickness);


// cube_size = 60;
// letter_size = 50;
// letter_height = 5;

// o = cube_size / 2 - letter_height / 2;

// module letter(l) {
// 	// Use linear_extrude() to make the letters 3D objects as they
// 	// are only 2D shapes when only using text()
// 	linear_extrude(height = letter_height) {
// 		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
// 	}
// }

// translate([0, 100, 0]) letter("BL");
// rotate([90, 0, 90]) translate([0, 100, 0]) text("openscad");

// difference() {
// 	union() {
// 		color("gray") cube(cube_size, center = true);
// 		translate([0, -o, 0]) rotate([90, 0, 0]) letter("C");
// 		translate([o, 0, 0]) rotate([90, 0, 90]) letter("U");
// 		translate([0, o, 0]) rotate([90, 0, 180]) letter("B");
// 		translate([-o, 0, 0]) rotate([90, 0, -90]) letter("E");
// 	}

// 	// Put some symbols on top and bottom using symbols from the
// 	// Unicode symbols table.
// 	// (see https://en.wikipedia.org/wiki/Miscellaneous_Symbols)
// 	//
// 	// Note that depending on the font used, not all the symbols
// 	// are actually available.
// 	translate([0, 0, o])  letter("\u263A");
// 	translate([0, 0, -o - letter_height])  letter("\u263C");
// }



// Written in 2014 by Torsten Paul <Torsten.Paul@gmx.de>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
