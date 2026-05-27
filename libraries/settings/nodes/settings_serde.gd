@abstract
class_name SettingsSerde
extends Node

@export var store: SettingsStore
@export var key: StringName
@export var control: Control


@abstract func load() -> Error


@abstract func apply() -> Error
