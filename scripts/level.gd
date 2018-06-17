extends Node

var temperature = 30

onready var label1 = $"messages/mission 1"
onready var label2 = $messages/cong
onready var label3 = $messages/now
onready var label4 = $"messages/mission 2"


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
	$thermostat.text = str(temperature) + "ºC"

	if temperature > 31:
		$thermostat_hud.hide()
		$enemy/animation_player.play("New Anim")
		$player.look = true
		$player.new_pos = Vector2(180, 170)


func _on_mission_1_hide():
	label2.show()


func _on_timer_timeout():
	label2.hide()
	label3.show()
	$messages/now/timer2.start()


func _on_timer2_timeout():
	label3.hide()
	label4.show()
