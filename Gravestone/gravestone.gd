extends StaticBody2D


var InArea: bool = false
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
		PlayerInRangeOfGravestone.emit()
		print("player in range to talk interact with gravestone")


func _on_area_2d_body_exited(_body):
	InArea = false
	z_index = 0
	print("player no longer in range to interact with the gravestone")
