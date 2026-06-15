use godot::prelude::*;

mod checksums;

struct GameExtension;

#[gdextension]
unsafe impl ExtensionLibrary for GameExtension {}
