extends CharacterBody2D

const moveSpeed = 25
const maxSpeed = 50

const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 15

@onready
var sprite = $Sprite2D

@onready
var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	velocity.y += gravity
	
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true;
		animationPlayer.play("walk")
		velocity.x = min(velocity.x+moveSpeed,maxSpeed)
		
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h =false;
		animationPlayer.play("walk")
		velocity.x = max(velocity.x - moveSpeed,-maxSpeed)
		
	else:
		animationPlayer.play("idle")
		friction = true

	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = jumpHeight
		if friction == true:
			velocity.x = lerp(velocity.x,0.0,0.5)
	
	else:
		if friction == true:
			velocity.x = lerp(velocity.x,0.0,0.01)		
	
	move_and_slide()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
