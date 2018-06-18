Blockly.Lua['set'] = function (block) {
    var set_key_value = block.getFieldValue('key');
		
    var set_value_value = block.getFieldValue('value');
		
    return 'set(' + set_key_value + ',' + set_value_value + ');\n';

};
	
Blockly.Lua['log'] = function (block) {
    var log_obj_value = block.getFieldValue('obj');
		
    return 'log(' + log_obj_value + ');\n';

};
	
Blockly.Lua['setActorValue'] = function (block) {
    var setActorValue_key_value = block.getFieldValue('key');
		
    var setActorValue_value_value = block.getFieldValue('value');
		
    return 'setActorValue(' + setActorValue_key_value + ',' + setActorValue_value_value + ');\n';

};
	
Blockly.Lua['getActorValue'] = function (block) {
    var getActorValue_key_value = block.getFieldValue('key');
		
    return 'getActorValue(' + getActorValue_key_value + ');\n';

};
	
Blockly.Lua['sayAndWait'] = function (block) {
    var sayAndWait_text_value = block.getFieldValue('text');
		
    var sayAndWait_duration_value = block.getFieldValue('duration');
		
    return 'sayAndWait(' + sayAndWait_text_value + ',' + sayAndWait_duration_value + ');\n';

};
	
Blockly.Lua['say'] = function (block) {
    var say_text_value = block.getFieldValue('text');
		
    return 'say(' + say_text_value + ');\n';

};
	
Blockly.Lua['tip'] = function (block) {
    var tip_text_value = block.getFieldValue('text');
		
    return 'tip(' + tip_text_value + ');\n';

};
	
Blockly.Lua['show'] = function (block) {
    nil
    return 'show(' + nil + ');\n';

};
	
Blockly.Lua['hide'] = function (block) {
    nil
    return 'hide(' + nil + ');\n';

};
	
Blockly.Lua['anim'] = function (block) {
    var anim_animId_value = block.getFieldValue('animId');
		
    var anim_duration_value = block.getFieldValue('duration');
		
    return 'anim(' + anim_animId_value + ',' + anim_duration_value + ');\n';

};
	
Blockly.Lua['play'] = function (block) {
    var play_timeFrom_value = block.getFieldValue('timeFrom');
		
    var play_timeTo_value = block.getFieldValue('timeTo');
		
    return 'play(' + play_timeFrom_value + ',' + play_timeTo_value + ');\n';

};
	
Blockly.Lua['playLoop'] = function (block) {
    var playLoop_timeFrom_value = block.getFieldValue('timeFrom');
		
    var playLoop_timeTo_value = block.getFieldValue('timeTo');
		
    return 'playLoop(' + playLoop_timeFrom_value + ',' + playLoop_timeTo_value + ');\n';

};
	
Blockly.Lua['stop'] = function (block) {
    nil
    return 'stop(' + nil + ');\n';

};
	
Blockly.Lua['scale'] = function (block) {
    var scale_scaleDelta_value = block.getFieldValue('scaleDelta');
		
    return 'scale(' + scale_scaleDelta_value + ');\n';

};
	
Blockly.Lua['scaleTo'] = function (block) {
    var scaleTo_scale_value = block.getFieldValue('scale');
		
    return 'scaleTo(' + scaleTo_scale_value + ');\n';

};
	
Blockly.Lua['getScale'] = function (block) {
    nil
    return 'getScale(' + nil + ');\n';

};
	
Blockly.Lua['getPlayTime'] = function (block) {
    nil
    return 'getPlayTime(' + nil + ');\n';

};
	
Blockly.Lua['moveForward'] = function (block) {
    var moveForward_dist_value = block.getFieldValue('dist');
		
    var moveForward_duration_value = block.getFieldValue('duration');
		
    return 'moveForward(' + moveForward_dist_value + ',' + moveForward_duration_value + ');\n';

};
	
