extends Sprite
class_name Proyectile

signal delete_requested(proyectile)
export (float) var speed
#Vector normalizado
var direction: Vector2

func _ready():
	set_physics_process(false)
	
func set_starting_values(starting_position: Vector2, direction: Vector2):
	global_position = starting_position
	self.direction = direction
	$Timer.start()
	set_physics_process(true)

func _physics_process(delta):
	position += direction*speed*delta

func _on_Timer_timeout():
	emit_signal("delete_requested", self)
