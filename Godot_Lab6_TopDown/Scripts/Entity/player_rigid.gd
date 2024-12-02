extends RigidBody2D

class_name Player_Rigid

@onready var health_system = $HealthSystem as HealthSystem
@onready var shooting_system = $ShootingSystem as ShootingSystem
@onready var shot_stream_player = $Sounds/ShotStreamPlayer
@onready var reload_stream_player = $Sounds/ReloadStreamPlayer

@onready var move_up = Vector2(0, -5)
@onready var move_down = Vector2(0, 5)
@onready var move_right = Vector2(5, 0)
@onready var move_left = Vector2(-5, 0)

@export var damage_per_bullet = 5

@export var player_ui: PlayerUI
@export var speed = 50
@export var rotation_speed = 5

var movement_direction: Vector2 = Vector2.ZERO
var angle
var has_key = false

func _physics_process(delta):
	if Input.is_action_pressed("move_forward"):
		if self.linear_velocity.y < speed:
			self.apply_impulse(move_up, Vector2(0,0))
	if Input.is_action_pressed("move_backwards"):
		if self.linear_velocity.y > -speed:
			self.apply_impulse(move_down, Vector2(0,0))
	if Input.is_action_pressed("move_right"):
		if self.linear_velocity.x < speed:
			self.apply_impulse(move_right, Vector2(0,0))
	if Input.is_action_pressed("move_left"):
		if self.linear_velocity.x > -speed:
			self.apply_impulse(move_left, Vector2(0,0))
	
	if angle:
		global_rotation = lerp_angle(global_rotation, angle, delta * rotation_speed)

func _input(event):
	angle = (get_global_mouse_position() - global_position).angle()
