extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite: AnimatedSprite2D = $Sprite


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	change_direction(direction)
	change_animation(direction)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func change_animation(direction) ->void:
	if direction==0:
		sprite.play("idle")
	else:
		sprite.play("run")
	
func change_direction(direction) -> void:
	if direction > 0:
		sprite.flip_h=false
	elif direction < 0:
		sprite.flip_h=true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player": # ili if body == self
		get_parent().reset_score()
		get_tree().call_deferred("change_scene_to_file", "res://Game.tscn")
