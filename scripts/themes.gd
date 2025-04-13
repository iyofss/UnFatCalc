extends Node

@onready var settings_button: Button = $Control/Panel/VBoxContainer/HBoxContainer2/AspectRatioContainer2/MarginContainer/SettingsButton
@onready var back: Button = $Control/Settings/VBoxContainer/Back
@onready var settings: Panel = $Control/Settings


@onready var bg_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer/BGColorPickerButton
@onready var num_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer2/NumColorPickerButton
@onready var math_sym_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer3/MathSymColorPickerButton
@onready var del_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer4/DelColorPickerButton
@onready var clear_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer9/ClearColorPickerButton
@onready var cal_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer5/CalColorPickerButton
@onready var pro_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer6/ProColorPickerButton
@onready var font_color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer7/FontColorPickerButton
@onready var h_slider: HSlider = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer8/HSlider




var BUTTONS = load("res://resources/Buttons.tres") as Theme
@onready var color_picker_button: ColorPickerButton = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer/ColorPickerButton
var Background = load("res://resources/Background.tres") as StyleBoxFlat

var NumButtons = load("res://resources/Keys/NumButtons.tres") as Theme

var NumButtonNormal = load("res://resources/Keys/NumButtonNormal.tres") as StyleBoxFlat
var NumButtonPressed = load("res://resources/Keys/NumButtonPressed.tres") as StyleBoxFlat
var NumButtonHover = load("res://resources/Keys/NumButtonHover.tres") as StyleBoxFlat

var CaloriesButtons = load("res://resources/Keys/CaloriesButtons.tres") as Theme

var CaloriesButtonNormal = load("res://resources/Keys/CaloriesButtonNormal.tres") as StyleBoxFlat
var CaloriesButtonPressed = load("res://resources/Keys/CaloriesButtonPressed.tres") as StyleBoxFlat
var CaloriesButtonHover = load("res://resources/Keys/CaloriesButtonHover.tres") as StyleBoxFlat

var ClearButtons = load("res://resources/Keys/ClearButtons.tres") as Theme

var ClearButtonNormal = load("res://resources/Keys/ClearButtonNormal.tres") as StyleBoxFlat
var ClearButtonPressed = load("res://resources/Keys/ClearButtonPressed.tres") as StyleBoxFlat
var ClearButtonHover = load("res://resources/Keys/ClearButtonHover.tres") as StyleBoxFlat

var DeleteButtons = load("res://resources/Keys/DeleteButtons.tres") as Theme

var DeleteButtonNormal = load("res://resources/Keys/DeleteButtonNormal.tres") as StyleBoxFlat
var DeleteButtonPressed = load("res://resources/Keys/DeleteButtonPressed.tres") as StyleBoxFlat
var DeleteButtonHover = load("res://resources/Keys/DeleteButtonHover.tres") as StyleBoxFlat

var MathSymButtons = load("res://resources/Keys/MathSymButtons.tres") as Theme

var MathSymButtonNormal = load("res://resources/Keys/MathSymButtonNormal.tres") as StyleBoxFlat
var MathSymButtonPressed = load("res://resources/Keys/MathSymButtonPressed.tres") as StyleBoxFlat
var MathSymButtonHover = load("res://resources/Keys/MathSymButtonHover.tres") as StyleBoxFlat

var ProteinButtons = load("res://resources/Keys/ProteinButtons.tres") as Theme

var ProteinButtonNormal = load("res://resources/Keys/ProteinButtonNormal.tres") as StyleBoxFlat
var ProteinButtonPressed = load("res://resources/Keys/ProteinButtonPressed.tres") as StyleBoxFlat
var ProteinButtonHover = load("res://resources/Keys/ProteinButtonHover.tres") as StyleBoxFlat


#background
#Numpad
#MathSymbols
#Clear
#Delete
#Calories
#Protein
#Font/icons


