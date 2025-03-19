extends Node

var visisted_block = 0
var score = 0
var keys = 0
@onready var count_coins: Label = $"../GUI/PanelContainer/GridContainer/CountCoins"
@onready var count_keys: Label = $"../GUI/PanelContainer/GridContainer/CountKeys"
@onready var door: Area2D = $"../Door"
@onready var final: Label = $"../Labels/Final"

func add_point():
	score += 1
	count_coins.text = str(score)

func add_key():
	keys += 1
	count_keys.text = str(keys)
	
	print(keys)
	if keys >= 3:
		final.visible = false
		door.visible = true

func add_visited_block():
	visisted_block += 1

func use_point():
	score -= 20
	count_coins.text = str(score)
