extends Control

@onready var calc_textbox: LineEdit = $Panel/VBoxContainer/MarginContainer/Calc/CalcTextbox
@onready var _0: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/0"
@onready var _1: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/1"
@onready var _2: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/2"
@onready var _3: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/3"
@onready var _4: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/4"
@onready var _5: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/5"
@onready var _6: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/6"
@onready var _7: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/7"
@onready var _8: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/8"
@onready var _9: Button = $"Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/9"

@onready var plus: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/Plus
@onready var minus: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/Minus

@onready var multiply: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/Multiply
@onready var divide: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/Divide

@onready var percent: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/Percent
@onready var dot: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/Dot

@onready var open_bracket: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/OpenBracket
@onready var close_bracket: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/CloseBracket

@onready var protein_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/ProteinButton
@onready var calories_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/CaloriesButton
@onready var delete_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/DeleteButton

@onready var clear_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/ClearButton
@onready var history_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/HistoryButton
@onready var Food_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/FoodButton

@onready var protien_label: Label = $Panel/VBoxContainer/MarginContainer/Calc/ValuesDisplay/ProtienLabel
@onready var calories_label: Label = $Panel/VBoxContainer/MarginContainer/Calc/ValuesDisplay/CaloriesLabel

@onready var new_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/HBoxContainer2/AspectRatioContainer/NewButton

#History Tab
@onready var historyTab: Panel = $History
@onready var historyBack: Button = $History/VBoxContainer/Back
@onready var history_vbox_container: VBoxContainer = $History/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer
@onready var cal_color_picker_button: ColorPickerButton = $Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer5/CalColorPickerButton
@onready var pro_color_picker_button: ColorPickerButton = $Settings/VBoxContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer6/ProColorPickerButton

var nutrition_data = {}	# Will hold our data
# for android: /storage/emulated/0/nutries.json
# for pc: user://nutries.json
var file_path = "user://nutries.json"

func _ready():
	
	if OS.get_name() == "Android":
		if Engine.has_singleton("AndroidPermissions"):
			var perms = Engine.get_singleton("AndroidPermissions")

			var permissions = [
				"android.permission.READ_EXTERNAL_STORAGE",
				"android.permission.WRITE_EXTERNAL_STORAGE"
			]

			for permission in permissions:
				if not perms.is_permission_granted(permission):
					perms.request_permission(permission)
	
	var datetime = Time.get_date_string_from_system() + '|' + Time.get_time_string_from_system()
	
	print(datetime)
	
	if FileAccess.file_exists(file_path):
		# File exists - load it
		load_data(file_path)
	else:
		# File doesn't exist - create new structure
		nutrition_data = {
			"current": {
				"History": [],
				"Protein": 0,
				"Calories": 0
			},
			"recent": {}
		}
		save_data(file_path)
		print("Created new JSON file with empty structure")
		
	protien_label.text = 'Protein \n' + str(nutrition_data["current"]["Protein"])
	calories_label.text = 'Calories \n' + str(nutrition_data["current"]["Calories"])

	
#	connecting the buttons to the functions
#button_down instead of pressed because it feel better
	_0.button_down.connect(_on_0_pressed)
	_1.button_down.connect(_on_1_pressed)
	_2.button_down.connect(_on_2_pressed)
	_3.button_down.connect(_on_3_pressed)
	_4.button_down.connect(_on_4_pressed)
	_5.button_down.connect(_on_5_pressed)
	_6.button_down.connect(_on_6_pressed)
	_7.button_down.connect(_on_7_pressed)
	_8.button_down.connect(_on_8_pressed)
	_9.button_down.connect(_on_9_pressed)
	
	plus.pressed.connect(_on_plus_pressed)
	minus.pressed.connect(_on_minus_pressed)
	multiply.pressed.connect(_on_multiply_pressed)
	divide.pressed.connect(_on_divide_pressed)
	percent.pressed.connect(_on_percent_pressed)
	dot.pressed.connect(_on_dot_pressed)
	open_bracket.pressed.connect(_on_open_bracket_pressed)
	close_bracket.pressed.connect(_on_close_bracket_pressed)
	protein_button.pressed.connect(_on_protein_button_pressed)
	calories_button.pressed.connect(_on_calories_button_pressed)
	delete_button.pressed.connect(_on_delete_button_pressed)
	clear_button.pressed.connect(_on_clear_button_pressed)
	history_button.pressed.connect(_on_history_button_pressed)
	Food_button.pressed.connect(_on_Food_button_pressed)
	
	new_button.pressed.connect(_on_new_button_pressed)

