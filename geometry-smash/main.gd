class_name Main
extends Node

var level_scene = preload("res://level.tscn")

var current_level

func _ready() -> void:
	current_level = level_scene.instantiate()
	add_child(current_level)

func reload_level():
	current_level.queue_free()
	current_level = level_scene.instantiate()
	add_child(current_level)
