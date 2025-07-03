extends Node

@onready var settings_button: Button = $Control/Panel/VBoxContainer/MarginContainer/Calc/HBoxContainer2/AspectRatioContainer2/MarginContainer/SettingsButton
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
@onready var theme_json_box: CodeEdit = $Control/Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/themeJsonBox

var Theme_data = {}
var file_path = "user://theme.json"


func _make_file():
			# File doesn't exist - create new structure
		Theme_data = {
			"Background": "1f1f24ff",
			"Calories": "21bf9cff",
			"Clear": "33bfbfff",
			"Corners": 100,
			"Delete": "f3a635ff",
			"Font/icons": "ffffffff",
			"MathSymbols": "e84c3dff",
			"Numpad": "3399dbff",
			"Protein": "5c73d1ff"
		}
		save_data(file_path)
		print("Created new JSON file with empty structure")

func _ready():
	
#	i might be doing unnecessary things here but who knows, if it find missing key it will reset the theme
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		if file:
			var json_string = file.get_as_text()
			file.close()

			var json = JSON.new()
			var err = json.parse(json_string)

			if err == OK and typeof(json.data) == TYPE_DICTIONARY:
				var data = json.data
				# Check required keys, if any missing, do NOT update Theme_data or UI
				var required_keys = ["Background", "Numpad", "MathSymbols", "Delete", "Clear", "Calories", "Protein", "Font/icons", "Corners"]
				var all_keys_present = true
				for key in required_keys:
					if not data.has(key):
						all_keys_present = false
						print("Missing key in theme file:", key)
						#break
				if all_keys_present:
					load_data(file_path)
				else:
					print("Theme data incomplete, skipping load.")
					_make_file()
			else:
				print("Failed to parse theme file JSON.")
				_make_file()
		else:
			print("Failed to open theme file.")
			_make_file()
	else:
		print("File doesn't exist - create new structure")
		_make_file()
	
	theme_json_box.text = JSON.stringify(Theme_data, "\t")
	
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
	h_slider.value = Theme_data["Corners"]
	
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


func _on_save_button_pressed() -> void:
	Theme_data["Background"] = bg_color_picker_button.color.to_html()
	Theme_data["Numpad"] = num_color_picker_button.color.to_html()
	Theme_data["MathSymbols"] = math_sym_color_picker_button.color.to_html()
	Theme_data["Delete"] = del_color_picker_button.color.to_html()
	Theme_data["Clear"] = clear_color_picker_button.color.to_html()
	Theme_data["Calories"] = cal_color_picker_button.color.to_html()
	Theme_data["Protein"] = pro_color_picker_button.color.to_html()
	Theme_data["Font/icons"] = font_color_picker_button.color.to_html()
	Theme_data["Corners"] = int(h_slider.value)

	save_data(file_path)
	theme_json_box.text = JSON.stringify(Theme_data, "\t")
	print("Settings saved.")



func is_valid_color_hex(hex: String) -> bool:
	# Optional leading #, then 6 or 8 hex digits
	var pattern = "^#?[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$"
	return hex.match(pattern) != null


func _on_apply_button_pressed() -> void:
	var json = JSON.new()
	var error = json.parse(theme_json_box.text)
	
	if error != OK:
		printerr("Invalid JSON in themeJsonBox: ", json.get_error_message())
		return
	
	var data = json.data
	
	if data.has("Background"):
		if typeof(data["Background"]) == TYPE_STRING:
			if is_valid_color_hex(data["Background"]):
				bg_color_picker_button.color = Color(data["Background"])
				_on_bg_color_picker_button_color_changed(1)

	if data.has("Numpad"):
		if typeof(data["Numpad"]) == TYPE_STRING:
			if is_valid_color_hex(data["Numpad"]):
				num_color_picker_button.color = Color(data["Numpad"])
				_on_num_color_picker_button_color_changed(1)

	if data.has("MathSymbols"):
		if typeof(data["MathSymbols"]) == TYPE_STRING:
			if is_valid_color_hex(data["MathSymbols"]):
				math_sym_color_picker_button.color = Color(data["MathSymbols"])
				_on_math_sym_color_picker_button_color_changed(1)

	if data.has("Delete"):
		if typeof(data["Delete"]) == TYPE_STRING:
			if is_valid_color_hex(data["Delete"]):
				del_color_picker_button.color = Color(data["Delete"])
				_on_del_color_picker_button_color_changed(1)

	if data.has("Clear"):
		if typeof(data["Clear"]) == TYPE_STRING:
			if is_valid_color_hex(data["Clear"]):
				clear_color_picker_button.color = Color(data["Clear"])
				_on_clear_color_picker_button_color_changed(1)

	if data.has("Calories"):
		if typeof(data["Calories"]) == TYPE_STRING:
			if is_valid_color_hex(data["Calories"]):
				cal_color_picker_button.color = Color(data["Calories"])
				_on_cal_color_picker_button_color_changed(1)

	if data.has("Protein"):
		if typeof(data["Protein"]) == TYPE_STRING:
			if is_valid_color_hex(data["Protein"]):
				pro_color_picker_button.color = Color(data["Protein"])
				_on_pro_color_picker_button_color_changed(1)

	if data.has("Font/icons"):
		if typeof(data["Font/icons"]) == TYPE_STRING:
			if is_valid_color_hex(data["Font/icons"]):
				font_color_picker_button.color = Color(data["Font/icons"])
				_on_font_color_picker_button_color_changed(1)
	
	if data.has("Corners"):
		if typeof(data["Corners"]) == TYPE_INT or typeof(data["Corners"]) == TYPE_FLOAT:
			if data["Corners"] >= 0 and data["Corners"] <= 100:
				h_slider.value = data["Corners"]


func _on_reset_button_pressed() -> void:
	theme_json_box.text = JSON.stringify(Theme_data, "\t")
	_on_apply_button_pressed()
#	thats a lazy way to do it


func _on_theme_copy_button_pressed() -> void:
	DisplayServer.clipboard_set(theme_json_box.text)


func _on_theme_paste_button_pressed() -> void:
	theme_json_box.text = DisplayServer.clipboard_get()
