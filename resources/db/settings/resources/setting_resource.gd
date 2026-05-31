@abstract
class_name SettingResource
extends PersistedResource

@abstract func applied() -> Error


@abstract func serialize() -> Dictionary[String, Variant]


@abstract func deserialize(data: Dictionary[String, Variant]) -> Error
