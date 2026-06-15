use godot::classes::RefCounted;
use godot::prelude::*;

#[derive(GodotClass)]
#[class(base=RefCounted, no_init)]
struct Checksums {
    speed: f64,
    angular_speed: f64,

    base: Base<RefCounted>,
}
