extends StaticBody2D


var InArea: bool = false
var PlayerInArea: bool = false
var HasNote: bool = false
var selfbody = null
signal PlayerInRangeOfGravestone

func _process(_delta):
	if InArea && selfbody.global_position.y < global_position.y:
		z_index = 1
	else:
		z_index = 0


# Create body exited thingy that goes along with this
func _on_area_2d_body_entered(body):
	selfbody = body
	if body != $".": 
		InArea = true
		if body.is_in_group("Player"):
			PlayerInArea = true
			PlayerInRangeOfGravestone.emit()
			print("player in range to talk interact with gravestone")


func _on_area_2d_body_exited(body):
	InArea = false
	z_index = 0
	if body.is_in_group("Player"):
		PlayerInArea = false
		print("player no longer in range to interact with the gravestone")
