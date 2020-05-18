extends Node

var puntos = 0 setget set_puntos

onready var puntosLabel = $PuntosLabel

func set_puntos(valor):
	puntos = valor
	actualizar_label_puntos()

func actualizar_label_puntos():
	puntosLabel.text = "Puntos =" + str(puntos)

func actualizar_datos_guardados():
	var save_data = SaveAndLoad.cargar_datos_desde_archivo()
	if puntos > save_data.puntaje:
		save_data.puntaje = puntos
		SaveAndLoad.guardar_datos_en_archivo(save_data)

#func _on_Enemy_puntos_add():
#	self.puntos += 10


func _on_Nave_muerte_jugador():
	actualizar_datos_guardados()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://PantallaGameOver.tscn")
