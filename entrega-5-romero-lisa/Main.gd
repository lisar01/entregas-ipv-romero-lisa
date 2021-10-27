extends Node

onready var player = $Environment/Player
var control_scene = preload("res://gui/Control.tscn").instance()

func _ready():
	randomize()
	player.initialize(self)

func _unhandled_input(event):
	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

func end_level():
	get_tree().get_root().add_child(control_scene)
