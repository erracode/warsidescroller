extends Area2D

const ExplosionEfecto = preload("res://ExplosionEfecto.tscn")

export(int) var SPEED = 20
export(int) var ARMOR = 3

#signal puntos_add

#func _ready():
#	var main = get_tree().current_scene
#	if main.is_in_group("World"):
#		connect("puntos_add",main,"_on_Enemy_puntos_add")

func _process(delta):
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body):
	body.queue_free()
	body.crear_efecto_hit()
	ARMOR -= 1
	if ARMOR <= 0:
		crear_explosion()
		agregar_puntaje()
		queue_free()

func agregar_puntaje():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		main.puntos += 10

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func crear_explosion():
	var main = get_tree().current_scene
	var explosionEfecto = ExplosionEfecto.instance()
	main.add_child(explosionEfecto)
	explosionEfecto.global_position = global_position
