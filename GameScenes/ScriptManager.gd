extends Node3D

@export var wall_scene = "res://Towers_and_wall/Wall.tscn"  

var current_wall: StaticBody3D = null
var is_placing_wall = false
var grid_size = 2.0  # Размер сетки для привязки

