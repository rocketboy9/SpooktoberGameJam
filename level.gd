extends Node2D

@onready var Gravestones = $Gravestones.get_children() #this crap assigns notes to a random 5 unique gravestones

func _process(_delta):
	pass
	
func _ready():

	var uniqueNumbers = []
	while uniqueNumbers.size() < Globals.NoteAmount:
		var randomNum = randi() % Gravestones.size()
		if not uniqueNumbers.has(randomNum):
			uniqueNumbers.append(randomNum)
			Gravestones[randomNum].HasNote = true
			
	for gravestone in Gravestones:#this for loop is for testing purposes so that I can verify that gravestones are getting assigned with notes
		if gravestone.HasNote == true: print("Has note")
		elif gravestone.HasNote == false: print("No note")


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


func _on_player_pressed_interact():
	print("player just interacted")
	var gravestones = $Gravestones.get_children()
	var targetGravestone
	
	for gravestone in gravestones:#checks for the gravestone that has InArea == true
		if gravestone.InArea:
			targetGravestone = gravestone
			print("communicated with the thingy")
			break
	
	if targetGravestone == null:#if no gravestones are in range in the area then return
		return
		
	if targetGravestone.HasNote == false:
		print("no note on this bad boy")
	elif targetGravestone.HasNote == true:
		Globals.NotesFoundCount += 1
		targetGravestone.HasNote = false
		print("You found note number " + str(Globals.NotesFoundCount))
		if Globals.NoteAmount == Globals.NotesFoundCount:
			print("you win!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		
