extends CharacterBody2D

signal game_over()

var player
@export var speed = 100

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _process(delta):
	var normal_to_player = (player.position - position).normalized()
	var velocity = normal_to_player * speed
	position += velocity * delta

func _on_death_area_body_entered(body):
	if "lastDirectionLooked" in body:
		game_over.emit()
