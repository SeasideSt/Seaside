tests-real
testSafariEvent
	| result |
	result := self parse: '{"returnValue": true, "timeStamp": 1226697417289, "eventPhase": 2, "type": "change", "cancelable": false, "bubbles": true, "cancelBubble": false, "MOUSEOUT": 8, "FOCUS": 4096, "CHANGE": 32768, "MOUSEMOVE": 16, "AT_TARGET": 2, "SELECT": 16384, "BLUR": 8192, "KEYUP": 512, "MOUSEDOWN": 1, "MOUSEDRAG": 32, "BUBBLING_PHASE": 3, "MOUSEUP": 2, "CAPTURING_PHASE": 1, "MOUSEOVER": 4, "CLICK": 64, "DBLCLICK": 128, "KEYDOWN": 256, "KEYPRESS": 1024, "DRAGDROP": 2048}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'eventPhase') = 2.
	self assert: (result at: 'bubbles').
	self deny: (result at: 'cancelBubble').
	self deny: (result at: 'cancelable').
	self assert: (result at: 'BLUR') = 8192