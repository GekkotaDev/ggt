## A centralized cache for resources.
## [br]
## This is intended to be implemented as an autoload by a scene for use as a global data store. For
## alternative use cases the use of a [ContextProvider] may be more appropriate.
class_name ResourceStore
extends Node

## Cache.
@export var resources: Dictionary[String, Resource]
