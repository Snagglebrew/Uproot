draw_self();
shader_reset();
if(place_meeting(x,y,obj_player)){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_color(c_white);
	
	draw_text(x,y - textSignOffset, textSignText);
}