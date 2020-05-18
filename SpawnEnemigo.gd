extends Node2D

const Enemy = preload("res://Enemy.tscn")

onready var puntosSpawn = $PuntoSpawn

func get_punto_spawn():
	var puntos = puntosSpawn.get_children()
	puntos.shuffle()
	return puntos[0].global_position

func spawn_enemigo():
	var spawn_punto = get_punto_spawn()
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn_punto



func _on_Timer_timeout():
	spawn_enemigo()
