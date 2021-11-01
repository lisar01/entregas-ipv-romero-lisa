extends Node

onready var player = $Environment/Player
onready var bgm = $Environment/Background

export (AudioStream) var gameover_bgm


func _ready():
	randomize()
	player.initialize(self)
	GameState.connect("level_lost", self, "_death_audio")

func _unhandled_input(event):
	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

func _death_audio():
	bgm.stream = gameover_bgm
	bgm.play()
