var prevFont = draw_get_font();

draw_set_font(fnt_button);

var x1 = x - buttonWidth / 2,
	x2 = x + buttonWidth / 2,
	y1 = y - buttonHeight / 2,
	y2 = y + buttonHeight / 2;

draw_set_color(outlineColor);
draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(buttonColor);
draw_rectangle(x1 + outlineThickness, y1 + outlineThickness, x2 - outlineThickness, y2 - outlineThickness, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(shadowColor);
draw_text(x + 3, y + 3, text);

draw_set_color(textColor);
draw_text(x, y, text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(prevFont);