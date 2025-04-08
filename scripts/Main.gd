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


func _ready():
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
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	# Insert your protein calculation logic or text here
	calc_textbox.insert_text_at_caret('PROTEIN')  # Example

func _on_calories_button_pressed():
	if calc_textbox.has_selection():
		calc_textbox.delete_text(calc_textbox.get_selection_from_column(), 
		calc_textbox.get_selection_to_column())
		calc_textbox.deselect()
	# Insert your calories calculation logic or text here
	calc_textbox.insert_text_at_caret('CALORIES')  # Example

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
	# Get the current text and evaluate
	var input_text = calc_textbox.text
	var result = evaluate_math_expression(input_text)
	
	# Only update if we got a valid result
	if result != null:
		calc_textbox.text = str(result)

	
	
func _on_ans_button_pressed():
	# Add your answer recall functionality here
	pass


#everything bellow is vibe coding, i have no idea how it works!
# Main evaluation function
func evaluate_math_expression(input_text: String) -> float:
	# Clean input and convert to lowercase
	var expr = input_text.replace(" ", "").replace("×", "*").replace("÷", "/").to_lower()
	
	# Process percentages first (9%4 → 9*0.04)
	expr = _process_percentages(expr)
	
	# Fix implied multiplication (5(10) → 5*(10))
	expr = _fix_implied_multiplication(expr)
	
	# Debug print the final expression
	print("Evaluating expression: ", expr)
	
	# Create and parse expression
	var expression = Expression.new()
	var parse_result = expression.parse(expr, ["e", "pi"])  # Allow math constants
	
	if parse_result != OK:
		_show_error(expression.get_error_text())
		return NAN
	
	# Execute calculation
	var result = expression.execute([], null, true)  # Allow unsafe operations
	
	if expression.has_execute_failed():
		_show_error(expression.get_error_text())
		return NAN
	
	# Return result as float
	return float(result)

# Percentage processor (9%4 → 9*0.04)
func _process_percentages(expr: String) -> String:
	var i := 0
	while i < expr.length():
		if expr[i] == "%":
			# Case 1: Percentage of number (9%4)
			if i + 1 < expr.length() and _is_numeric_char(expr[i+1]):
				var base_start = i + 1
				var base_end = base_start
				
				# Find full base number
				while base_end < expr.length() and _is_numeric_char(expr[base_end]):
					base_end += 1
				
				var base_num = expr.substr(base_start, base_end - base_start)
				if base_num.is_valid_float():
					# Replace % with *0.01*
					var replacement = "*" + str(float(base_num) / 100.0)
					expr = expr.substr(0, i) + replacement + expr.substr(base_end)
					i += replacement.length() - 1
			
			# Case 2: Standalone percentage (50%)
			else:
				expr = expr.substr(0, i) + "/100.0" + expr.substr(i + 1)
				i += 6
		i += 1
	return expr

# Helper to check if character is part of a number
func _is_numeric_char(c: String) -> bool:
	return c.is_valid_float() || c == "." || c == "-"

# Fix implied multiplication
func _fix_implied_multiplication(expr: String) -> String:
	var new_expr := ""
	for i in expr.length():
		new_expr += expr[i]
		if i + 1 < expr.length():
			var next = expr[i + 1]
			# Insert * between numbers and brackets
			if (_is_numeric_char(expr[i]) && next == "(") || (expr[i] == ")" && _is_numeric_char(next)):
				new_expr += "*"
	return new_expr

# Error display
func _show_error(msg: String):
	calc_textbox.placeholder_text = msg.left(10)
	calc_textbox.text = ""
	print("Calculator Error: ", msg)