func load_data(path: String):
	var file = FileAccess.open(path, FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var error = json.parse(json_string)
	
	if error == OK:
		nutrition_data = json.data
		print("Loaded existing data")
	else:
		print("JSON parse error: ", json.get_error_message())

func save_data(path: String):
	var file = FileAccess.open(path, FileAccess.WRITE)

	var current = nutrition_data["current"]
	var recent = nutrition_data["recent"]

	var recent_strs = []
	for key in recent.keys():
		var r = recent[key]
		var r_str = "\t\t\"%s\": {\n\t\t\t\"Date\": \"%s\",\n\t\t\t\"Time\": \"%s\",\n\t\t\t\"History\": %s,\n\t\t\t\"Protein\": %s,\n\t\t\t\"Calories\": %s\n\t\t}" % [
			key,
			r["Date"],
			r["Time"],
			JSON.stringify(r["History"], "\t\t\t"),
			str(r["Protein"]),
			str(r["Calories"])
		]
		recent_strs.append(r_str)

	var final_string = "{\n"
	final_string += "\t\"current\": {\n"
	final_string += "\t\t\"History\": %s,\n" % JSON.stringify(current["History"], "\t\t")
	final_string += "\t\t\"Protein\": %s,\n" % str(current["Protein"])
	final_string += "\t\t\"Calories\": %s\n" % str(current["Calories"])
	final_string += "\t},\n"
	final_string += "\t\"recent\": {\n%s\n\t}\n" % String(",\n".join(recent_strs))
	final_string += "}"

	file.store_string(final_string)
	file.close()






func _on_0_pressed():
#	first it will check if there is a selection
	if calc_textbox.has_selection() == true:
#		if so it will delete whats in the selection
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
#		then it will clear the selection
		calc_textbox.deselect()
	
#	this will write the thing
	calc_textbox.insert_text_at_caret('0')

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
	
	

func _on_plus_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret('+')

func _on_minus_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret('-')

func _on_multiply_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret('*')

func _on_divide_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret('/')

func _on_percent_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret('%')

func _on_dot_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret('.')

func _on_open_bracket_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret('(')

func _on_close_bracket_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	calc_textbox.insert_text_at_caret(')')

func _on_protein_button_pressed():
	calc_textbox.placeholder_text = ""
	var result = evaluate_math_expression(calc_textbox.text)
	if not is_nan(result):
#		This will add the result to the Protein
		nutrition_data["current"]["Protein"] = snapped(nutrition_data["current"]["Protein"], 0.001) + snapped(result, 0.001)
		result = str(int(result)) if result == int(result) else str(snapped(result, 0.001))
		nutrition_data["current"]["History"].append(calc_textbox.text + '=' + str(result) + 'p')
		save_data(file_path)
	calc_textbox.text = ""
	protien_label.text = 'Protein \n' + str(nutrition_data["current"]["Protein"])
	

func _on_calories_button_pressed():
	calc_textbox.placeholder_text = ""
	var result = evaluate_math_expression(calc_textbox.text)
	print(result)
	if not is_nan(result):
#		This will add the result to the calories
		nutrition_data["current"]["Calories"] = snapped(nutrition_data["current"]["Calories"], 0.001) + snapped(result, 0.001)
		result = str(int(result)) if result == int(result) else str(snapped(result, 0.001))
		nutrition_data["current"]["History"].append(calc_textbox.text + '=' + str(result) + 'k')
		save_data(file_path)
	calc_textbox.text = ""
	calories_label.text = 'Calories \n' + str(nutrition_data["current"]["Calories"])

func _on_delete_button_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	else:
		# Delete last character if no selection
		calc_textbox.delete_char_at_caret()

func _on_clear_button_pressed():
	# Clear the entire textbox
	calc_textbox.text = ""

# history function for all current calcies (i just made up this word)
func _on_history_button_pressed():
	for child in history_vbox_container.get_children():
		child.queue_free()
	historyTab.visible = true
	var history = nutrition_data["current"]["History"]
	for item in history:
		
		print(item)
		var panel := PanelContainer.new()
		var btn := Button.new()
		
		var label := Label.new()
		var label2 := Label.new()
		var vbox := VBoxContainer.new()
		var hbox := HBoxContainer.new()
		label.text = item.split("=")[0]
		label2.text = "=" + item.split("=")[1]
		btn.text = "  +  "
		
		hbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		label2.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		label.autowrap_mode = 1
		label2.autowrap_mode = 1
		vbox.add_child(label)
		hbox.add_child(label2)
		
		hbox.add_child(btn)
		vbox.add_child(hbox)
		panel.add_child(vbox)
		panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
		
		label.add_theme_font_size_override("font_size", 126)
		label2.add_theme_font_size_override("font_size", 126)
		btn.add_theme_font_size_override("font_size", 126)
		btn.focus_mode = 0
		
#		checks which is which:
		if item[-1] == "k":
			panel.theme = preload("res://resources/HistoryItems/CaloriesHistory.tres")
			label2.add_theme_color_override("font_color", cal_color_picker_button.color)
		elif item[-1] == "p":
			panel.theme = preload("res://resources/HistoryItems/ProteinHistory.tres")
			label2.add_theme_color_override("font_color", pro_color_picker_button.color)

		btn.pressed.connect(_on_item_btn_pressed.bind(item))
		history_vbox_container.add_child(panel)
		

# this is the function the runs when the history item button is clicked, which will paste the thing at cursor
func _on_item_btn_pressed(item):
	print(item)
	calc_textbox.insert_text_at_caret('('+ item.split("=")[0] +')')
	historyTab.visible = false
	

# back button la
func _on_historyBack_pressed() -> void:
	historyTab.visible = false
	
	
func _on_Food_button_pressed():
	# this will open a page where u can put custom food to add instead of manuall typing
	pass

func _on_new_button_pressed():
#	this adds the things from current to a new object in recent
	nutrition_data["recent"][nutrition_data["recent"].size() + 1] = {
		"Date": str(Time.get_date_string_from_system()),
		"Time": str(Time.get_time_string_from_system()),
		"History": nutrition_data["current"]["History"].duplicate(),
		"Protein": nutrition_data["current"]["Protein"],
		"Calories": nutrition_data["current"]["Calories"]
	}
#	clears current then saves
	nutrition_data["current"]["History"].clear()
	nutrition_data["current"]["Calories"] = 0
	nutrition_data["current"]["Protein"] = 0
	
	save_data(file_path)
	protien_label.text = 'Protein \n' + str(nutrition_data["current"]["Protein"])
	calories_label.text = 'Calories \n' + str(nutrition_data["current"]["Calories"])
	
	
#everything bellow is vibe coding, i have no idea how it works!
# Main evaluation function 
func evaluate_math_expression(input_text: String) -> float:
	#var expr = input_text.replace(" ", "").replace("×", "*").replace("÷", "/")
	
	var expr = input_text.replace(" ", "").replace("×", "*").replace("÷", "/")
	var allowed = "%+-*/().0123456789"
	var clean = ""

	for c in expr:
		if c in allowed:
			clean += c
	expr = clean

	# Add implied multiplication
	expr = _insert_implicit_multiplication(expr)

	# Verify parentheses balance
	if expr.count("(") != expr.count(")"):

		_show_error("Unbalanced ()")
		return NAN
	
	# Process percentages (9%4 → 9*0.04)
	expr = _process_percentages(expr)

	# Promote integers to floats before division
	expr = _promote_integers_to_floats_in_division(expr)
	
	# Debug output
	print("Raw input: ", input_text)
	print("Processed: ", expr)
	
	# Evaluate using Godot's engine (NO implied multiplication)
	var expression = Expression.new()
	if expression.parse(expr, []) != OK:
		_show_error("Invalid: " + expression.get_error_text())
		return NAN
	
	var result = expression.execute([], null, true)
	if expression.has_execute_failed():
		_show_error("Math error")
		return NAN
	
	return float(result)

# Insert implied multiplication
func _insert_implicit_multiplication(expr: String) -> String:
	var fixed_expr := ""
	for i in range(expr.length()):
		var current := expr[i]
		@warning_ignore("unused_variable")
		var prev := expr[i - 1] if i > 0 else ""
		var next := expr[i + 1] if i < expr.length() - 1 else ""
		
		fixed_expr += current

		# Case 1: number or closing ) followed by opening (
		if ((current.is_valid_int() or current == ")") and next == "("):
			fixed_expr += "*"

		# Case 2: closing ) followed by number
		elif (current == ")" and next.is_valid_int()):
			fixed_expr += "*"
	
	return fixed_expr


# Percentage handler
func _process_percentages(expr: String) -> String:
	return expr.replace("%", "*0.01*")
	

func _promote_integers_to_floats_in_division(expr: String) -> String:
	var new_expr := ""
	var i := 0
	while i < expr.length():
		if expr[i] == "/":
			# Look back for the left number
			var j := i - 1
			var left := ""
			while j >= 0 and ((expr[j] >= '0' and expr[j] <= '9') or expr[j] == "."):
				left = expr[j] + left
				j -= 1
			# Only add .0 if it's a pure integer (doesn't already have a dot)
			if left != "" and !left.contains("."):
				expr = expr.substr(0, j + 1) + left + ".0" + expr.substr(i)
				i += 2  # account for added ".0"
		i += 1
	return expr



# Error display
func _show_error(msg: String):
	calc_textbox.placeholder_text = msg.left(15)
	calc_textbox.text = ""
	print("Error: ", msg)



# Bottom nav buttons
@onready var homeButton: Button = $Panel/VBoxContainer/ButtomNav/Home
@onready var dataButton: Button = $Panel/VBoxContainer/ButtomNav/Data
@onready var calcPage: VBoxContainer = $Panel/VBoxContainer/MarginContainer/Calc
@onready var dataPage: VBoxContainer = $Panel/VBoxContainer/MarginContainer/Data
@onready var nutries_box: CodeEdit = $Panel/VBoxContainer/MarginContainer/Data/ScrollContainer/VBoxContainer/nutriesBox

func _on_home_pressed() -> void:
	dataButton.button_pressed = false
	homeButton.button_pressed = true
	dataPage.visible = false
	calcPage.visible = true

func _on_data_pressed() -> void:
	homeButton.button_pressed = false
	dataButton.button_pressed = true
	calcPage.visible = false
	dataPage.visible = true
	nutries_box.text = JSON.stringify(nutrition_data, "\t")
	
