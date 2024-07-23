extends Node3D

@onready var Enemy: Node3D = $Enemies/Enemy

func _ready():
	Enemy.visible = false

func _on_start_pressed():
	Enemy.visible = true
