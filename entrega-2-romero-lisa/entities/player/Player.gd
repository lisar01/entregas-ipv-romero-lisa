extends Sprite

onready var cannon: Sprite = $Cannon
var proyectile_container: Node

var speed = 200 #pixeles

func set_proyectile_container(container:Node):
	cannon.proyectile_container = container
	proyectile_container = container

func _physics_process(delta):
	var direction_optimazed: int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))

	var mouse_position: Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)

	if Input.is_action_just_pressed("fire"):
		cannon.fire()

	position.x += direction_optimazed * speed * delta
