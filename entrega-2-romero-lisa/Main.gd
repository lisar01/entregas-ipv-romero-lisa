extends Node

 #Called when the node enters the scene tree for the first time.
func _ready():
	$Player.set_proyectile_container(self)
	$Turret.set_values($Player, self)
