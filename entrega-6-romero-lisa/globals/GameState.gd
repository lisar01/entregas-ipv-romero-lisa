extends Node

signal level_won()
signal level_lost()

func notify_level_won():
	emit_signal("level_won")

func notify_level_lost():
	emit_signal("level_lost")
