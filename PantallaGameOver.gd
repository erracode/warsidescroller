extends Node

onready var puntajeLabel = $LabelPuntaje

func _ready():
	set_label_puntaje()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://MenuInicio.tscn")

func set_label_puntaje():
	var save_data = SaveAndLoad.cargar_datos_desde_archivo()
	puntajeLabel.text = "Puntaje :" + str(save_data.puntaje)
