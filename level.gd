extends Node2D


func _on_north_border_body_entered(body):
	$Player.position.y *= -1
	$Player.position.y -= 100


func _on_west_border_body_entered(body):
	$Player.position.x *= -1
	$Player.position.x -= 100


func _on_east_border_body_entered(body):
	$Player.position.x *= -1
	$Player.position.x += 100


func _on_south_border_body_entered(body):
	$Player.position.y *= -1
	$Player.position.y += 100

