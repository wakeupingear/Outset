function keyToName(key){
	switch key
	{
		case vk_up: return global.buttonText.up;
		case vk_down: return global.buttonText.down;
		case vk_left: return global.buttonText.left;
		case vk_right: return global.buttonText.right;
		case vk_tab: return global.buttonText.tab;
		default: return chr(key);
	}
}	