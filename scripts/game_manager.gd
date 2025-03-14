extends Node

var score = 0
@onready var count_coins: Label = $"../GUI/PanelContainer/GridContainer/CountCoins"

func add_point():
	score += 1
	count_coins.text = str(score)
