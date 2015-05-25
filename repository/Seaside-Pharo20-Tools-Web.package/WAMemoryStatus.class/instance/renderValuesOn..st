rendering
renderValuesOn: html
	| oldSpaceEnd youngSpaceEnd memoryEnd parameters |
	parameters := SmalltalkImage current vm getParameters.
	
	oldSpaceEnd := parameters first.
	youngSpaceEnd := parameters second.
	memoryEnd := parameters third.
	
	self
		renderLabel: 'Old Space'
		value: (self printMemory: oldSpaceEnd)
		value: (self percent: oldSpaceEnd / memoryEnd)
		on: html.
	self
		renderLabel: 'Young Space'
		value: (self printMemory: (youngSpaceEnd - oldSpaceEnd))
		value: (self percent: youngSpaceEnd - oldSpaceEnd / memoryEnd)
		on: html.
	self
		renderLabel: 'Used'
		value: (self printMemory: youngSpaceEnd)
		value: (self percent: youngSpaceEnd / memoryEnd)
		on: html.
	self
		renderLabel: 'Free'
		value: (self printMemory: (memoryEnd - youngSpaceEnd))
		value: (self percent: memoryEnd - youngSpaceEnd / memoryEnd)
		on: html.