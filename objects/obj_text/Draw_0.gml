var prevFont = draw_get_font();

if (hasCustomFont)
	draw_set_font(font);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (hasShadow)
{
	draw_set_color(shadowColor);
	draw_text(x + 3, y + 3, text);
}

draw_set_color(fontColor);
draw_text(x, y, text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(prevFont);