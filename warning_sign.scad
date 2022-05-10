sign_length = 100;
sign_width = 50;
sign_thickness = 4;

module warning_sign(length, width, thickness) {
	// base of the sign
	color([.9, .6, 0]) minkowski() {
		cube([length, width, thickness], center=true);
		cylinder(1, center=true, $fn=50);
	}

	color([0, 0, 0]) union() {
		translate([0, width/4, thickness]) text(
			"WARNING", valign="center", halign="center", size=width/6,
			font="Helvetica:style=Bold"
		);

		translate([0, width/32, thickness]) text(
			"ここにゴミ", valign="center", halign="center", font="Yu Mincho", size=width/10
		);
		translate([0, -width/16, thickness]) text(
			"捨てないで下さい", valign="center", halign="center", font="Yu Mincho", size=width/10
		);

		translate([0, -width/6, thickness]) text(
			"DO NOT DUMB HERE", valign="top", halign="center", size=width/10
		);
		translate([0, -width/3, thickness]) text(
			"NO DUMB AREA", valign="top", halign="center", size=width/10
		);

		// Hexagon around "WARNING"
		difference() {
			// TODO: How can I minkowski() the both of these cubes the same way?
			minkowski() {
				cube([length - 2, width - 2, thickness+2], center=true);
				cylinder(1, center=true, $fn=50);
			}
			minkowski() {
				cube([length - 3, width - 3, thickness+3], center=true);
				cylinder(1, center=true, $fn=50);
			}
		}
		difference() {
			translate([0, width/4, 0]) cube([length-4, width/3, thickness+2], center=true);
			minkowski() {
				scale([8 , 1, 1]) translate([0, width/4, 0]) rotate([0,0,30])
					cylinder(h=thickness+2, r=(width/8), center=true, $fn=6);
				cylinder(1, center=true, $fn=50);
			}
		}
	}
}

warning_sign(sign_length, sign_width, sign_thickness);
