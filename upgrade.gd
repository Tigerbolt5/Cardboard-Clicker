extends Control

var amount = 0
var increment = 2
export var price = 5
export var cpc = 1
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
	$Amount.text = str(amount)
	$Price.text = "Price: " + str(price)
	$CPC/Value.text = str(cpc)

func _on_Button_pressed():
	if main_node.count >= price:
		main_node.count -= price
		update_value(amount + 1)

func _on_Timer_timeout():
	main_node.count += amount * cpc

func _process(delta):
	if main_node.count >= price:
		$Button.disabled = false
	else:
		$Button.disabled = true
