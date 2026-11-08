/// @DnDAction : YoYo Games.Movement.Jump_To_Point
/// @DnDVersion : 1
/// @DnDHash : 640B9871


/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 53151DFA
/// @DnDArgument : "var" "other.key_collected"
/// @DnDArgument : "value" "1"
if(other.key_collected == 1){	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 47FAFBF6
	/// @DnDParent : 53151DFA
	instance_destroy();}