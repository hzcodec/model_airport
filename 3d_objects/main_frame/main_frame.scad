include <ruler.scad>
include <triangle.scad>

$fn=60;

frame_with_holes();
base_plate_with_holes();
triangle_support();
motor_support_with_hole();
upper_support();


// --------------------------------------------------------
// build differential frame
// --------------------------------------------------------
module basic_outer_diff_frame() {
  minkowski() {
    cube([40-4, 56-4, 20], true);
    cylinder(r=2,h=1); 
  }
}

module basic_inner_diff_frame() {
  cube([26, 44, 40], true);
}

module differential_frame() {
  difference() {
    basic_outer_diff_frame();
    basic_inner_diff_frame();
  }
}

module frame_with_holes() {
  difference() {
    differential_frame();
    translate([16.5, -24, -14]) cylinder(d=5, h=26);
    translate([16.5, 24, -14]) cylinder(d=5, h=26);
    translate([-16.5, -24, -14]) cylinder(d=5, h=26);
    translate([-16.5, 24, -14]) cylinder(d=5, h=26);
  }
}
// --------------------------------------------------------


// --------------------------------------------------------
// build base plate
module base_plate() {
  translate([-55, -30, -13]) cube([110, 170, 3]);
}

module base_plate_with_holes() {
  difference() {
    base_plate();
    // holes for differential gear
    translate([16.5, -24, -14]) cylinder(d=5, h=26);
    translate([16.5, 24, -14]) cylinder(d=5, h=26);
    translate([-16.5, -24, -14]) cylinder(d=5, h=26);
    translate([-16.5, 24, -14]) cylinder(d=5, h=26);

    // guidance hole, mark for axle center
    translate([0, 35, -14]) cylinder(d=3, h=26);
    translate([0, 115, -14]) cylinder(d=3, h=26);

    // switch hole
    translate([-40, 90, -14]) cylinder(d=6, h=26);

    // magnet holder holes
    translate([-15, 128, -14]) cylinder(d=4, h=26);
    translate([15, 128, -14]) cylinder(d=4, h=26);

    base_plate_without_triangles();
  }
}

module base_plate_triangle() {
  color([0.2, 0.6, 0.2])
  translate([55, 140, -15]) rotate([0, 0, 180]) triangle(15, 15, 5);
}

module mirror_corners() {
  mirror([1, 0, 0]) base_plate_triangle();
}

module base_plate_without_triangles() {
  base_plate_triangle();
  mirror_corners();
}
// --------------------------------------------------------


// --------------------------------------------------------
// triangle support
module triangle_support() {
    color([0, 1, 1])
    translate([15, 27, -10]) rotate([90, 0, 90]) triangle(15, 35, 5);

    color([0, 1, 0])
    translate([-20, 27, -10]) rotate([90, 0, 90]) triangle(15, 35, 5);

    //translate([15, 38, -11]) cube([5, 40, 10]);
    //translate([-20, 38, -11]) cube([5, 40, 10]);
}
// --------------------------------------------------------


// --------------------------------------------------------
// build motor support
module motor_support() {
  color([1, 0, 1])
  translate([-15, 48, -10]) cube([30, 60, 13]);
}

module motor_support_with_hole() {
  difference() {
    motor_support();
    translate([0, 98, 0]) cylinder(d=2, h=4);
  }
}
// --------------------------------------------------------


module upper_support() {
  color([.6, .7, .6])
  translate([50, 0, -18]) cube([5, 110, 5]);

  color([.6, .7, .6])
  translate([-55, 0, -18]) cube([5, 110, 5]);
}

module diff2 () {
  difference() {
    translate([20, 0, 0])
    cube([5,65,15]);
    c = 70;
    rotate([-75, 0, 0]) cube([c, c, c]); 
  }
}

module fixed_2_supports() {
  rotate([0, 180, 0])
  translate([15, 27, -5]) triangle_support();
  
  rotate([0, 180, 0])
  translate([-20, 27, -5]) triangle_support();
}


//translate([0, -30, -10]) ruler(170);
//translate([15, 28, -10]) ruler(112);
//translate([15, 50, -10]) rotate([90, 0, 0]) ruler(30);
//translate([20, 120, -10]) rotate([0, 0, 90]) ruler(40);
//translate([20, 110, -10]) rotate([0, 0, 90]) ruler(40);
//translate([10, 48, 2]) ruler(60);
