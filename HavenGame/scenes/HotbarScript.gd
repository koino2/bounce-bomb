
extends HBoxContainer

@onready var player = get_node("../../Player")

var selected_slot: int = 0

func _ready():
	update_selection()

func _process(_delta):
	if Input.is_action_just_pressed("hotbar_1"):
		selected_slot = 0
	elif Input.is_action_just_pressed("hotbar_2"):
		selected_slot = 1
	elif Input.is_action_just_pressed("hotbar_3"):
		selected_slot = 2
	elif Input.is_action_just_pressed("hotbar_4"):
		selected_slot = 3
	player.selectedSlot = selected_slot
	update_selection()

func update_selection():
	for i in range(get_child_count()):
		var slot = get_child(i)

		if i == selected_slot:
			slot.modulate = Color(1.0, 0.85, 0.3)
		else:
			slot.modulate = Color.WHITE
