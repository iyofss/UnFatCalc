extends Control

@onready var calc_textbox: LineEdit = $Panel/VBoxContainer/MarginContainer/Calc/CalcTextbox
@onready var _1: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/1"
@onready var _2: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/2"
@onready var _3: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/3"
@onready var _4: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/4"
@onready var _5: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/5"
@onready var _6: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/6"
@onready var _7: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/7"
@onready var _8: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/8"
@onready var _9: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/9"

func _ready():
#	connecting the buttons to the functions
	_1.pressed.connect(_on_1_pressed)
	_2.pressed.connect(_on_2_pressed)
	_3.pressed.connect(_on_3_pressed)
	_4.pressed.connect(_on_4_pressed)
	_5.pressed.connect(_on_5_pressed)
	_6.pressed.connect(_on_6_pressed)
	_7.pressed.connect(_on_7_pressed)
	_8.pressed.connect(_on_8_pressed)
	_9.pressed.connect(_on_9_pressed)
	
func _on_1_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('1')

func _on_2_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('2')

func _on_3_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('3')

func _on_4_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('4')

func _on_5_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('5')

func _on_6_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('6')

func _on_7_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('7')

func _on_8_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('8')

func _on_9_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('9')
