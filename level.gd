extends Node2D

func _process(_delta):
	pass
	
func _ready():
	var Gravestones = $Gravestones.get_children() #this crap assigns notes to a random 5 unique gravestones
	Gravestones[1].HasNote = true
	var uniqueNumbers = []
	while uniqueNumbers.size() < 4:
		var randomNum = randi() % Gravestones.size()
		if not uniqueNumbers.has(randomNum):
			uniqueNumbers.append(randomNum)
			Gravestones[randomNum].HasNote = true
			
	for gravestone in Gravestones:#this for loop is for testing purposes so that I can verify that gravestones are getting assigned with notes
		if gravestone.HasNote == true: print("this gravestone has a note")
		elif gravestone.HasNote == false: print("this gravestone does not have a note")


func _on_north_border_body_entered(_body):
	$Player.position.y *= -1
	$Player.position.y -= 100


func _on_west_border_body_entered(_body):
	$Player.position.x *= -1
	$Player.position.x -= 100


func _on_east_border_body_entered(_body):
	$Player.position.x *= -1
	$Player.position.x += 100


func _on_south_border_body_entered(_body):
	$Player.position.y *= -1
	$Player.position.y += 100



