extends CharacterBody2D

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	position += velocity *delta
	move_and_slide()
	
	print(direction)
	$".".rotation = direction.angle() - PI

	
	
		
	
	
	
	
