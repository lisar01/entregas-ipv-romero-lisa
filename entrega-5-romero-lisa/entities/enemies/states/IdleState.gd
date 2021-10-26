extends "res://entities/enemies/states/AbstractEnemyState.gd"

onready var idle_timer:Timer = $IdleTimer


func notify_body_entered(body):
	.notify_body_entered(body)
	if parent._can_see_target():
		emit_signal("finished", "alert")


func enter():
	parent.animated_sprite.play("idle")
	idle_timer.start()


func exit():
	parent.animated_sprite.stop()
	idle_timer.stop()


func update(delta:float):
	parent.apply_movement()


func _on_IdleTimer_timeout():
	if parent.target == null:
		emit_signal("finished", "walk")
