rendering
renderEditMemoryParameterAt: anInteger named: aString on: html
	| parameter |
	parameter := SmalltalkImage current vmParameterAt: anInteger.
	self
		renderLabel: aString
		value: [
			html render: (self printMemory: parameter).
			self
				renderEditVMParameterAt: anInteger
				callback: [ self editMemoryVMParameterAt: anInteger named: aString ]
				on: html ]
		on: html