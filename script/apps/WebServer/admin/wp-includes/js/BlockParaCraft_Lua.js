Blockly.Lua['ParaCraft_Start'] = function (block) {
  // TODO: Assemble Lua into code variable.
  return 'API.setActive(function()\n';
};
Blockly.Lua['ParaCraft_Move'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var number_count = block.getFieldValue('count');
  var code = 'API.move(' + number_count + ');\n';
  return code;
};
Blockly.Lua['ParaCraft_Turn'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var dropdown_name = block.getFieldValue('type');
  var code = 'API.turn(' + dropdown_name + ');\n';
  return code;
};
Blockly.Lua['ParaCraft_Goto'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var number_x = block.getFieldValue('x');
  var number_y = block.getFieldValue('y');
  var number_z = block.getFieldValue('z');
  var code = 'API.goto(' + number_x + ',' + number_y + ',' + number_z + ');\n';
  return code;
};
Blockly.Lua['ParaCraft_SetPosition'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var number_x = block.getFieldValue('x');
  var number_y = block.getFieldValue('y');
  var number_z = block.getFieldValue('z');
  var code = 'API.setPosition(' + number_x + ',' + number_y + ',' + number_z + ');\n';
  return code;
};
Blockly.Lua['ParaCraft_OnKeyPressed'] = function (block) {
  var dropdown_key = block.getFieldValue('key');
  // TODO: Assemble Lua into code variable.
  var code = 'API.setEventFunction("OnKeyPressed","'+dropdown_key+'",function()\n';
  return code;
};
Blockly.Lua['ParaCraft_OnClick'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.setEventFunction("OnClick",nil,function()\n';
  return code;
};
Blockly.Lua['ParaCraft_OnEvent'] = function (block) {
  var text_event = block.getFieldValue('event');
  // TODO: Assemble Lua into code variable.
  var code = 'API.setEventFunction("OnEvent","'+text_event+'",function()\n';
  return code;
};
Blockly.Lua['ParaCraft_SendEvent'] = function (block) {
  var text_event = block.getFieldValue('event');
  // TODO: Assemble Lua into code variable.
  var code = 'API.sendEvent("'+text_event+'");\n';
  return code;
};
Blockly.Lua['ParaCraft_CallEvent'] = function (block) {
  var text_event = block.getFieldValue('event');
  // TODO: Assemble Lua into code variable.
  var code = 'API.postEvent("'+text_event+'");\n';
  return code;
};
Blockly.Lua['ParaCraft_Say'] = function (block) {
  var text_something = block.getFieldValue('something');
  var number_time = block.getFieldValue('time');
  // TODO: Assemble Lua into code variable.
  var code = 'API.say("'+text_something+'",'+number_time+');\n';
  return code;
};
Blockly.Lua['ParaCraft_Show'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.show();\n';
  return code;
};
Blockly.Lua['ParaCraft_Hide'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.hide();\n';
  return code;
};
Blockly.Lua['ParaCraft_SetTime'] = function (block) {
  var number_time = block.getFieldValue('time');
  // TODO: Assemble Lua into code variable.
  var code = 'API.setTime('+number_time+');\n';
  return code;
};
Blockly.Lua['ParaCraft_SetAnimation'] = function (block) {
  var number_id = block.getFieldValue('id');
  // TODO: Assemble Lua into code variable.
  var code = 'API.setAnimation('+number_id+');\n';
  return code;
};
Blockly.Lua['ParaCraft_SetSize'] = function (block) {
  var number_size = block.getFieldValue('size');
  // TODO: Assemble Lua into code variable.
  var code = 'API.setSize('+number_size+');\n';
  return code;
};
Blockly.Lua['ParaCraft_Wait'] = function (block) {
  var number_time = block.getFieldValue('time');
  // TODO: Assemble Lua into code variable.
  var code = 'API.wait('+number_time+');\n';
  return code;
};
Blockly.Lua['ParaCraft_Stop'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.stop();\n';
  return code;
};
Blockly.Lua['ParaCraft_PlaySound'] = function (block) {
  var text_filename = block.getFieldValue('filename');
  // TODO: Assemble Lua into code variable.
  var code = 'API.playSound("'+text_filename+'");\n';
  return code;
};
Blockly.Lua['ParaCraft_AskAndWait'] = function (block) {
  var text_name = block.getFieldValue('NAME');
  // TODO: Assemble Lua into code variable.
  var code = 'API.askAndWait("'+text_name+'");\n';
  return code;
};
Blockly.Lua['ParaCraft_Answer'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.getAnswer()';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Lua.ORDER_NONE];
};
Blockly.Lua['ParaCraft_IsMouseDown'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.isMouseDown()';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Lua.ORDER_NONE];
};
Blockly.Lua['ParaCraft_IsKeyPressed'] = function (block) {
  var dropdown_key = block.getFieldValue('key');
  // TODO: Assemble Lua into code variable.
  var code = 'API.isKeyPressed("'+dropdown_key+'")';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Lua.ORDER_NONE];
};
Blockly.Lua['ParaCraft_GetMousePosition'] = function (block) {
  var dropdown_type = block.getFieldValue('type');
  // TODO: Assemble Lua into code variable.
  var code = 'API.getMousePosition("'+dropdown_type+'")';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Lua.ORDER_NONE];
};
Blockly.Lua['ParaCraft_Timer'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.getTimer()';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.Lua.ORDER_NONE];
};
Blockly.Lua['ParaCraft_ResetTimer'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.resetTimer()\n';
  return code;
};
Blockly.Lua['ParaCraft_DestroyBlock'] = function (block) {
  // TODO: Assemble Lua into code variable.
  var code = 'API.destroyBlock();\n';
  return code;
};