func _ready():
	settings_button.button_down.connect(_on_settings_pressed)
	back.button_down.connect(_on_back_pressed)
	
	bg_color_picker_button.color = Color(0.12, 0.12, 0.14)
	cal_color_picker_button.color = Color(0.13, 0.75, 0.61)
	del_color_picker_button.color = Color(0.95, 0.65, 0.21)
	clear_color_picker_button.color = Color(0.20, 0.75, 0.75)
	pro_color_picker_button.color = Color(0.36, 0.45, 0.82)
	num_color_picker_button.color = Color(0.20, 0.60, 0.86)
	math_sym_color_picker_button.color = Color(0.91, 0.30, 0.24)
	font_color_picker_button.color = Color(1, 1, 1)
	_on_math_sym_color_picker_button_color_changed(1)
	_on_bg_color_picker_button_color_changed(1)
	_on_num_color_picker_button_color_changed(1)
	_on_math_sym_color_picker_button_color_changed(1)
	_on_del_color_picker_button_color_changed(1)
	_on_cal_color_picker_button_color_changed(1)
	_on_pro_color_picker_button_color_changed(1)
	_on_font_color_picker_button_color_changed(1)
	_on_clear_color_picker_button_color_changed(1)
	#BUTTON_NORMAL.bg_color = Color(0.6, 0.6, 0.6, 1)
	#color_picker_button.get_popup().about_to_show.connect(_on_color_picker_popup_open)
func _on_settings_pressed():
	settings.visible = true
	
func _on_back_pressed():
	settings.visible = false


func _on_bg_color_picker_button_color_changed(color: Color) -> void:
	Background.bg_color = bg_color_picker_button.color
	


func _on_num_color_picker_button_color_changed(color: Color) -> void:
#	hover color from orginal color
	var original_color = Color(num_color_picker_button.color)
	var new_color = Color(clamp(original_color.r - 0.1, 0.0, 1.0), clamp(original_color.g - 0.1, 0.0, 1.0), clamp(original_color.b - 0.1, 0.0, 1.0))
	NumButtonHover.bg_color = new_color
#	pressed color from orginal color
	new_color = Color( clamp(new_color.r - 0.1, 0.0, 1.0), clamp(new_color.g - 0.1, 0.0, 1.0), clamp(new_color.b - 0.1, 0.0, 1.0))
	NumButtonPressed.bg_color = new_color
#	and the normal color
	NumButtonNormal.bg_color = Color(num_color_picker_button.color)




func _on_math_sym_color_picker_button_color_changed(color: Color) -> void:
	#	hover color from orginal color
	var original_color = Color(math_sym_color_picker_button.color)
	var new_color = Color(clamp(original_color.r - 0.1, 0.0, 1.0), clamp(original_color.g - 0.1, 0.0, 1.0), clamp(original_color.b - 0.1, 0.0, 1.0))
	MathSymButtonHover.bg_color = new_color
#	pressed color from orginal color
	new_color = Color( clamp(new_color.r - 0.1, 0.0, 1.0), clamp(new_color.g - 0.1, 0.0, 1.0), clamp(new_color.b - 0.1, 0.0, 1.0))
	MathSymButtonPressed.bg_color = new_color
#	and the normal color
	MathSymButtonNormal.bg_color = Color(math_sym_color_picker_button.color)



func _on_del_color_picker_button_color_changed(color: Color) -> void:
	#	hover color from orginal color
	var original_color = Color(del_color_picker_button.color)
	var new_color = Color(clamp(original_color.r - 0.1, 0.0, 1.0), clamp(original_color.g - 0.1, 0.0, 1.0), clamp(original_color.b - 0.1, 0.0, 1.0))
	DeleteButtonHover.bg_color = new_color
#	pressed color from orginal color
	new_color = Color( clamp(new_color.r - 0.1, 0.0, 1.0), clamp(new_color.g - 0.1, 0.0, 1.0), clamp(new_color.b - 0.1, 0.0, 1.0))
	DeleteButtonPressed.bg_color = new_color
#	and the normal color
	DeleteButtonNormal.bg_color = Color(del_color_picker_button.color)


func _on_clear_color_picker_button_color_changed(color: Color) -> void:
	#	hover color from orginal color
	var original_color = Color(clear_color_picker_button.color)
	var new_color = Color(clamp(original_color.r - 0.1, 0.0, 1.0), clamp(original_color.g - 0.1, 0.0, 1.0), clamp(original_color.b - 0.1, 0.0, 1.0))
	ClearButtonHover.bg_color = new_color
#	pressed color from orginal color
	new_color = Color( clamp(new_color.r - 0.1, 0.0, 1.0), clamp(new_color.g - 0.1, 0.0, 1.0), clamp(new_color.b - 0.1, 0.0, 1.0))
	ClearButtonPressed.bg_color = new_color
