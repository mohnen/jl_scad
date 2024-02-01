module X(x) translate([x,0,0]) children();
module Y(y) translate([0,y,0]) children();
module Z(z) translate([0,0,z]) children();
module M(x=0,y=0,z=0) {
    v = is_list(x) ? x : [x,y,z];
    translate(v) children();
}

// this one allows to zoom into the half, and set the color of the cut surface.
module cut_inspect(dir=BACK, s=100, ofs=[0,0,0], color="#58c") {
    intersection() {
        children();
        translate(ofs+dir*s/2)
            color(color)
                cube(s, center=true);
    }
}

module preview(c="#66f7") if($preview) { if(c) recolor(c) children(); else children(); }
