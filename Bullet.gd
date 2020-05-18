extends RigidBody2D

const HitEfecto = preload("res://HitEfecto.tscn")


func crear_efecto_hit():
	var main = get_tree().current_scene
	var hitEfecto = HitEfecto.instance()
	main.add_child(hitEfecto)
	hitEfecto.global_position = global_position
