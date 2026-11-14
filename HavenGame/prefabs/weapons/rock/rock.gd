extends RigidBody2D

var shooter: PhysicsBody2D

func _ready() -> void:
	if shooter:
		add_collision_exception_with(shooter)	
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body):
	queue_free()
