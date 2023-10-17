extends StaticBody2D

var InArea: bool = false
var selfbody = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if InArea && selfbody.global_position.y < global_position.y:
		z_index = 1
	else:
		z_index = 0


func _on_area_2d_body_entered(body):
	selfbody = body
	if body != $".": 
		InArea = true
		print("in shed")


func _on_area_2d_body_exited(body):
	InArea = false
	z_index = 0
	print("out of shed")
