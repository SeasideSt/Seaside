Class {
	#name : #WAJsonParserTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-JSON'
}

{ #category : #utilities }
WAJsonParserTest >> assertInvalid: aString [
	self should: [ self parse: aString ] raise: WAJsonSyntaxError
]

{ #category : #utilities }
WAJsonParserTest >> parse: aString [
	^ WAJsonParser parse: aString
]

{ #category : #'tests-array' }
WAJsonParserTest >> testBigArray [
	| result |
	result := self parse: ' [ "a" , "b" ] '.
	self assert: result isArray.
	self assert: result size = 2.
	self assert: result first = 'a'.
	self assert: result second = 'b'
]

{ #category : #'tests-objects' }
WAJsonParserTest >> testBigObject [
	| result |
	result := self parse: ' { "a" : 1 , "b" : 2 } '.
	self assert: result isDictionary.
	self assert: result size = 2.
	self assert: (result at: 'a') = 1.
	self assert: (result at: 'b') = 2
]

{ #category : #'tests-array' }
WAJsonParserTest >> testEmptyArray [
	| result |
	result := self parse: '[]'.
	self assert: result isArray.
	self assert: result isEmpty
]

{ #category : #'tests-objects' }
WAJsonParserTest >> testEmptyObject [
	| result |
	result := self parse: '{}'.
	self assert: result isDictionary.
	self assert: result isEmpty
]

{ #category : #'tests-real' }
WAJsonParserTest >> testExplorerEvent [
	| result |
	result := self parse: '{"recordset": null, "type": "change", "fromElement": null, "toElement": null, "altLeft": false, "keyCode": 0, "repeat": false, "reason": 0, "behaviorCookie": 0, "contentOverflow": false, "behaviorPart": 0, "dataTransfer": null, "ctrlKey": false, "shiftLeft": false, "dataFld": "", "qualifier": "", "wheelDelta": 0, "bookmarks": null, "button": 0, "srcFilter": null, "nextPage": "", "cancelBubble": false, "x": 89, "y": 502, "screenX": 231, "screenY": 1694, "srcUrn": "", "boundElements": {"length": 0}, "clientX": 89, "clientY": 502, "propertyName": "", "shiftKey": false, "ctrlLeft": false, "offsetX": 25, "offsetY": 2, "altKey": false}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'offsetY') = 2.
	self deny: (result at: 'altKey').
	self assert: (result at: 'dataTransfer') isNil.
	self assert: (result at: 'nextPage') = ''
]

{ #category : #'tests-literals' }
WAJsonParserTest >> testFalse [
	self deny: (self parse: 'false')
]

{ #category : #'tests-real' }
WAJsonParserTest >> testFirefoxEvent [
	| result |
	result := self parse: '{"type": "change", "eventPhase": 2, "bubbles": true, "cancelable": true, "timeStamp": 0, "CAPTURING_PHASE": 1, "AT_TARGET": 2, "BUBBLING_PHASE": 3, "isTrusted": true, "MOUSEDOWN": 1, "MOUSEUP": 2, "MOUSEOVER": 4, "MOUSEOUT": 8, "MOUSEMOVE": 16, "MOUSEDRAG": 32, "CLICK": 64, "DBLCLICK": 128, "KEYDOWN": 256, "KEYUP": 512, "KEYPRESS": 1024, "DRAGDROP": 2048, "FOCUS": 4096, "BLUR": 8192, "SELECT": 16384, "CHANGE": 32768, "RESET": 65536, "SUBMIT": 131072, "SCROLL": 262144, "LOAD": 524288, "UNLOAD": 1048576, "XFER_DONE": 2097152, "ABORT": 4194304, "ERROR": 8388608, "LOCATE": 16777216, "MOVE": 33554432, "RESIZE": 67108864, "FORWARD": 134217728, "HELP": 268435456, "BACK": 536870912, "TEXT": 1073741824, "ALT_MASK": 1, "CONTROL_MASK": 2, "SHIFT_MASK": 4, "META_MASK": 8}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'eventPhase') = 2.
	self assert: (result at: 'bubbles').
	self assert: (result at: 'cancelable').
	self assert: (result at: 'BACK') = 536870912
]

{ #category : #'tests-invalid' }
WAJsonParserTest >> testInvalidArray [
	self assertInvalid: '['.
	self assertInvalid: '[1'.
	self assertInvalid: '[1,'.
	self assertInvalid: '[1,]'.
	self assertInvalid: '[1 2]'.
	self assertInvalid: '[]]'
]

{ #category : #'tests-invalid' }
WAJsonParserTest >> testInvalidFalse [
	self assertInvalid: 'fa'.
	self assertInvalid: 'falsely'.
	self assertInvalid: 'fabulous'
]

{ #category : #'tests-invalid' }
WAJsonParserTest >> testInvalidNull [
	self assertInvalid: 'nu'.
	self assertInvalid: 'nuclear'.
	self assertInvalid: 'nullified'
]

{ #category : #'tests-invalid' }
WAJsonParserTest >> testInvalidObject [
	self assertInvalid: '{'.
	self assertInvalid: '{"a"'.
	self assertInvalid: '{"a":'.
	self assertInvalid: '{"a":"b"'.
	self assertInvalid: '{"a":"b",'.
	self assertInvalid: '{"a"}'.
	self assertInvalid: '{"a":}'.
	self assertInvalid: '{"a":"b",}'.
	self assertInvalid: '{}}'
]

{ #category : #'tests-invalid' }
WAJsonParserTest >> testInvalidString [
	self assertInvalid: '"'.
	self assertInvalid: '"a'.
	self assertInvalid: '"\"'.
	self assertInvalid: '"\a"'.
	self assertInvalid: '"\u"'.
	self assertInvalid: '"\u1"'.
	self assertInvalid: '"\u12"'.
	self assertInvalid: '"\u123"'.
	self assertInvalid: '"\u123x"'
]

{ #category : #'tests-invalid' }
WAJsonParserTest >> testInvalidTrue [
	self assertInvalid: 'tr'.
	self assertInvalid: 'trace'.
	self assertInvalid: 'truest'
]

{ #category : #'tests-array' }
WAJsonParserTest >> testNestedArray [
	| result |
	result := self parse: '[[2]]'.
	self assert: result isArray.
	self assert: result size = 1.
	result := result first.
	self assert: result isArray.
	self assert: result size = 1.
	self assert: result first = 2
]

{ #category : #'tests-objects' }
WAJsonParserTest >> testNestedObject [
	| result |
	result := self parse: '{"object":{"1":"2"}} '.
	self assert: result isDictionary.
	self assert: result size = 1.
	result := result at: 'object'.
	self assert: result isDictionary.
	self assert: result size = 1.
	self assert: (result at: '1') = '2'
]

{ #category : #'tests-literals' }
WAJsonParserTest >> testNull [
	self assert: (self parse: 'null') isNil
]

{ #category : #'tests-literals' }
WAJsonParserTest >> testNumberFloat [
	self assert: (self parse: '0.0') = 0.0.
	self assert: (self parse: '0.12') = 0.12.
	self assert: (self parse: '-0.12') = -0.12.
	self assert: (self parse: '12.34') = 12.34.
	self assert: (self parse: '-12.34') = -12.34.
	self assert: (self parse: '1.2e0') = 1.2.
	self assert: (self parse: '1.2e+1') = 12.0.
	self assert: (self parse: '1.2e-1') = 1.2e-1
]

{ #category : #'tests-literals' }
WAJsonParserTest >> testNumberInteger [
	self assert: (self parse: '0') = 0.
	self assert: (self parse: '1') = 1.
	self assert: (self parse: '-1') = -1.
	self assert: (self parse: '12') = 12.
	self assert: (self parse: '-12') = -12.
	self assert: (self parse: '1e2') = 100.
	self assert: (self parse: '1e+2') = 100
]

{ #category : #'tests-real' }
WAJsonParserTest >> testSafariEvent [
	| result |
	result := self parse: '{"returnValue": true, "timeStamp": 1226697417289, "eventPhase": 2, "type": "change", "cancelable": false, "bubbles": true, "cancelBubble": false, "MOUSEOUT": 8, "FOCUS": 4096, "CHANGE": 32768, "MOUSEMOVE": 16, "AT_TARGET": 2, "SELECT": 16384, "BLUR": 8192, "KEYUP": 512, "MOUSEDOWN": 1, "MOUSEDRAG": 32, "BUBBLING_PHASE": 3, "MOUSEUP": 2, "CAPTURING_PHASE": 1, "MOUSEOVER": 4, "CLICK": 64, "DBLCLICK": 128, "KEYDOWN": 256, "KEYPRESS": 1024, "DRAGDROP": 2048}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'eventPhase') = 2.
	self assert: (result at: 'bubbles').
	self deny: (result at: 'cancelBubble').
	self deny: (result at: 'cancelable').
	self assert: (result at: 'BLUR') = 8192
]

{ #category : #'tests-array' }
WAJsonParserTest >> testSmallArray [
	| result |
	result := self parse: '["a"]'.
	self assert: result isArray.
	self assert: result size = 1.
	self assert: result first = 'a'
]

{ #category : #'tests-objects' }
WAJsonParserTest >> testSmallObject [
	| result |
	result := self parse: '{"a":1}'.
	self assert: result isDictionary.
	self assert: result size = 1.
	self assert: (result at: 'a') = 1
]

{ #category : #'tests-literals' }
WAJsonParserTest >> testString [
	self assert: (self parse: '""') = ''.
	self assert: (self parse: '"foo"') = 'foo'.
	self assert: (self parse: '"foo bar"') = 'foo bar'.
	self assert: (self parse: '" foo "') = ' foo '
]

{ #category : #'tests-literals' }
WAJsonParserTest >> testStringEscaped [
	self assert: (self parse: '"\""') = '"'.
	self assert: (self parse: '"\\"') = '\'.
	self assert: (self parse: '"\/"') = '/'.
	self assert: (self parse: '"\b"') = (String with: Character backspace).
	self assert: (self parse: '"\f"') = (String with: Character newPage).
	self assert: (self parse: '"\n"') = (String with: Character lf).
	self assert: (self parse: '"\r"') = (String with: Character cr).
	self assert: (self parse: '"\t"') = (String with: Character tab).
	self assert: (self parse: '"\u20Ac"') = (String with: (Character codePoint: 16r20AC))
]

{ #category : #'tests-literals' }
WAJsonParserTest >> testTrue [
	self assert: (self parse: 'true')
]
