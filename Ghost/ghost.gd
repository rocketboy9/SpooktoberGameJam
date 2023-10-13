extends CharacterBody2D

signal game_over()

func _on_death_area_body_entered(body):
	if "lastDirectionLooked" in body:
		game_over.emit()
