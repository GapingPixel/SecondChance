gml_pragma("forceinline");

paused_ = false;
if sprite_exists(paused_sprite_)
{
	sprite_delete(paused_sprite_)
	window_set_cursor(cr_none);
}
instance_activate_all();

//audio_play(a_unpause);

window_set_cursor(cr_none);