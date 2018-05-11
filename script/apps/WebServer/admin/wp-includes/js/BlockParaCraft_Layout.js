Blockly.Blocks['ParaCraft_Start'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Start",
        "message0": "active %1",
        "args0": [
          {
            "type": "input_statement",
            "name": "statement"
          }
        ],
        "colour": 210,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Move'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Move",
        "message0": "move %1 step",
        "args0": [
          {
            "type": "field_number",
            "name": "count",
            "value": 1,
            "min": 1
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 210,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Turn'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Turn",
        "message0": "turn %1",
        "args0": [
          {
            "type": "field_dropdown",
            "name": "type",
            "options": [
              [
                "left",
                "left"
              ],
              [
                "right",
                "right"
              ],
              [
                "back",
                "back"
              ]
            ]
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 210,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Goto'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Goto",
        "message0": "goto x: %1 y: %2 z: %3",
        "args0": [
          {
            "type": "field_number",
            "name": "x",
            "value": 0
          },
          {
            "type": "field_number",
            "name": "y",
            "value": 0
          },
          {
            "type": "field_number",
            "name": "z",
            "value": 0
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 210,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_SetPosition'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_SetPosition",
        "message0": "set position x: %1 y: %2 z: %3",
        "args0": [
          {
            "type": "field_number",
            "name": "x",
            "value": 0
          },
          {
            "type": "field_number",
            "name": "y",
            "value": 0
          },
          {
            "type": "field_number",
            "name": "z",
            "value": 0
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 210,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_OnKeyPressed'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_OnKeyPressed",
        "message0": "when %1 key pressed %2",
        "args0": [
          {
            "type": "field_dropdown",
            "name": "key",
            "options": [
              [
                "W",
                "W"
              ],
              [
                "A",
                "A"
              ],
              [
                "S",
                "S"
              ],
              [
                "D",
                "D"
              ]
            ]
          },
          {
            "type": "input_statement",
            "name": "statement"
          }
        ],
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_OnClick'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_OnClick",
        "message0": "when this npc clicked %1",
        "args0": [
          {
            "type": "input_statement",
            "name": "statement"
          }
        ],
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_OnEvent'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_OnEvent",
        "message0": "when I receive %1 %2",
        "args0": [
          {
            "type": "field_input",
            "name": "event",
            "text": "event"
          },
          {
            "type": "input_statement",
            "name": "statement"
          }
        ],
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_SendEvent'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_SendEvent",
        "message0": "broadcast %1 and wait",
        "args0": [
          {
            "type": "field_input",
            "name": "event",
            "text": "event"
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_CallEvent'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_CallEvent",
        "message0": "broadcast %1",
        "args0": [
          {
            "type": "field_input",
            "name": "event",
            "text": "event"
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Say'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Say",
        "message0": "say %1 for %2 secs",
        "args0": [
          {
            "type": "field_input",
            "name": "something",
            "text": "Hello!"
          },
          {
            "type": "field_number",
            "name": "time",
            "value": 2
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Show'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Show",
        "message0": "show",
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Hide'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Hide",
        "message0": "hide",
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_SetTime'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_SetTime",
        "message0": "set time to %1",
        "args0": [
          {
            "type": "field_number",
            "name": "time",
            "value": 0
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_SetAnimation'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_SetAnimation",
        "message0": "set animation to %1",
        "args0": [
          {
            "type": "field_number",
            "name": "id",
            "value": 0
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_SetSize'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_SetSize",
        "message0": "set size to %1",
        "args0": [
          {
            "type": "field_number",
            "name": "size",
            "value": 0
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Wait'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Wait",
        "message0": "wait %1 secs",
        "args0": [
          {
            "type": "field_number",
            "name": "time",
            "value": 1
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Stop'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Stop",
        "message0": "stop",
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_PlaySound'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_PlaySound",
        "message0": "play sound %1",
        "args0": [
          {
            "type": "field_input",
            "name": "filename",
            "text": ""
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_AskAndWait'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_AskAndWait",
        "message0": "ask %1 and wait",
        "args0": [
          {
            "type": "field_input",
            "name": "NAME",
            "text": "what's your name?"
          }
        ],
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };
Blockly.Blocks['ParaCraft_Answer'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Answer",
        "message0": "answer",
        "output": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  }
Blockly.Blocks['ParaCraft_IsMouseDown'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_IsMouseDown",
        "message0": "mouse down?",
        "output": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  }
Blockly.Blocks['ParaCraft_IsKeyPressed'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_IsKeyPressed",
        "message0": "key %1 pressed?",
        "args0": [
          {
            "type": "field_dropdown",
            "name": "key",
            "options": [
              [
                "W",
                "W"
              ],
              [
                "A",
                "A"
              ],
              [
                "S",
                "S"
              ],
              [
                "D",
                "D"
              ]
            ]
          }
        ],
        "output": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  }
Blockly.Blocks['ParaCraft_GetMousePosition'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_GetMousePosition",
        "message0": "mouse position %1",
        "args0": [
          {
            "type": "field_dropdown",
            "name": "type",
            "options": [
              [
                "x",
                "x"
              ],
              [
                "y",
                "y"
              ],
              [
                "z",
                "z"
              ]
            ]
          }
        ],
        "output": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  }
Blockly.Blocks['ParaCraft_Timer'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_Timer",
        "message0": "timer",
        "output": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  }
Blockly.Blocks['ParaCraft_ResetTimer'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_ResetTimer",
        "message0": "reset timer",
        "previousStatement": null,
        "nextStatement": null,
        "colour": 230,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  }
Blockly.Blocks['ParaCraft_DestroyBlock'] =
  {
    init: function () {
      this.jsonInit({
        "type": "ParaCraft_DestroyBlock",
        "message0": "摧毁前方方块",
        "previousStatement": null,
        "nextStatement": null,
        "colour": 210,
        "tooltip": "",
        "helpUrl": ""
      });
    }
  };