Blockly.Lua['turn'] = function (block) {
    var turn_degree_value = block.getFieldValue('degree');
		
    return 'turn(' + turn_degree_value + ');\n';

};
	
Blockly.Lua['turnTo'] = function (block) {
    var turnTo_degree_value = block.getFieldValue('degree');
		
    return 'turnTo(' + turnTo_degree_value + ');\n';

};
	
Blockly.Lua['turnTo'] = function (block) {
    var turnTo_targetName_value = block.getFieldValue('targetName');
		
    return 'turnTo(' + turnTo_targetName_value + ');\n';

};
	
Blockly.Lua['move'] = function (block) {
    var move_x_value = block.getFieldValue('x');
		
    var move_y_value = block.getFieldValue('y');
		
    var move_z_value = block.getFieldValue('z');
		
    var move_duration_value = block.getFieldValue('duration');
		
    return 'move(' + move_x_value + ',' + move_y_value + ',' + move_z_value + ',' + move_duration_value + ');\n';

};
	
Blockly.Lua['moveTo'] = function (block) {
    var moveTo_x_value = block.getFieldValue('x');
		
    var moveTo_y_value = block.getFieldValue('y');
		
    var moveTo_z_value = block.getFieldValue('z');
		
    var moveTo_duration_value = block.getFieldValue('duration');
		
    return 'moveTo(' + moveTo_x_value + ',' + moveTo_y_value + ',' + moveTo_z_value + ',' + moveTo_duration_value + ');\n';

};
	
Blockly.Lua['moveToTarget'] = function (block) {
    var moveToTarget_targetName_value = block.getFieldValue('targetName');
		
    return 'moveToTarget(' + moveToTarget_targetName_value + ');\n';

};
	
Blockly.Lua['walk'] = function (block) {
    var walk_x_value = block.getFieldValue('x');
		
    var walk_y_value = block.getFieldValue('y');
		
    var walk_z_value = block.getFieldValue('z');
		
    var walk_duration_value = block.getFieldValue('duration');
		
    return 'walk(' + walk_x_value + ',' + walk_y_value + ',' + walk_z_value + ',' + walk_duration_value + ');\n';

};
	
Blockly.Lua['walkForward'] = function (block) {
    var walkForward_dist_value = block.getFieldValue('dist');
		
    var walkForward_duration_value = block.getFieldValue('duration');
		
    return 'walkForward(' + walkForward_dist_value + ',' + walkForward_duration_value + ');\n';

};
	
Blockly.Lua['bounce'] = function (block) {
    nil
    return 'bounce(' + nil + ');\n';

};
	
Blockly.Lua['getX'] = function (block) {
    nil
    return 'getX(' + nil + ');\n';

};
	
Blockly.Lua['getY'] = function (block) {
    nil
    return 'getY(' + nil + ');\n';

};
	
Blockly.Lua['getZ'] = function (block) {
    nil
    return 'getZ(' + nil + ');\n';

};
	
Blockly.Lua['getFacing'] = function (block) {
    nil
    return 'getFacing(' + nil + ');\n';

};
	
