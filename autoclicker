extends Control

var amount = 0
var increment = 2
export var price = 5
export var ups = 1
var start_price = price

var main_node 

func _ready():
	main_node = get_tree().get_root().get_node("Main")
	start_price = price
	update_value(amount)

func update_value(new_value):
	amount = new_value
	if new_value == 0:
		price = start_price
	else:
		price = (new_value * increment) * start_price
	$Label2.text = str(amount)
	$Price.text = "Price: " + str(price)
	$UPS/Value.text = str(ups)

func _on_Button2_pressed():
	if main_node.count >= price:
		main_node.count -= price
		update_value(amount + 1)

func _on_Timer_timeout():
	main_node.count += amount * ups

func _process(delta):
	if main_node.count >= price:
		$Button2.disabled = false
	else:
		$Button2.disabled = true
