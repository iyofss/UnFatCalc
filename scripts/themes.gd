extends Node

@onready var settings_button: Button = $Control/Panel/VBoxContainer/HBoxContainer2/AspectRatioContainer2/MarginContainer/SettingsButton
@onready var back: Button = $Control/Settings/VBoxContainer/Back
@onready var settings: Panel = $Control/Settings


var BUTTONS = load("res://resources/Buttons.tres") as Theme
@onready var color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer/ColorPickerButton
var BUTTON_NORMAL = load("res://resources/ButtonNormal.tres") as StyleBoxFlat


func _ready():
	settings_button.button_down.connect(_on_settings_pressed)
	back.button_down.connect(_on_back_pressed)
	
	BUTTON_NORMAL.bg_color = Color(0.6, 0.6, 0.6, 1)
	#color_picker_button.get_popup().about_to_show.connect(_on_color_picker_popup_open)
func _on_settings_pressed():
	settings.visible = true
	
func _on_back_pressed():
	settings.visible = false


func _on_color_picker_popup_open():
	var popup = $ColorPickerButton.get_popup()
	popup.set_size(Vector2(500, 500))  # Adjust this to your desired size

	var picker = popup.get_child(0)
	if picker is ColorPicker:
		picker.set_custom_minimum_size(Vector2(480, 480))



func _on_color_picker_button_color_changed(color: Color) -> void:
	print(color_picker_button.color)
	BUTTON_NORMAL.bg_color = Color(color_picker_button.color)
	
