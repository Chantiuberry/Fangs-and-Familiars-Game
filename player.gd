extends CharacterBody2D

const  speed = 200
var current_dir = "none"

func _physics_process(_delta):
	player_movement(_delta)
	
func player_movement(_delta):
	var input_dir = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		input_dir.x += 1
		current_dir = "right"
	elif Input.is_action_pressed("move_left"):
		input_dir.x -= 1
		current_dir = "left"

	#if Input.is_action_pressed("move_down"):
		#input_dir.y += 1
		#current_dir = "down"
	#elif Input.is_action_pressed("move_up"):
		#input_dir.y -= 1
		#current_dir = "up"

	if input_dir != Vector2.ZERO:
		input_dir = input_dir.normalized()
		velocity = input_dir * speed
		play_anim(1)
	else:
		velocity = Vector2.ZERO
		play_anim(0)

	move_and_slide()

	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("idle")
	
				
