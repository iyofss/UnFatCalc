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
@onready var ans_button: Button = $Panel/VBoxContainer/MarginContainer/Calc/CalcKeyboard/AnsButton

@onready var protien_label: Label = $Panel/VBoxContainer/MarginContainer/Calc/ValuesDisplay/ProtienLabel
@onready var calories_label: Label = $Panel/VBoxContainer/MarginContainer/Calc/ValuesDisplay/CaloriesLabel

@onready var new_button: Button = $Panel/VBoxContainer/HBoxContainer2/AspectRatioContainer/NewButton



var nutrition_data = {}	# Will hold our data
var file_path = "user://nutries.json"

func _ready():
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
	ans_button.pressed.connect(_on_ans_button_pressed)
	
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
	# Custom stringify to preserve order and formatting
	var json_string = "{\n\t\"current\": {\n\t\t\"History\": %s,\n\t\t\"Protein\": %s,\n\t\t\"Calories\": %s\n\t},\n\t\"recent\": {}\n}" % [
		JSON.stringify(nutrition_data["current"]["History"], "\t\t"),
		nutrition_data["current"]["Protein"],
		nutrition_data["current"]["Calories"]
	]
	file.store_string(json_string)
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

func _on_history_button_pressed():
	calc_textbox.placeholder_text = ""
	var result = evaluate_math_expression(calc_textbox.text)
	if not is_nan(result):
		print(str(int(result)) if result == int(result) else str(result))
	calc_textbox.text = ""

	
	
func _on_ans_button_pressed():
	# Add your answer recall functionality here
	pass

func _on_new_button_pressed():
	print('new')
	
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
