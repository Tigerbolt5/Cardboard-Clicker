extends Node

var upgrade = 0
var autoclicker = 0
export var count = 0

var data = {
	count = count,
	upgrade = upgrade,
	auto_clicker = [
		0,0,0,0
	]
}

func _ready():
	var file = File.new()
	if file.file_exists("user://save.txt"):
		file.open("user://save.txt", File.READ)
		data = parse_json(file.get_line())
		count = data.count
		upgrade = data.count
		
		var index = 0
		for dac in data.auto_clicker:
			$Auto.get_children()[index].update_value(dac)
			index += 1

func _on_Button_pressed():
	var upgrade = get_node("Upgrade").get("amount")
	count += 1 + upgrade

func _process(delta):
	$Count.text = str(count)
	$Upgrade/Amount.text = str(upgrade)

func _on_Saving_timeout():
	data.count = count
	data.upgrade = upgrade
	
	var index = 0
	for ac in $Auto.get_children():
		data.auto_clicker[index] = ac.amount
		index += 1

	var file = File.new()
	file.open("user://save.txt", File.WRITE)
	file.store_line(to_json(data))
	file.close()
