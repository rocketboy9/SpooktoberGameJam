extends Node2D

@onready var Gravestones = $Gravestones.get_children() #this crap assigns notes to a random 5 unique gravestones
@onready var TimeLabel: Label = $WinScreen/GameOver/GameOverContainer/VBoxContainer/Time

var ghost_scene: PackedScene = preload("res://Ghost/ghost.tscn")

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	$UI/StaminAspectContainer/StaminaVBoxContainer/StaminaBar.value = Globals.stamina
	
	
func _ready():
	
	$Timer.start()

	var uniqueNumbers = []
	while uniqueNumbers.size() < Globals.NoteAmount:
		var randomNum = randi() % Gravestones.size()
		if not uniqueNumbers.has(randomNum):
			uniqueNumbers.append(randomNum)
			Gravestones[randomNum].HasNote = true
			
	for gravestone in Gravestones:#this for loop is for testing purposes so that I can verify that gravestones are getting assigned with notes
		if gravestone.HasNote == true: print("Has note")
		elif gravestone.HasNote == false: print("No note")


func _on_north_border_body_entered(body):
	if "lastDirectionLooked" in body:
		$Player.position.y *= -1
		$Player.position.y -= 100


func _on_west_border_body_entered(body):
	if "lastDirectionLooked" in body:
		$Player.position.x *= -1
		$Player.position.x -= 100


func _on_east_border_body_entered(body):
	if "lastDirectionLooked" in body:
		$Player.position.x *= -1
		$Player.position.x += 100


func _on_south_border_body_entered(body):
	if "lastDirectionLooked" in body:
		$Player.position.y *= -1
		$Player.position.y += 100


func _on_player_pressed_interact():
		
	print("player just interacted")
	var gravestones = $Gravestones.get_children()
	var targetGravestone
	
	# Checks for the gravestone that has PlayerInArea == true
	for gravestone in gravestones:
		if gravestone.PlayerInArea:
			targetGravestone = gravestone
			print("communicated with the thingy")
			break
	# If no gravestones are in range in the area then return/do nothing
	# This might not be necessary -Liam
	if targetGravestone == null:
		return
		
	if targetGravestone.HasNote == false:
		print("no note on this bad boy")
	elif targetGravestone.HasNote == true:
		Globals.NotesFoundCount += 1
		targetGravestone.HasNote = false
		print("You found note number " + str(Globals.NotesFoundCount))
		$UINotes.updateNoteCount()
		CreateGhost()
		
		if Globals.NoteAmount == Globals.NotesFoundCount:
			OpenGate()
			print("you win!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		
func OpenGate():
	var HorizontalGates = $Ground/FenceAtEntrance/Horizontals.get_children()
	for HGate in HorizontalGates:
		HGate.queue_free()
		
	var VerticalGates = $Ground/FenceAtEntrance/Verticals.get_children()
	for VGate in VerticalGates:
		VGate.visible = true
	
func CreateGhost():
	#Add Ghost for every note that is found
	var ghost = ghost_scene.instantiate() as CharacterBody2D
	var ghostSpawnPositions = $GhostSpawnPoints.get_children()
	var ghostSelectedSpawnPosition = ghostSpawnPositions[randi() % ghostSpawnPositions.size()]
	ghost.global_position = ghostSelectedSpawnPosition.position
	ghost.connect("game_over", _on_ghost_game_over)
	$Ghosts.add_child(ghost)
	
func _on_ghost_game_over():
	$GameOver.visible = true


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	Globals.NotesFoundCount = 0


func _on_quit_button_pressed():
	get_tree().quit()


func _on_win_area_body_entered(body):
	if Globals.NotesFoundCount == Globals.NoteAmount:
		$WinScreen.visible = true
		var time = round($Timer.wait_time - $Timer.time_left)
		TimeLabel.text = "Completed in " + str(time) + " seconds"
		$Timer.stop()
		
		
