extends StaticBody2D

var HasNote: bool = false
signal PlayerInRangeOfGravestone
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(_body):#create body exited thingy that goes along with this
	if _body != $".": 
		PlayerInRangeOfGravestone.emit()
		print("player in range to talk interact with gravestone")