Blockly.Lua['registerClickEvent'] = function (block) {
    var registerClickEvent_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'registerClickEvent(' + 'function()\n' + 
        registerClickEvent_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['registerKeyPressedEvent'] = function (block) {
    var registerKeyPressedEvent_keyname_value = block.getFieldValue('keyname');
		
    var registerKeyPressedEvent_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'registerKeyPressedEvent(' + registerKeyPressedEvent_keyname_value + ',' + 'function()\n' + 
        registerKeyPressedEvent_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['registerAnimationEvent'] = function (block) {
    var registerAnimationEvent_time_value = block.getFieldValue('time');
		
    var registerAnimationEvent_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'registerAnimationEvent(' + registerAnimationEvent_time_value + ',' + 'function()\n' + 
        registerAnimationEvent_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['registerBroadcastEvent'] = function (block) {
    var registerBroadcastEvent_msg_value = block.getFieldValue('msg');
		
    var registerBroadcastEvent_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'registerBroadcastEvent(' + registerBroadcastEvent_msg_value + ',' + 'function()\n' + 
        registerBroadcastEvent_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['broadcast'] = function (block) {
    var broadcast_msg_value = block.getFieldValue('msg');
		
    return 'broadcast(' + broadcast_msg_value + ');\n';

};
	
Blockly.Lua['broadcastAndWait'] = function (block) {
    var broadcastAndWait_msg_value = block.getFieldValue('msg');
		
    return 'broadcastAndWait(' + broadcastAndWait_msg_value + ');\n';

};
	
Blockly.Lua['wait'] = function (block) {
    var wait_time_value = block.getFieldValue('time');
		
    return 'wait(' + wait_time_value + ');\n';

};
	
Blockly.Lua['repeat'] = function (block) {
    var repeat_times_value = block.getFieldValue('times');
		
    var repeat_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'repeat(' + repeat_times_value + ',' + 'function()\n' + 
        repeat_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['forever'] = function (block) {
    var forever_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'forever(' + 'function()\n' + 
        forever_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['if_else'] = function (block) {
    var if_else_expression_value = block.getFieldValue('expression');
		
    var if_else_statement = Blockly.Lua.statementToCode(block, 'input_true') || '';
		
    var if_else_statement = Blockly.Lua.statementToCode(block, 'input_else') || '';
		
    return 'if_else(' + if_else_expression_value + ',' + 'function()\n' + 
        if_else_statement
    + 'end'
             + ',' + 'function()\n' + 
        if_else_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['forKeyValue'] = function (block) {
    var forKeyValue_key_value = block.getFieldValue('key');
		
    var forKeyValue_value_value = block.getFieldValue('value');
		
    var forKeyValue_data_value = block.getFieldValue('data');
		
    var forKeyValue_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'forKeyValue(' + forKeyValue_key_value + ',' + forKeyValue_value_value + ',' + forKeyValue_data_value + ',' + 'function()\n' + 
        forKeyValue_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['forKeyValue'] = function (block) {
    var forKeyValue_i_value = block.getFieldValue('i');
		
    var forKeyValue_item_value = block.getFieldValue('item');
		
    var forKeyValue_data_value = block.getFieldValue('data');
		
    var forKeyValue_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'forKeyValue(' + forKeyValue_i_value + ',' + forKeyValue_item_value + ',' + forKeyValue_data_value + ',' + 'function()\n' + 
        forKeyValue_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['registerCloneEvent'] = function (block) {
    var registerCloneEvent_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'registerCloneEvent(' + 'function()\n' + 
        registerCloneEvent_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['clone'] = function (block) {
    var clone_input_value = block.getFieldValue('input');
		
    return 'clone(' + clone_input_value + ');\n';

};
	
Blockly.Lua['delete'] = function (block) {
    nil
    return 'delete(' + nil + ');\n';

};
	
Blockly.Lua['run'] = function (block) {
    var run_statement = Blockly.Lua.statementToCode(block, 'input') || '';
		
    return 'run(' + 'function()\n' + 
        run_statement
    + 'end'
             + ');\n';

};
	
Blockly.Lua['isTouching'] = function (block) {
    var isTouching_input_value = block.getFieldValue('input');
		
    return 'isTouching(' + isTouching_input_value + ');\n';

};
	
Blockly.Lua['distanceTo'] = function (block) {
    var distanceTo_input_value = block.getFieldValue('input');
		
    return 'distanceTo(' + distanceTo_input_value + ');\n';

};
	
Blockly.Lua['isKeyPressed'] = function (block) {
    var isKeyPressed_input_value = block.getFieldValue('input');
		
    return 'isKeyPressed(' + isKeyPressed_input_value + ');\n';

};
	
Blockly.Lua['isMouseDown'] = function (block) {
    nil
    return 'isMouseDown(' + nil + ');\n';

};
	
Blockly.Lua['mousePickBlock'] = function (block) {
    nil
    return 'mousePickBlock(' + nil + ');\n';

};
	
Blockly.Lua['timer'] = function (block) {
    nil
    return 'timer(' + nil + ');\n';

};
	
Blockly.Lua['resetTimer'] = function (block) {
    nil
    return 'resetTimer(' + nil + ');\n';

};
	
Blockly.Lua['modeGame'] = function (block) {
    var modeGame_mode_value = block.getFieldValue('mode');
		
    return 'modeGame(' + modeGame_mode_value + ');\n';

};
	
Blockly.Lua['modeEdit'] = function (block) {
    var modeEdit_mode_value = block.getFieldValue('mode');
		
    return 'modeEdit(' + modeEdit_mode_value + ');\n';

};
	
Blockly.Lua['playNote'] = function (block) {
    var playNote_note_value = block.getFieldValue('note');
		
    var playNote_beat_value = block.getFieldValue('beat');
		
    return 'playNote(' + playNote_note_value + ',' + playNote_beat_value + ');\n';

};
	
Blockly.Lua['playMusic'] = function (block) {
    var playMusic_filename_value = block.getFieldValue('filename');
		
    return 'playMusic(' + playMusic_filename_value + ');\n';

};
	
Blockly.Lua['playSound'] = function (block) {
    var playSound_filename_value = block.getFieldValue('filename');
		
    return 'playSound(' + playSound_filename_value + ');\n';

};
	
Blockly.Lua['addition'] = function (block) {
    var addition_left_value = block.getFieldValue('left');
		
    var addition_right_value = block.getFieldValue('right');
		
    return 'addition(' + addition_left_value + ',' + addition_right_value + ');\n';

};
	
Blockly.Lua['random'] = function (block) {
    var random_from_value = block.getFieldValue('from');
		
    var random_to_value = block.getFieldValue('to');
		
    return 'random(' + random_from_value + ',' + random_to_value + ');\n';

};
	
Blockly.Lua['equal'] = function (block) {
    var equal_left_value = block.getFieldValue('left');
		
    var equal_right_value = block.getFieldValue('right');
		
    return 'equal(' + equal_left_value + ',' + equal_right_value + ');\n';

};
	
Blockly.Lua['and'] = function (block) {
    var and_left_value = block.getFieldValue('left');
		
    var and_right_value = block.getFieldValue('right');
		
    return 'and(' + and_left_value + ',' + and_right_value + ');\n';

};
	
Blockly.Lua['or'] = function (block) {
    var or_left_value = block.getFieldValue('left');
		
    var or_right_value = block.getFieldValue('right');
		
    return 'or(' + or_left_value + ',' + or_right_value + ');\n';

};
	
Blockly.Lua['not'] = function (block) {
    var not_left_value = block.getFieldValue('left');
		
    return 'not(' + not_left_value + ');\n';

};
	
Blockly.Lua['join'] = function (block) {
    var join_left_value = block.getFieldValue('left');
		
    var join_right_value = block.getFieldValue('right');
		
    return 'join(' + join_left_value + ',' + join_right_value + ');\n';

};
	
Blockly.Lua['lengthOf'] = function (block) {
    var lengthOf_left_value = block.getFieldValue('left');
		
    return 'lengthOf(' + lengthOf_left_value + ');\n';

};
	
Blockly.Lua['mod'] = function (block) {
    var mod_left_value = block.getFieldValue('left');
		
    var mod_right_value = block.getFieldValue('right');
		
    return 'mod(' + mod_left_value + ',' + mod_right_value + ');\n';

};
	
Blockly.Lua['round'] = function (block) {
    var round_left_value = block.getFieldValue('left');
		
    return 'round(' + round_left_value + ');\n';

};
	
Blockly.Lua['sqrt'] = function (block) {
    var sqrt_left_value = block.getFieldValue('left');
		
    return 'math.sqrt(' + sqrt_left_value + ');\n';

};
	