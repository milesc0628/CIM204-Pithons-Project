/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1230B5FE
/// @DnDArgument : "code" "if(other.cagekey_collected == 1)$(13_10){$(13_10)	instance_destroy();$(13_10)}"
if(other.cagekey_collected == 1)
{
	instance_destroy();
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 28833852
/// @DnDArgument : "expr" "1"
/// @DnDArgument : "var" "	global.playerscore"
	global.playerscore = 1;