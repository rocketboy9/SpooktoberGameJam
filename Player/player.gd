extends CharacterBody2D

@export var speed: int = 1500#110
@export var sprint_speed: int = 1500#225
var lastDirectionLooked: int
signal PressedInteract


func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_released("sprint") && speed > 125:
		speed = 1500#125
	
	if Input.is_action_pressed("sprint"):
		if Globals.stamina > 0 && $SprintResetTimer.is_stopped():
			speed = 225
		if (Input.get_vector("left", "right", "up", "down") == Vector2(0, 0) || !$SprintResetTimer.is_stopped()) && Globals.stamina < 125 && $StaminaDepletionTimer.is_stopped():
			Globals.stamina += 5
			$StaminaDepletionTimer.start()
	
	if speed > 125 && $StaminaDepletionTimer.is_stopped() && Input.get_vector("left", "right", "up", "down") != Vector2(0, 0):
		Globals.stamina -= 5
		$StaminaDepletionTimer.start()
	
	if Globals.stamina <= 0:
		$SprintResetTimer.start()
		speed = 125
	
	if Globals.stamina < 125 && $StaminaDepletionTimer.is_stopped() && !Input.is_action_pressed("sprint"):
		Globals.stamina += 5
		$StaminaDepletionTimer.start()
	
	velocity = direction * speed
	move_and_slide()
	
	# Holds the flashlight angle based on what was last pressed
	if direction != Vector2(0,0):
		$LightStuff.rotation = direction.angle() - PI
		lastDirectionLooked = $LightStuff.rotation
	
	#flips sprite on the y axis based on when you're going left or right
	if Input.is_action_just_pressed("left") and $PlayerSprite.scale.x < 0:
		$PlayerSprite.scale.x *= -1
	elif Input.is_action_just_pressed("right") and $PlayerSprite.scale.x > 0:
		$PlayerSprite.scale.x *= -1
	

func _input(event):
	if event.is_action_pressed("Interact"):
		PressedInteract.emit()
		
