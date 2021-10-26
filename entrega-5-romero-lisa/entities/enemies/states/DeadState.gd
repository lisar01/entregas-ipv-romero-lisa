extends "res://entities/enemies/states/AbstractEnemyState.gd"


func enter():
	parent.animated_sprite.play("dead")
	parent.call_deferred("_remove")
	
	
