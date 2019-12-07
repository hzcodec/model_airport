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

module pin_hole_holder() {
    pin_diameter = 4.8;
    translate([10, 10, 45])
    cylinder(d=pin_diameter, h=15);
    translate([40, 10, 45])
    cylinder(d=pin_diameter, h=15);     
}
//

module block_holder() {
    hold_diameter = 3.8;
    translate([10, 10, 0])
    cylinder(d=hold_diameter, h=15);
    translate([40, 10, 0])
    cylinder(d=hold_diameter, h=15);
}

module pin_hole_servo() {
    servo_pin_diameter = 3.8;
    translate([0, 10, 40])
    rotate([0,90,0])
    cylinder(d=servo_pin_diameter, h=6);

}

difference() {
    holder();
    pin_hole_holder();
    block_holder();
    pin_hole_servo();
}
