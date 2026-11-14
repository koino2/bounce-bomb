extends Weapon

@export var rock_scene:PackedScene
@export var throw_force:float = 500
@export var recoil_force:float = 250

@onready var player = get_parent() as CharacterBody2D

var timeSinceLastShot:float = 0
@export var cooldown:float = 0.2

func shoot(_direction: Vector2):
	if timeSinceLastShot <= cooldown: return
	else:
		timeSinceLastShot = 0
	var rock = rock_scene.instantiate()
	rock.shooter = get_parent()
	
	get_tree().current_scene.add_child(rock)
	rock.global_position = global_position
	rock.linear_velocity = _direction * throw_force
	
	player.velocity -= _direction * recoil_force

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timeSinceLastShot += delta
