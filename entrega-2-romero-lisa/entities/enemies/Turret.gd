extends Sprite

onready var fire_position:Position2D = $FirePosition
export (PackedScene) var proyectile_scene : PackedScene

var proyectile_container: Node
var player

func set_values(player, container):
	self.proyectile_container = container
	self.player = player
	$Timer.start()
		
func _on_Timer_timeout():
	fire()
	
func fire():
	var proyectile_instance: Proyectile = proyectile_scene.instance()
	proyectile_container.add_child(proyectile_instance)
	proyectile_instance.set_starting_values(fire_position.global_position, (player.global_position - fire_position.global_position).normalized())
	proyectile_instance.connect("delete_requested", self, "_on_proyectile_delete_requested")
	
func _on_proyectile_delete_requested(proyectile):
	proyectile_container.remove_child(proyectile)	
	proyectile.queue_free()
