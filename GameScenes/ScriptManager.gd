extends Node3D

# Путь к сцене стены
var wall_scene_path: String = "res://Towers_and_wall/Wall.tscn"
var wall_scene: PackedScene

# Размер сетки для привязки
@export var grid_size: float = 1.0

# Узлы для управления камерой и RayCast
@onready var camera = $Camera3D
@onready var raycast = $Camera3D/RayCast3D
@onready var button = $CanvasLayer/Button

func _ready():
	# Загружаем сцену стены
	wall_scene = load(wall_scene_path) as PackedScene