#	and the normal color
	ClearButtonNormal.bg_color = Color(clear_color_picker_button.color)


func _on_cal_color_picker_button_color_changed(color: Color) -> void:
	#	hover color from orginal color
	var original_color = Color(cal_color_picker_button.color)
	var new_color = Color(clamp(original_color.r - 0.1, 0.0, 1.0), clamp(original_color.g - 0.1, 0.0, 1.0), clamp(original_color.b - 0.1, 0.0, 1.0))
	CaloriesButtonHover.bg_color = new_color
#	pressed color from orginal color
	new_color = Color( clamp(new_color.r - 0.1, 0.0, 1.0), clamp(new_color.g - 0.1, 0.0, 1.0), clamp(new_color.b - 0.1, 0.0, 1.0))
	CaloriesButtonPressed.bg_color = new_color
#	and the normal color
	CaloriesButtonNormal.bg_color = Color(cal_color_picker_button.color)


func _on_pro_color_picker_button_color_changed(color: Color) -> void:
	#	hover color from orginal color
	var original_color = Color(pro_color_picker_button.color)
	var new_color = Color(clamp(original_color.r - 0.1, 0.0, 1.0), clamp(original_color.g - 0.1, 0.0, 1.0), clamp(original_color.b - 0.1, 0.0, 1.0))
	ProteinButtonHover.bg_color = new_color
#	pressed color from orginal color
	new_color = Color( clamp(new_color.r - 0.1, 0.0, 1.0), clamp(new_color.g - 0.1, 0.0, 1.0), clamp(new_color.b - 0.1, 0.0, 1.0))
	ProteinButtonPressed.bg_color = new_color
#	and the normal color
	ProteinButtonNormal.bg_color = Color(pro_color_picker_button.color)

func _on_font_color_picker_button_color_changed(color: Color) -> void:
	NumButtons.set_color("icon_normal_color", "Button", font_color_picker_button.color)
	NumButtons.set_color("font_color", "Button", font_color_picker_button.color)
	
	CaloriesButtons.set_color("icon_normal_color", "Button", font_color_picker_button.color)
	CaloriesButtons.set_color("font_color", "Button", font_color_picker_button.color)
	
	ClearButtons.set_color("icon_normal_color", "Button", font_color_picker_button.color)
	ClearButtons.set_color("font_color", "Button", font_color_picker_button.color)
	
	DeleteButtons.set_color("icon_normal_color", "Button", font_color_picker_button.color)
	DeleteButtons.set_color("font_color", "Button", font_color_picker_button.color)
	
	MathSymButtons.set_color("icon_normal_color", "Button", font_color_picker_button.color)
	MathSymButtons.set_color("font_color", "Button", font_color_picker_button.color)
	
	ProteinButtons.set_color("icon_normal_color", "Button", font_color_picker_button.color)
	ProteinButtons.set_color("font_color", "Button", font_color_picker_button.color)
	

