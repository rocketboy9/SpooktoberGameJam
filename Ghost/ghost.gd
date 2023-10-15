extends CharacterBody2D

signal game_over()

var player
@export var speed: int = 100

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	if randi() % 5 == 0:
		$GhostSprite.texture = preload("res://images/464c355d4dfa7b0df9489786dca87ae8.25.png")

func _process(delta):
	var normal_to_player = (player.position - position).normalized()
	velocity = normal_to_player * speed
	move_and_slide()
	
	if normal_to_player.x < 0 and $GhostSprite.scale.x < 0:
		$GhostSprite.scale.x *= -1
	elif normal_to_player.x > 0 and $GhostSprite.scale.x > 0:
		$GhostSprite.scale.x *= -1


func _on_death_area_body_entered(body):
	if "lastDirectionLooked" in body:
		game_over.emit()
