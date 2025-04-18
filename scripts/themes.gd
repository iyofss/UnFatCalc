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

var Theme_data = {}
var file_path = "user://themes/themes.json"

func _ready():
	
	if FileAccess.file_exists(file_path):
		# File exists - load it
		load_data(file_path)
	else:
		# File doesn't exist - create new structure
		Theme_data = {
				"Background": "#1F1F24FF",
				"Numpad": "#3399DBFF",
				"MathSymbols": "#E84C3DFF",
				"Delete": "#F3A635FF",
				"Clear": "#33BFBFFF",
				"Calories": "#21BF9CFF",
				"Protein": "#5C73D1FF",
				"Font/icons": "#FFFFFFFF",
				"Corners": 100
		}
		save_data(file_path)
		print("Created new JSON file with empty structure")
	
	settings_button.button_down.connect(_on_settings_pressed)
	back.button_down.connect(_on_back_pressed)

	bg_color_picker_button.color = Color(Theme_data["Background"])
	cal_color_picker_button.color = Color(Theme_data["Calories"])
	del_color_picker_button.color = Color(Theme_data["Delete"])
	clear_color_picker_button.color = Color(Theme_data["Clear"])
	pro_color_picker_button.color = Color(Theme_data["Protein"])
	num_color_picker_button.color = Color(Theme_data["Numpad"])
	math_sym_color_picker_button.color = Color(Theme_data["MathSymbols"])
	font_color_picker_button.color = Color(Theme_data["Font/icons"])
	
#	the input 1 doesn't mean anything but i have to write somthin for the connect func for now soo
	_on_math_sym_color_picker_button_color_changed(1)
	_on_bg_color_picker_button_color_changed(1)
	_on_num_color_picker_button_color_changed(1)
	_on_math_sym_color_picker_button_color_changed(1)
	_on_del_color_picker_button_color_changed(1)
	_on_cal_color_picker_button_color_changed(1)
	_on_pro_color_picker_button_color_changed(1)
	_on_font_color_picker_button_color_changed(1)
	_on_clear_color_picker_button_color_changed(1)

func save_data(path: String) -> void:
	var json_string = JSON.stringify(Theme_data, "\t")  # Pretty-print with tabs
	var file := FileAccess.open(path, FileAccess.WRITE)

	if file == null:
		printerr("Failed to open file for writing: ", path)
		return
	
	file.store_string(json_string)
	file.close()
	print("Theme data saved to: ", path)


func load_data(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var error = json.parse(json_string)
	
	if error == OK:
		Theme_data = json.data
		print("Loaded existing data")
	else:
		print("JSON parse error: ", json.get_error_message())
		
# buttons do these:
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
