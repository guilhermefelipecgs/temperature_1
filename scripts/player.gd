extends Node2D

const SPEED = 3

onready var new_pos = self.position
var look = false


func _input(event):
	if look:
		return

	if event is InputEventMouseButton:

		if event.button_index == BUTTON_LEFT:
			new_pos = event.position


func _process(delta):
	if $"../thermostat_hud".visible:
		$animated_sprite.animation = "idle"
		return

	if abs(position.x - new_pos.x) > SPEED or abs(position.y - new_pos.y) > SPEED:
		position += SPEED * (new_pos - position).normalized()
		$animated_sprite.animation = "walk_h"

		if position.x < new_pos.x:
			$animated_sprite.flip_h = true
		else:
			$animated_sprite.flip_h = false
	else:
		$animated_sprite.animation = "idle"
