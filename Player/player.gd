extends CharacterBody2D

@export var speed = 100
var lastDirectionLooked: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	position += velocity * delta
	if Input.is_action_just_pressed("sprint"):
		speed *= 2
	if Input.is_action_just_released("sprint"):
		speed /= 2
	move_and_slide()
	
	if direction != Vector2(0,0):#holds the flashlight angle based on what was last pressed
		$LightStuff.rotation = direction.angle() - PI
		lastDirectionLooked = $LightStuff.rotation
	
	if Input.is_action_just_pressed("left") and $Sprite2D.scale.x < 0:
		$Sprite2D.scale.x *= -1
	if Input.is_action_just_pressed("right") and $Sprite2D.scale.x > 0:
		$Sprite2D.scale.x *= -1
		
		
