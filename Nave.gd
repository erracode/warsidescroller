extends Area2D

export (int) var SPEED = 100

const Bullet = preload("res://Bullet.tscn")
const ExplosionEfecto = preload("res://ExplosionEfecto.tscn")

signal muerte_jugador

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= SPEED * delta
	
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_just_pressed("ui_accept"):
		fire_bullet()

func fire_bullet():
	var bullet = Bullet.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position


func _on_Nave_area_entered(area):
	area.queue_free()
	queue_free()
	
func _exit_tree():
	var main = get_tree().current_scene
	var explosionEfecto = ExplosionEfecto.instance()
	main.add_child(explosionEfecto)
	explosionEfecto.global_position = global_position
	emit_signal("muerte_jugador")
