extends Control

var heart_full = preload("res://assets/textures/gui/hud_heartFull.png")
var heart_empty = preload("res://assets/textures/gui/hud_heartEmpty.png")

func update_health(new_health):
	var i_row = new_health / 10
	var j_heart = new_health % 10
	$VBoxContainer.get_child(i_row).get_child(j_heart).texture = heart_empty
