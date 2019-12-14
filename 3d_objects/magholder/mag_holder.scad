include <ruler.scad>

$fn=60;

module holder() {
    magnet_diameter = 10;
    
    difference() {
        cube([50, 20, 60]);
        translate([25, 10, 20])
        cylinder(d=magnet_diameter, h=40);
     }  
}
//

//module pin_hole_holder() {
//    pin_diameter = 5;
//    translate([10, 10, 45])
//    cylinder(d=pin_diameter, h=15);
//    translate([40, 10, 45])
//    cylinder(d=pin_diameter, h=15);     
//}
//

//module block_holder() {
//    hold_diameter = 3.8;
//    translate([10, 10, 0])
//    cylinder(d=hold_diameter, h=15);
//    translate([40, 10, 0])
//    cylinder(d=hold_diameter, h=15);
//}

//module pin_hole_servo() {
//    servo_pin_diameter = 3.8;
//    translate([0, 10, 40])
//    rotate([0,90,0])
//    cylinder(d=servo_pin_diameter, h=6);
//
//}

//module wheel_space() {
//    cube_size = 15;
//    translate([0, 0, 50])
//    cube([cube_size, 20, cube_size]);
//
//    translate([35, 0, 50])
//    cube([cube_size, 20, cube_size]);
//}

//module wheel_space_with_holes() {
//    pin_diameter = 5;
//
//    difference() {
//      wheel_space();
//      translate([10, 10, 35])
//      cylinder(d=pin_diameter, h=25);
//    }
//}


//module build_block () {
//  difference() {
//    holder();
//    pin_hole_holder();
//    block_holder();
//    pin_hole_servo();
//  }
//}

//difference() {
//  build_block();
//  wheel_space_with_holes();
//}

left_right_cube_hight = 50;
middle_cube_hight = 60;
cube_size = 20;

module left_cube() {
    translate([30, 0, 0]) cube([cube_size, cube_size, left_right_cube_hight]);
}

module middle_cube() {
    translate([15, 0, 0]) cube([cube_size, cube_size, middle_cube_hight]);
}

module right_cube() {
    translate([0, 0, 0]) cube([cube_size, cube_size, left_right_cube_hight]);
}

left_cube();
middle_cube();
right_cube();

translate([0, 0, 0]) rotate([90, 0, 0]) ruler(70);
translate([0, 0, 0]) rotate([90, 90, 0]) ruler(60);
translate([0, 0, 50]) rotate([90, 90, 0]) ruler(60);
