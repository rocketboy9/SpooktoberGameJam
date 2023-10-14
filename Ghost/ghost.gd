extends CharacterBody2D

signal game_over()

var player
@export var speed = 100

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	if randi() % 5 == 0:
		$GhostSprite.texture = preload("res://images/464c355d4dfa7b0df9489786dca87ae8.25.png")

func _process(delta):
	var normal_to_player = (player.position - position).normalized()
	var velocityy = normal_to_player * speed
	position += velocityy * delta

func _on_death_area_body_entered(body):
	if "lastDirectionLooked" in body:
		game_over.emit()
