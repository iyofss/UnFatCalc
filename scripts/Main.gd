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
	print('protein go brrr')

func _on_calories_button_pressed():
	
	print('calories go brrr')

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

# Error display
func _show_error(msg: String):
	calc_textbox.placeholder_text = msg.left(15)
	calc_textbox.text = ""
	print("Error: ", msg)
