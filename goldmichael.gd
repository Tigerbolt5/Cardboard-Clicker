extends Control

var amount = 0
export var price = 5
var start_price = price

var main_node 
var autoclicker_node

func _ready():
	autoclicker_node = preload("res://AutoClicker.tscn").instance()
	main_node = get_tree().get_root().get_node("Main")
	start_price = price
	update_value(amount)

func update_value(new_value):
	amount = new_value
	if new_value == 0:
		price = start_price
	else:
		price = (new_value) * start_price

func _on_Button_pressed():
	if main_node.count >= price:
		main_node.count -= price
		update_value(amount + 1)
		autoclicker_node.amount *=  2

func _process(delta):
	if main_node.count >= price:
		$Button.disabled = false
	else:
		$Button.disabled = true
