tests-real
testExplorerEvent
	| result |
	result := self parse: '{"recordset": null, "type": "change", "fromElement": null, "toElement": null, "altLeft": false, "keyCode": 0, "repeat": false, "reason": 0, "behaviorCookie": 0, "contentOverflow": false, "behaviorPart": 0, "dataTransfer": null, "ctrlKey": false, "shiftLeft": false, "dataFld": "", "qualifier": "", "wheelDelta": 0, "bookmarks": null, "button": 0, "srcFilter": null, "nextPage": "", "cancelBubble": false, "x": 89, "y": 502, "screenX": 231, "screenY": 1694, "srcUrn": "", "boundElements": {"length": 0}, "clientX": 89, "clientY": 502, "propertyName": "", "shiftKey": false, "ctrlLeft": false, "offsetX": 25, "offsetY": 2, "altKey": false}'.
	self assert: (result at: 'type') = 'change'.
	self assert: (result at: 'offsetY') = 2.
	self deny: (result at: 'altKey').
	self assert: (result at: 'dataTransfer') isNil.
	self assert: (result at: 'nextPage') = ''