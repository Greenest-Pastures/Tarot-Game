shader_type canvas_item;
uniform float scale : hint_range(0.1, 10) = 2.0;
uniform vec4 color : source_color;
void fragment() {
	vec4 pixelColor = texture(TEXTURE, UV*scale);
	float brightness = (pixelColor.r + pixelColor.g + pixelColor.b) / 3.0;
	vec4 greyScale = vec4(brightness, brightness, brightness, pixelColor.a);
	COLOR = greyScale * color;
	// Place fragment code here.
}
