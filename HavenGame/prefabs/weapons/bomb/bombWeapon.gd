extends Weapon

@export var bomb_scene: PackedScene
@export var throw_force: float = 500.0
@export var recoil_force: float = 50.0

@onready var player = get_parent() as CharacterBody2D

var timeSinceLastShot:float = 0
@export var cooldown:float = 1

func shoot(_direction: Vector2):
	if timeSinceLastShot <= cooldown: return
	else:
		timeSinceLastShot = 0
	var bomb = bomb_scene.instantiate()
	bomb.shooter = player

	get_tree().current_scene.add_child(bomb)

	bomb.global_position = global_position
	bomb.linear_velocity = _direction * throw_force

	player.velocity -= _direction * recoil_force

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timeSinceLastShot += delta
