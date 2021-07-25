function keyToName(key){
	switch key
	{
		case vk_up: return global.buttonText.up;
		case vk_down: return global.buttonText.down;
		case vk_left: return global.buttonText.left;
		case vk_right: return global.buttonText.right;
		case vk_tab: return global.buttonText.tab;
		case vk_lshift:
		case vk_rshift:
		case vk_shift: return global.buttonText.shift;
		case vk_control: return global.buttonText.ctrl;
		default: return chr(key);
	}
}	