include <ruler.scad>

$fn=60;

left_right_cube_hight = 50;
middle_cube_hight = 60;
cube_size = 20;
magnet_diameter = 10;

module left_cube() {
    difference() {
        translate([30, 0, 0]) cube([cube_size, cube_size, left_right_cube_hight]);
        translate([42.5, 10, 35]) cylinder(d=4, h=15);
        translate([40, 10, 0]) cylinder(d=3, h=5);
    }
}

module middle_cube() {
    difference() {
        translate([15, 0, 0]) cube([cube_size, cube_size, middle_cube_hight]);
        translate([25, 10, 10]) cylinder(d=magnet_diameter, h=50);
    }
}

module right_cube() {
    difference() {
        translate([0, 0, 0]) cube([cube_size, cube_size, left_right_cube_hight]);
        translate([7.5, 10, 35]) cylinder(d=4, h=15);
        translate([10, 10, 0]) cylinder(d=3, h=5);
    }
}

left_cube();
middle_cube();
right_cube();

//
// rulers
//
//translate([0, 0, 0]) rotate([90, 0, 0]) ruler(70);
//translate([0, 0, 0]) rotate([90, 90, 0]) ruler(60);
//translate([0, 0, 50]) rotate([90, 90, 0]) ruler(60);
//translate([7.5, 20, 52]) rotate([90, 90, 0]) ruler(35);

