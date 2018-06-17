extends Node

onready var label1 = $"messages/mission 1"
onready var label2 = $messages/cong
onready var label3 = $messages/now
onready var label4 = $"messages/mission 2"


var temperature = 23
var looked = true

func _on_area_2d_area_entered(area):
	if not looked:
		$thermostat_hud.show()


func _on_button_pressed():
	temperature += 1
	update_temperature()


func _on_button2_pressed():
	temperature -= 1
	update_temperature()


func update_temperature():
	$thermostat_hud/label.text = str(temperature) + "ºC"
	$THERMOSTAT/thermostat.text = str(temperature) + "ºC"

	if temperature > 24 or temperature < 22:
		$thermostat_hud.hide()
		$animation_player.play("New Anim")
		$player.look = true
		$player.new_pos = Vector2(180, 170)


func _on_mission_1_hide():
	label2.show()
	$messages/cong/timer.start()


func _on_timer_timeout():
	label2.hide()
	label3.show()
	$messages/now/timer2.start()
	$toasty/animation_player.play("toasty")


func _on_timer2_timeout():
	label3.hide()
	label4.show()


func _on_mission_2_visibility_changed():
	looked = false
