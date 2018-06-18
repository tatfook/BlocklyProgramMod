Blockly.paracraft_blockly_config_source = [
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "key",
            "text": "test"
        },
        {
            "type": "field_input",
            "name": "value",
            "text": "hello"
        }
      ],
      "message0": "设置全局变量%1为%2",
      "category": "Data",
      "examples": [
        {
            "desc": "也可以用_G.a",
            "code": "_G.a = _G.a or 1\nwhile(true) do\n  _G.a = a + 1\n  set(\"a\", get(\"a\") + 1)\n  say(a)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#459197",
      "type": "set",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "obj",
            "text": "hello"
        }
      ],
      "message0": "输出日志%1",
      "category": "Data",
      "examples": [
        {
            "desc": "查看log.txt或F11看日志",
            "code": "log(123)\nlog(\"hello\")\nsomething = {any=\"object\"}\nlog(something)\n",
            "canRun": true
        }
      ],
      "colour": "#459197",
      "type": "log",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "key",
            "text": "test"
        },
        {
            "type": "field_input",
            "name": "value",
            "text": "hello"
        }
      ],
      "message0": "设置角色属性%1为%2",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "registerCloneEvent(function(name)\n    setActorValue(\"name\", name)\n    moveForward(1);\nend)\nregisterClickEvent(function()\n    local myname = getActorValue(\"name\")\n    say(\"my name is \"..myname)\nend)\nsetActorValue(\"name\", \"Default\")\nclone(\"myself\", \"Cloned\")\nsay(\"click us!\")\n",
            "canRun": true
        }
      ],
      "colour": "#459197",
      "category": "Data",
      "type": "setActorValue",
      "canRun": false,
      "color": "#cc0000"
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "key",
            "text": "test"
        }
      ],
      "message0": "获取角色属性%1",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "registerCloneEvent(function(msg)\n    setActorValue(\"name\", msg.name)\n    moveForward(msg.dist);\nend)\nregisterClickEvent(function()\n    local myname = getActorValue(\"name\")\n    say(\"my name is \"..myname)\nend)\nsetActorValue(\"name\", \"Default\")\nclone(\"myself\", {name = \"clone1\", dist=1})\nclone(nil, {name = \"clone2\", dist=2})\nsay(\"click us!\")\n",
            "canRun": true
        }
      ],
      "colour": "#459197",
      "type": "getActorValue",
      "category": "Data",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "text",
            "text": "hello!"
        },
        {
            "type": "field_number",
            "name": "duration",
            "text": 2
        }
      ],
      "message0": "说 %1 持续 %2 秒",
      "category": "Looks",
      "examples": [
        {
            "desc": "",
            "code": "say(\"Jump!\", 2)\nmove(0,1,0)\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "sayAndWait",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "text",
            "text": "hello!"
        }
      ],
      "message0": "说 %1",
      "category": "Looks",
      "examples": [
        {
            "desc": "在人物头顶说些话",
            "code": "say(\"Hello!\")\nwait(1)\nsay(\"\")\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "say",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "text",
            "text": "Start Game!"
        }
      ],
      "message0": "提示文字%1",
      "category": "Looks",
      "examples": [
        {
            "desc": "",
            "code": "tip(\"Start Game in 3!\")\nwait(1)\ntip(\"Start Game in 2!\")\nwait(1)\ntip(\"Start Game in 1!\")\nwait(1)\ntip(\"\")\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "tip",
      "helpUrl": "",
      "canRun": true
  },
  {
      "colour": "#7abb55",
      "type": "show",
      "arg0": [],
      "message0": "显示",
      "category": "Looks",
      "helpUrl": "",
      "canRun": true
  },
  {
      "colour": "#7abb55",
      "type": "hide",
      "arg0": [],
      "message0": "隐藏",
      "category": "Looks",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "animId",
            "text": 4
        },
        {
            "type": "field_number",
            "name": "duration",
            "text": 2
        }
      ],
      "message0": "播放动作 %1 等待 %2 秒",
      "category": "Looks",
      "examples": [
        {
            "desc": "",
            "code": "anim(4)\nmove(3, 0, 0, 2)\nanim(0)\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "anim",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "timeFrom",
            "text": 10
        },
        {
            "type": "field_number",
            "name": "timeTo",
            "text": 1000
        }
      ],
      "message0": "播放从%1到%2毫秒",
      "category": "Looks",
      "examples": [
        {
            "desc": "播放电影方块中的角色动画",
            "code": "play(10, 1000)\nsay(\"No looping\", 1)\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "play",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "timeFrom",
            "text": 10
        },
        {
            "type": "field_number",
            "name": "timeTo",
            "text": 1000
        }
      ],
      "message0": "循环播放从%1到%2毫秒",
      "category": "Looks",
      "examples": [
        {
            "desc": "播放电影方块中的角色动画",
            "code": "playLoop(10, 1000)\nsay(\"Looping\", 3)\nstop()\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "playLoop",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [],
      "message0": "停止播放",
      "category": "Looks",
      "examples": [
        {
            "desc": "播放/暂停角色动画",
            "code": "playLoop(10, 1000)\nwait(2)\nstop()\nturn(15)\nplayLoop(10, 1000)\nwait(2)\nstop()\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "stop",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "scaleDelta",
            "text": 10
        }
      ],
      "message0": "放缩百分之%1",
      "category": "Looks",
      "examples": [
        {
            "desc": "",
            "code": "scale(50)\nwait(1)\nscale(-50)\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "scale",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "scale",
            "text": 100
        }
      ],
      "message0": "放缩到百分之%1",
      "category": "Looks",
      "examples": [
        {
            "desc": "",
            "code": "for i=1, 20 do\n    scale(10)\nend\nscaleTo(50)\nwait(0.5)\nscaleTo(200)\nwait(0.5)\nscaleTo(100)\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "scaleTo",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [],
      "message0": "放缩尺寸",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    if(getScale() >= 200) then\n        scaleTo(100)\n    else\n        scale(10)\n    end\nend\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "getScale",
      "category": "Looks",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "动画时间",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "playLoop(10, 2000)\nwhile(true) do\n    if(getPlayTime() > 1000) then\n        say(\"hi\")\n    else\n        say(\"\")\n    end\n    wait(0.01);\nend\n",
            "canRun": true
        }
      ],
      "colour": "#7abb55",
      "type": "getPlayTime",
      "category": "Looks",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "dist",
            "text": "1"
        },
        {
            "type": "field_number",
            "name": "duration",
            "text": 0.5
        }
      ],
      "message0": "前进%1格 在%2秒内",
      "category": "Motion",
      "examples": [
        {
            "desc": "",
            "code": "turn(30);\nfor i=1, 20 do\n    moveForward(0.05)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "moveForward",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "degree",
            "text": 15
        }
      ],
      "message0": "旋转%1度",
      "category": "Motion",
      "examples": [
        {
            "desc": "",
            "code": "turnTo(-60)\nfor i=1, 100 do\n    turn(-3)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "turn",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "degree",
            "text": 90
        }
      ],
      "message0": "旋转到%1方向",
      "category": "Motion",
      "examples": [
        {
            "desc": "",
            "code": "turnTo(-60)\nwait(1)\nturnTo(0)\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "turnTo",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "targetName",
            "text": "mouse-pointer"
        }
      ],
      "message0": "转向%1",
      "category": "Motion",
      "examples": [
        {
            "desc": "转向鼠标,主角,指定角色",
            "code": "turnTo(\"mouse-pointer\")\nmoveForward(1, 1)\nturnTo(\"@p\")\nmoveForward(1, 1)\nturnTo(\"frog\")\nmoveForward(1, 1)\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "turnTo",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "x",
            "text": 1
        },
        {
            "type": "field_number",
            "name": "y",
            "text": 0
        },
        {
            "type": "field_number",
            "name": "z",
            "text": 0
        },
        {
            "type": "field_number",
            "name": "duration",
            "text": 0.5
        }
      ],
      "message0": "位移%1 %2 %3 在%4秒内",
      "category": "Motion",
      "examples": [
        {
            "desc": "",
            "code": "turnTo(0)\nmove(0.5,1,0, 0.5)\nmove(1,-1,0, 0.5)\nsay(\"jump!\", 1)\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "move",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "x"
        },
        {
            "type": "field_number",
            "name": "y"
        },
        {
            "type": "field_number",
            "name": "z"
        },
        {
            "type": "field_number",
            "name": "duration",
            "text": 0.5
        }
      ],
      "isDynamicNPLCode": true,
      "canRun": true,
      "examples": [
        {
            "desc": "",
            "code": "moveTo(19257,5,19174)\nmoveTo(\"mouse-pointer\")\nmoveTo(\"@p\")\nmoveTo(\"frog\")\n",
            "canRun": false
        }
      ],
      "colour": "#0078d7",
      "category": "Motion",
      "type": "moveTo",
      "message0": "瞬移到%1 %2 %3 %4",
      "helpUrl": ""
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "targetName",
            "text": "mouse-pointer"
        }
      ],
      "message0": "瞬移到%1",
      "category": "Motion",
      "examples": [
        {
            "desc": "瞬移到主角，鼠标，指定角色",
            "code": "say(\"current player\", 1)\nmoveTo(\"@p\")\nsay(\"mouse-pointer\", 1)\nmoveTo(\"mouse-pointer\")\nsay(\"the frog actor if any\", 1)\nmoveTo(\"frog\")\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "moveToTarget",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "x",
            "text": 1
        },
        {
            "type": "field_number",
            "name": "y",
            "text": 0
        },
        {
            "type": "field_number",
            "name": "z",
            "text": 0
        },
        {
            "type": "field_number",
            "name": "duration",
            "text": 0.5
        }
      ],
      "message0": "行走%1 %2 %3持续%4秒",
      "category": "Motion",
      "examples": [
        {
            "desc": "",
            "code": "walk(1,0) -- x,z\nwalk(0,1) -- x,z\nwalk(-1,0,-1) -- x,y,z\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "walk",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "dist",
            "text": 1
        },
        {
            "type": "field_number",
            "name": "duration",
            "text": 0.5
        }
      ],
      "message0": "向前走%1持续%2秒",
      "category": "Motion",
      "examples": [
        {
            "desc": "",
            "code": "turnTo(0)\nwalkForward(1)\nturn(180)\nwalkForward(1, 0.5)\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "walkForward",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [],
      "message0": "反弹",
      "category": "Motion",
      "examples": [
        {
            "desc": "遇到方块反弹",
            "code": "turnTo(45)\nwhile(true) do\n    moveForward(0.02)\n    if(isTouching(\"block\")) then\n        bounce()\n    end\nend\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "bounce",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [],
      "message0": "X坐标",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    say(getX())\nend\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "getX",
      "category": "Motion",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "Y坐标",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    say(getY())\n    if(getY()<3) then\n        tip(\"Game Over!\")\n    end\nend\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "getY",
      "category": "Motion",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "Z坐标",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    say(getZ())\nend\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "getZ",
      "category": "Motion",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "方向",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    say(getFacing())\nend\n",
            "canRun": true
        }
      ],
      "colour": "#0078d7",
      "type": "getFacing",
      "category": "Motion",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "当演员被点击时%1",
      "category": "Events",
      "examples": [
        {
            "desc": "",
            "code": "registerClickEvent(function()\n    for i=1, 20 do\n        scale(10)\n    end\n    for i=1, 20 do\n        scale(-10)\n    end\nend)\n",
            "canRun": true
        }
      ],
      "colour": "#764bcc",
      "type": "registerClickEvent",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "keyname",
            "text": "space"
        },
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "当%1键按下时%2",
      "category": "Events",
      "examples": [
        {
            "desc": "空格跳跃",
            "code": "registerKeyPressedEvent(\"space\",function()\n    say(\"Jump!\", 1)\n    move(0,1,0, 0.5)\n    move(0,-1,0, 0.5)\n    walkForward(0)\nend)\n",
            "canRun": true
        }
      ],
      "colour": "#764bcc",
      "type": "registerKeyPressedEvent",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "time",
            "text": 1000
        },
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "当动画在%1帧时%2",
      "category": "Events",
      "examples": [
        {
            "desc": "",
            "code": "registerAnimationEvent(10, function()\n    say(\"anim started\", 3)\nend)\nregisterAnimationEvent(1000, function()\n    say(\"anim stopped\", 1)\nend)\nregisterClickEvent(function()\n    play(10, 1000)\nend);\nsay(\"click me!\")\n",
            "canRun": true
        }
      ],
      "colour": "#764bcc",
      "type": "registerAnimationEvent",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "msg",
            "text": "message0"
        },
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "当收到%1消息时%2",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "registerBroadcastEvent(\"jump\", function()\n    move(0,1,0)\n    wait(1)\n    move(0,-1,0)\nend)\nregisterClickEvent(function()\n    broadcastAndWait(\"jump\")\n    say(\"That was fun!\", 2)\nend)\nsay(\"click to jump!\")\n",
            "canRun": true
        }
      ],
      "colour": "#764bcc",
      "category": "Events",
      "type": "registerBroadcastEvent",
      "canRun": false,
      "color": "#00cc00"
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "msg",
            "text": "message0"
        }
      ],
      "message0": "广播%1消息",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "registerBroadcastEvent(\"hello\", function(msg)\n    say(\"hello\"..msg)\n    move(0,1,0, 0.5)\n    move(0,-1,0, 0.5)\n    say(\"bye\")\nend)\nfor i=1, 2 do\n    broadcast(\"hello\", i)\n    wait(0.5)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#764bcc",
      "category": "Events",
      "type": "broadcast",
      "canRun": false,
      "color": "#00cc00"
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "msg",
            "text": "message0"
        }
      ],
      "message0": "广播%1消息并等待返回",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "registerBroadcastEvent(\"hi\", function()\n    say(\"hi\")\n    wait(1)\n    say(\"bye\")\n    wait(1)\nend)\nfor i=1, 2 do\n    broadcastAndWait(\"hi\")\nend\n",
            "canRun": true
        }
      ],
      "colour": "#764bcc",
      "category": "Events",
      "type": "broadcastAndWait",
      "canRun": false,
      "color": "#00cc00"
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "time",
            "text": 1
        }
      ],
      "message0": "等待%1秒",
      "category": "Control",
      "examples": [
        {
            "desc": "",
            "code": "say(\"hi\")\nwait(1)\nsay(\"bye\", 1)\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "type": "wait",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "times",
            "text": 10
        },
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "重复%1次%2",
      "category": "Control",
      "examples": [
        {
            "desc": "",
            "code": "for i=1, 10 do\n    moveForward(0.1)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "type": "repeat",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "永远重复%1",
      "category": "Control",
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    moveForward(0.01)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "type": "forever",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_expression",
            "name": "expression",
            "text": ""
        },
        {
            "type": "input_statement",
            "name": "input_true",
            "text": ""
        },
        {
            "type": "input_statement",
            "name": "input_else",
            "text": ""
        }
      ],
      "message0": "如果%1那么%2否则%3",
      "category": "Control",
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    if(distanceTo(\"mouse-pointer\")<3) then\n        say(\"mouse-pointer\")\n    else\n        say(\"\")\n    end\n    wait(0.01)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "type": "if_else",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "key",
            "text": "key"
        },
        {
            "type": "field_input",
            "name": "value",
            "text": "value"
        },
        {
            "type": "field_input",
            "name": "data",
            "text": "data"
        },
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "每个%1,%2在%3%4",
      "category": "Control",
      "examples": [
        {
            "desc": "",
            "code": "myData = {\n    key1=\"value1\", \n    key2=\"value2\",\n    key2=\"value2\",\n}\nfor k, v in pairs(myData) do\n    say(v, 1);\nend\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "type": "forKeyValue",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "i",
            "text": "index"
        },
        {
            "type": "field_input",
            "name": "item",
            "text": "item"
        },
        {
            "type": "field_input",
            "name": "data",
            "text": "data"
        },
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "每个%1,%2在数组%3%4",
      "category": "Control",
      "examples": [
        {
            "desc": "",
            "code": "myData = {\n    {x=1, y=0, z=0, duration=0.5},\n    {x=0, y=0, z=1, duration=0.5},\n    {x=-1, y=0, z=-1, duration=1},\n}\nfor i, item in ipairs(myData) do\n    move(item.x, item.y, item.z, item.duration)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "type": "forKeyValue",
      "helpUrl": "",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "当演员被复制时%1",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "registerCloneEvent(function(msg)\n    move(msg or 1, 0, 0, 0.5)\n    wait(1)\n    delete()\nend)\nclone()\nclone(\"myself\", 2)\nclone(\"myself\", 3)\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "category": "Control",
      "type": "registerCloneEvent",
      "canRun": false,
      "color": "#cc0000"
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "input",
            "text": "myself"
        }
      ],
      "message0": "复制角色%1",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "registerClickEvent(function()\n    move(1,0,0, 0.5)\nend)\nclone()\nclone()\nsay(\"click\")\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "category": "Control",
      "type": "clone",
      "canRun": false,
      "color": "#cc0000"
  },
  {
      "arg0": [],
      "message0": "删除角色",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "move(1,0)\nsay(\"Default actor will be deleted!\", 1)\ndelete()\nregisterCloneEvent(function()\n    say(\"This clone will be deleted!\", 1)\n    delete()\nend)\nfor i=1, 100 do\n    clone()\n    wait(2)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "canRun": false,
      "type": "delete",
      "color": "#cc0000",
      "category": "Control"
  },
  {
      "arg0": [
        {
            "type": "input_statement",
            "name": "input",
            "text": ""
        }
      ],
      "message0": "并行执行%1",
      "helpUrl": "",
      "examples": [
        {
            "desc": "",
            "code": "run(function()\n    say(\"follow mouse pointer!\")\n    while(true) do\n        if(distanceTo(\"mouse-pointer\") < 7) then\n            turnTo(\"mouse-pointer\");\n        elseif(distanceTo(\"@p\") > 14) then\n            moveTo(\"@p\")\n        end\n    end\nend)\nrun(function()\n    while(true) do\n        moveForward(0.02)\n    end\nend)\n",
            "canRun": true
        }
      ],
      "colour": "#d83b01",
      "category": "Control",
      "type": "run",
      "canRun": false,
      "color": "#00cc00"
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "input",
            "text": "block"
        }
      ],
      "message0": "是否碰到%1",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "是否和方块与人物有接触",
            "code": "turnTo(45)\nwhile(true) do\n    moveForward(0.1)\n    if(isTouching(62)) then\n        say(\"grass block!\", 1)\n    elseif(isTouching(\"block\")) then\n        bounce()\n    elseif(isTouching(\"box\")) then\n        bounce()\n    end\nend\n",
            "canRun": true
        }
      ],
      "colour": "#69b090",
      "type": "isTouching",
      "category": "Sensing",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "input",
            "text": "mouse-pointer"
        }
      ],
      "message0": "到%1的距离",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    if(distanceTo(\"mouse-pointer\") < 3) then\n        say(\"mouse-pointer\")\n    elseif(distanceTo(\"@p\") < 10) then\n        say(\"player\")\n    elseif(distanceTo(\"@p\") > 10) then\n        say(\"nothing\")\n    end\n    wait(0.01)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#69b090",
      "type": "distanceTo",
      "category": "Sensing",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "input",
            "text": "space"
        }
      ],
      "message0": "%1键是否按下",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "say(\"press left/right key to move me!\")\nwhile(true) do\n    if(isKeyPressed(\"left\")) then\n        move(0, 0.1)\n        say(\"\")\n    elseif(isKeyPressed(\"right\")) then\n        move(0, -0.1)\n        say(\"\")\n    end\nend\n",
            "canRun": true
        }
      ],
      "colour": "#69b090",
      "type": "isKeyPressed",
      "category": "Sensing",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "鼠标是否按下",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "点击任意位置传送",
            "code": "say(\"click anywhere\")\nwhile(true) do\n    if(isMouseDown()) then\n        moveTo(\"mouse-pointer\")\n        wait(0.3)\n    end\nend\n",
            "canRun": true
        }
      ],
      "colour": "#69b090",
      "type": "isMouseDown",
      "category": "Sensing",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "鼠标选取",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "点击任意位置传送",
            "code": "while(true) do\n    local x, y, z, blockid = mousePickBlock();\n    if(x) then\n        say(format(\"%s %s %s :%d\", x, y, z, blockid))\n    end\nend\n",
            "canRun": true
        }
      ],
      "colour": "#69b090",
      "type": "mousePickBlock",
      "category": "Sensing",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "计时器",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "resetTimer()\nwhile(getTimer()<5) do\n    moveForward(0.02)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#69b090",
      "type": "timer",
      "category": "Sensing",
      "canRun": false
  },
  {
      "arg0": [],
      "message0": "重置计时器",
      "category": "Sensing",
      "examples": [
        {
            "desc": "",
            "code": "resetTimer()\nwhile(getTimer()<2) do\n    wait(0.5);\nend\nsay(\"hi\", 2)\n",
            "canRun": true
        }
      ],
      "colour": "#69b090",
      "type": "resetTimer",
      "helpUrl": "",
      "canRun": true
  },
  {
      "colour": "#69b090",
      "type": "modeGame",
      "arg0": [
        {
            "type": "field_input",
            "name": "mode",
            "text": "game"
        }
      ],
      "message0": "设置为游戏模式 %1",
      "category": "Sensing",
      "helpUrl": "",
      "canRun": true
  },
  {
      "colour": "#69b090",
      "type": "modeEdit",
      "arg0": [
        {
            "type": "field_input",
            "name": "mode",
            "text": "edit"
        }
      ],
      "message0": "设置为编辑模式 %1",
      "category": "Sensing",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "note",
            "text": "7"
        },
        {
            "type": "field_number",
            "name": "beat",
            "text": 0.25
        }
      ],
      "message0": "播放音符%1持续%2节拍",
      "category": "Sound",
      "examples": [
        {
            "desc": "",
            "code": "while (true) do\n    playNote(\"1\", 0.5)\n    playNote(\"2\", 0.5)\n    playNote(\"3\", 0.5)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#8f6d40",
      "type": "playNote",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "filename",
            "text": "1"
        }
      ],
      "message0": "播放背景音乐%1",
      "category": "Sound",
      "examples": [
        {
            "desc": "播放音乐后停止",
            "code": "playMusic(\"2\")\nwait(5)\nplayMusic()\n",
            "canRun": true
        }
      ],
      "colour": "#8f6d40",
      "type": "playMusic",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "filename",
            "text": "break"
        }
      ],
      "message0": "播放MP3音乐%1",
      "category": "Sound",
      "examples": [
        {
            "desc": "播放音乐后停止",
            "code": "playSound(\"break\")\nwait(1)\nplaySound(\"click\")\n",
            "canRun": true
        }
      ],
      "colour": "#8f6d40",
      "type": "playSound",
      "helpUrl": "",
      "canRun": true
  },
  {
      "arg0": [
        {
            "type": "input_expression",
            "name": "left",
            "text": ""
        },
        {
            "type": "input_expression",
            "name": "right",
            "text": ""
        }
      ],
      "message0": "%1+%2",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "数字的加减乘除",
            "code": "say(\"1+1=?\")\nwait(1)\nsay(1+1)\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "addition",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "from",
            "text": "1"
        },
        {
            "type": "field_number",
            "name": "to",
            "text": "10"
        }
      ],
      "message0": "随机选择从%1到%2",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    say(math.random(1,100))\n    wait(0.5)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "random",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_expression",
            "name": "left",
            "text": ""
        },
        {
            "type": "input_expression",
            "name": "right",
            "text": ""
        }
      ],
      "message0": "%1==%2",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "比较两个数值",
            "code": "while(true) do\n    a = math.random(0,10)\n    if(a==0) then\n        say(a)\n    elseif(a<=3) then\n        say(a..\"<=3\")\n    elseif(a>6) then\n        say(a..\">6\")\n    else\n        say(\"3<\"..a..\"<=6\")\n    end\n    wait(2)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "equal",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_expression",
            "name": "left",
            "text": ""
        },
        {
            "type": "input_expression",
            "name": "right",
            "text": ""
        }
      ],
      "message0": "%1 与 %2",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "同时满足条件",
            "code": "while(true) do\n    a = math.random(0,10)\n    if(3<a and a<=6) then\n        say(\"3<\"..a..\"<=6\")\n    else\n        say(a)\n    end\n    wait(2)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "and",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_expression",
            "name": "left",
            "text": ""
        },
        {
            "type": "input_expression",
            "name": "right",
            "text": ""
        }
      ],
      "message0": "%1 或 %2",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "左边或右边满足条件",
            "code": "while(true) do\n    a = math.random(0,10)\n    if(a<=3 or a>6) then\n        say(a)\n    else\n        say(\"3<\"..a..\"<=6\")\n    end\n    wait(2)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "or",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "input_expression",
            "name": "left",
            "text": ""
        }
      ],
      "message0": "不满足%1",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "是否不为真",
            "code": "while(true) do\n    a = math.random(0,10)\n    if((not (3<=a)) or (not (a>6))) then\n        say(\"3<\"..a..\"<=6\")\n    else\n        say(a)\n    end\n    wait(2)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "not",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "left",
            "text": "hello"
        },
        {
            "type": "field_input",
            "name": "right",
            "text": "world"
        }
      ],
      "message0": "连接字符串%1和%2",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "say(\"hello \"..\"world\"..\"!!!\")\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "join",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_input",
            "name": "left",
            "text": "hello"
        }
      ],
      "message0": "字符串%1的长度",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "say(\"length of hello is \"..(#\"hello\"));\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "lengthOf",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "left",
            "text": "66"
        },
        {
            "type": "field_number",
            "name": "right",
            "text": "10"
        }
      ],
      "message0": "%1模%2",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "say(\"66%10==\"..(66%10))\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "mod",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "left",
            "text": 5.5
        }
      ],
      "message0": "四舍五入取整%1",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "while(true) do\n    a = math.random(0,10) / 10\n    b = math.floor(a+0.5)\n    say(a..\"=>\"..b)\n    wait(2)\nend\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "round",
      "category": "Operators",
      "canRun": false
  },
  {
      "arg0": [
        {
            "type": "field_number",
            "name": "left",
            "text": 9
        }
      ],
      "message0": "开根号%1",
      "helpUrl": "",
      "output": { "type": "field_number" },
      "examples": [
        {
            "desc": "",
            "code": "say(\"math.sqrt(9)==\"..math.sqrt(9), 1)\nsay(\"math.cos(1)==\"..math.cos(1), 1)\nsay(\"math.abs(-1)==\"..math.abs(1), 1)\n",
            "canRun": true
        }
      ],
      "colour": "#569138",
      "type": "math.sqrt",
      "category": "Operators",
      "canRun": false
  }
]