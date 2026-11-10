extends Node2D

# Exports 
# exposes the value to the editor
# programmers - think of these as one of the variables in a class constructor

@export var fruit_dict = {"apple" : 0, "banana" : 1, "cherry" : 2}

enum fruit_e {APPLE, BANANA, CHERRY}
@export var fruit_enum: fruit_e

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($UI/LabelInvisible.text)
	
	#Singals
	var ui = get_node("UI")
	ui.custom_signal.connect(_button_pressed)
	
	
	SignalBus.custom_signal_bus.connect(_button_pressed_bus)
	
	# For loops
	
	var fruits = ["apple", "banana", "cherry"]
	
	for i in range(fruits.size()):
		print("Using range %d: %s" % [i, fruits[i]])
		print("Old School Index " + str(i) + ": " + fruits[i])
	
	var i = 0
	for fruit in fruits:
		print("Regular for loop %d: %s" % [i, fruit])
		i += 1
		
	# While loops
	var j = 0
	while( j < 5):
		print("%d < 5" % j)
		j += 1 # same as saying j = j + 1
		
	# Custom Functions
	
	print(_custom_func(5, "hello world"))
	
	# Arrays
	
	var ar = []
	ar.resize(10)
	ar.fill(0)
	
	print(ar)
	
	# Arrays - 2 dimensional
	var arr = [[11, 12, 5, 2], [15, 6,10], [10, 8, 12, 5], [12,15,8,6]]

	arr[2] = [11,9] # updating entire inner array
	arr[0][3] = 7 # updating a single value
	
	print(arr)
	
	# Dictionaries
	
	var scores: Dictionary = {"Alice": 90, "Bob": 85, "Carol": 92}
	
	for name in scores:
		print("%s: %d" % [name, scores[name]])
	
	# Nested Dictionary
	
	var student_dict: Dictionary = {
		"student": {
			"name": "Sam",
			"age": 20
		}
	}
	
	print(student_dict["student"]["name"])

func _custom_func(param1: int, param2: String) -> int:
	# The function declaration promised a return value that was of type int
	return param1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		SignalBus.update_ui.emit("Better Logo")
	
func _button_pressed(a, b, c):
	print(a)
	
func _button_pressed_bus(a, b):
	print(a)
