extends RigidBody2D

@export var fuse_time: float = 1.5
@export var explosion_radius: float = 180.0
@export var explosion_force: float = 1000.0

var shooter: CharacterBody2D

func _ready() -> void:
	if shooter:
		add_collision_exception_with(shooter)

	explode_after_delay()
	
	
	
func explode_after_delay() -> void:
	await get_tree().create_timer(fuse_time).timeout
	explode()
	
func explode() -> void:
	if is_instance_valid(shooter):
		var offset = shooter.global_position - global_position
		var distance = offset.length()

		if distance <= explosion_radius:
			var direction = offset.normalized()

			if direction == Vector2.ZERO:
				direction = Vector2.UP

			var strength = explosion_force * (1.0 - distance / explosion_radius)

			shooter.velocity += direction * strength

	queue_free()
