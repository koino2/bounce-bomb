extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var selectedSlot = 0
@onready var weapons: Array[Weapon] = [
	$RockWeapon, $BombWeapon
]
var active_weapon: Weapon

func select_weapon(slot: int):
	if slot >= 0 and slot < weapons.size():
		selectedSlot = slot
		active_weapon = weapons[selectedSlot]

func _exit_tree() -> void:
	get_tree().reload_current_scene()

func _process(delta: float) -> void:
	active_weapon = weapons[selectedSlot]
	if Input.is_action_just_pressed("shoot"):
		var direction = (get_global_mouse_position() - global_position).normalized()
		active_weapon.shoot(direction)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, 1200 * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, 300 * delta)

	move_and_slide()
