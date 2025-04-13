extends ColorPickerButton

func _ready():
	get_popup().connect("about_to_popup", _on_color_picker_about_to_popup)

func _on_color_picker_about_to_popup():
	var color_picker = get_picker()
	
	# Set to HSV mode and force rectangular picker shape
	color_picker.color_mode = 1  # 1 = HSV
	color_picker.picker_shape = 1  # Rectangular (if available in your Godot version)
	
	# Hide all unnecessary UI elements
	color_picker.color_modes_visible = false
	color_picker.sliders_visible = false
	color_picker.hex_visible = true
	color_picker.presets_visible = false
	color_picker.sampler_visible = false
	color_picker.edit_alpha = false
	
	# Hide the mode buttons (RGB/HSV/RAW) via theme override
	var theme = Theme.new()
	theme.set_stylebox("normal", "ColorPickerModeButton", StyleBoxEmpty.new())
	theme.set_constant("h_separation", "ColorPickerModeButton", -100)  # Push buttons off-screen
	color_picker.theme = theme
	
