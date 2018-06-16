extends Node

var temperature = 30


func _on_area_2d_area_entered(area):
	$thermostat_hud.show()


func _on_button_pressed():
	temperature += 1
	update_temperature()


func _on_button2_pressed():
	temperature -= 1
	update_temperature()


func update_temperature():
	$thermostat_hud/h_split_container/label.text = str(temperature) + "ºC"

	if temperature > 31:
		$thermostat_hud.hide()
		$enemy/animation_player.play("New Anim")
		$player.look = true
		$player.new_pos = Vector2(270, 320)
