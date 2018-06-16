extends Node

var temperature = 30


func _on_area_2d_area_entered(area):
	$thermostat.show()


func _on_button_pressed():
	temperature += 1
	update_temperature()


func _on_button2_pressed():
	temperature -= 1
	update_temperature()


func update_temperature():
	$thermostat/h_split_container/label.text = str(temperature) + "ºC"