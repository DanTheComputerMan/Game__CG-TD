/// @description TAB & Shift+TAB

if (global.selectedTower == self) {
	if (keyboard_check_direct(vk_shift) || keyboard_check_direct(vk_lshift) || keyboard_check_direct(vk_rshift)) {
		targetingChoice = targetingChoicesLeft[$ targetingChoice];
	} else {
		targetingChoice = targetingChoicesRight[$ targetingChoice];
	}
}