func _on_h_slider_value_changed(value: float) -> void:
	DeleteButtonNormal.set_corner_radius(0, int(h_slider.value))
	DeleteButtonNormal.set_corner_radius(1, int(h_slider.value))
	DeleteButtonNormal.set_corner_radius(2, int(h_slider.value))
	DeleteButtonNormal.set_corner_radius(3, int(h_slider.value))
	
	DeleteButtonHover.set_corner_radius(0, int(h_slider.value))
	DeleteButtonHover.set_corner_radius(1, int(h_slider.value))
	DeleteButtonHover.set_corner_radius(2, int(h_slider.value))
	DeleteButtonHover.set_corner_radius(3, int(h_slider.value))
	
	DeleteButtonPressed.set_corner_radius(0, int(h_slider.value))
	DeleteButtonPressed.set_corner_radius(1, int(h_slider.value))
	DeleteButtonPressed.set_corner_radius(2, int(h_slider.value))
	DeleteButtonPressed.set_corner_radius(3, int(h_slider.value))
	
	
	NumButtonNormal.set_corner_radius(0, int(h_slider.value))
	NumButtonNormal.set_corner_radius(1, int(h_slider.value))
	NumButtonNormal.set_corner_radius(2, int(h_slider.value))
	NumButtonNormal.set_corner_radius(3, int(h_slider.value))
	
	NumButtonHover.set_corner_radius(0, int(h_slider.value))
	NumButtonHover.set_corner_radius(1, int(h_slider.value))
	NumButtonHover.set_corner_radius(2, int(h_slider.value))
	NumButtonHover.set_corner_radius(3, int(h_slider.value))
	
	NumButtonPressed.set_corner_radius(0, int(h_slider.value))
	NumButtonPressed.set_corner_radius(1, int(h_slider.value))
	NumButtonPressed.set_corner_radius(2, int(h_slider.value))
	NumButtonPressed.set_corner_radius(3, int(h_slider.value))
	
	
	CaloriesButtonNormal.set_corner_radius(0, int(h_slider.value))
	CaloriesButtonNormal.set_corner_radius(1, int(h_slider.value))
	CaloriesButtonNormal.set_corner_radius(2, int(h_slider.value))
	CaloriesButtonNormal.set_corner_radius(3, int(h_slider.value))
	
	CaloriesButtonHover.set_corner_radius(0, int(h_slider.value))
	CaloriesButtonHover.set_corner_radius(1, int(h_slider.value))
	CaloriesButtonHover.set_corner_radius(2, int(h_slider.value))
	CaloriesButtonHover.set_corner_radius(3, int(h_slider.value))
	
	CaloriesButtonPressed.set_corner_radius(0, int(h_slider.value))
	CaloriesButtonPressed.set_corner_radius(1, int(h_slider.value))
	CaloriesButtonPressed.set_corner_radius(2, int(h_slider.value))
	CaloriesButtonPressed.set_corner_radius(3, int(h_slider.value))
	
	
	MathSymButtonNormal.set_corner_radius(0, int(h_slider.value))
	MathSymButtonNormal.set_corner_radius(1, int(h_slider.value))
	MathSymButtonNormal.set_corner_radius(2, int(h_slider.value))
	MathSymButtonNormal.set_corner_radius(3, int(h_slider.value))
	
	MathSymButtonHover.set_corner_radius(0, int(h_slider.value))
	MathSymButtonHover.set_corner_radius(1, int(h_slider.value))
	MathSymButtonHover.set_corner_radius(2, int(h_slider.value))
	MathSymButtonHover.set_corner_radius(3, int(h_slider.value))
	
	MathSymButtonPressed.set_corner_radius(0, int(h_slider.value))
	MathSymButtonPressed.set_corner_radius(1, int(h_slider.value))
	MathSymButtonPressed.set_corner_radius(2, int(h_slider.value))
	MathSymButtonPressed.set_corner_radius(3, int(h_slider.value))
	
	
	ProteinButtonNormal.set_corner_radius(0, int(h_slider.value))
	ProteinButtonNormal.set_corner_radius(1, int(h_slider.value))
	ProteinButtonNormal.set_corner_radius(2, int(h_slider.value))
	ProteinButtonNormal.set_corner_radius(3, int(h_slider.value))
	
	ProteinButtonHover.set_corner_radius(0, int(h_slider.value))
	ProteinButtonHover.set_corner_radius(1, int(h_slider.value))
	ProteinButtonHover.set_corner_radius(2, int(h_slider.value))
	ProteinButtonHover.set_corner_radius(3, int(h_slider.value))
	
	ProteinButtonPressed.set_corner_radius(0, int(h_slider.value))
	ProteinButtonPressed.set_corner_radius(1, int(h_slider.value))
	ProteinButtonPressed.set_corner_radius(2, int(h_slider.value))
	ProteinButtonPressed.set_corner_radius(3, int(h_slider.value))
	
	
	ClearButtonNormal.set_corner_radius(0, int(h_slider.value))
	ClearButtonNormal.set_corner_radius(1, int(h_slider.value))
	ClearButtonNormal.set_corner_radius(2, int(h_slider.value))
	ClearButtonNormal.set_corner_radius(3, int(h_slider.value))
	
	ClearButtonHover.set_corner_radius(0, int(h_slider.value))
	ClearButtonHover.set_corner_radius(1, int(h_slider.value))
	ClearButtonHover.set_corner_radius(2, int(h_slider.value))
	ClearButtonHover.set_corner_radius(3, int(h_slider.value))
	
	ClearButtonPressed.set_corner_radius(0, int(h_slider.value))
	ClearButtonPressed.set_corner_radius(1, int(h_slider.value))
	ClearButtonPressed.set_corner_radius(2, int(h_slider.value))
	ClearButtonPressed.set_corner_radius(3, int(h_slider.value))
