extends Node2D

var enemy_node = preload("res://Scenes/zombie_enemy.tscn")
var timer : Timer
var can_ins
var rng
var pos_random
var r1
var r2
var r3
var r4
var spawn_limit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = get_node("InsTimer")
	can_ins = true
	spawn_limit = 18
	r1 = Vector2(1300, -1300)
	r2 = Vector2(-1000, -330)
	r3 = Vector2(1450, -390)
	r4 = Vector2(-90, -450)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_ins == true and spawn_limit > 0:
		can_ins = false
		spawn_limit -= 1
		timer.start()

func _ins(pos):
	var ins = enemy_node.instantiate()
	ins.position = pos
	add_child(ins)


func _on_ins_timer_timeout() -> void:
	rng = RandomNumberGenerator.new()
	rng.randomize()
	pos_random = rng.randi_range(0, 4)
	if pos_random == 0:
		_ins(r1)
	elif pos_random == 1:
		_ins(r2)
	elif pos_random == 2:
		_ins(r3)
	elif pos_random == 3:
		_ins(r4)
	can_ins = true
