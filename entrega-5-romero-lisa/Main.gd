extends Node

onready var player = $Environment/Player
onready var tween = $Environment/Tween
onready var fade = $Environment/GameOver

func _ready():
	randomize()
	player.initialize(self)

func _unhandled_input(event):
	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

func end_level():
	tween.interpolate_property(fade, "color", fade.color, Color.black, 1)
	tween.start()
