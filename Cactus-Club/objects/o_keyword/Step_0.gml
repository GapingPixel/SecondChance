/// @description Insert description here
// You can write your code in this editor
if !instance_exists(o_text) then instance_destroy(id,false);exit;
if page_ != o_text.page then instance_destroy(id,false);