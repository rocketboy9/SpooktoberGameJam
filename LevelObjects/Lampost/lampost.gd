extends StaticBody2D

var InArea: bool = false
var selfbody = null

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if InArea && selfbody.global_position.y < global_position.y :#hardcoded this because y not
		z_index = 1
	else:
		z_index = 0
	
	#gives the animation a 1/250 chance to play at any give time
	if randi()%250 == 0:	
		$FlickerAnimation.play("LampFlicker")


func _on_area_2d_body_entered(body):
	selfbody = body
	if body != $".": 
		InArea = true
		print("in lampost")


func _on_area_2d_body_exited(body):
	InArea = false
	z_index = 0
	print("out of lampost")
