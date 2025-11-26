printing
javascriptContentOn: aRenderer
	self collection isEmpty
		ifTrue: [ ^ self encodeEmptyOn: aRenderer ].
	self collection size = 1
		ifTrue: [ ^ self encodeElement: self collection first on: aRenderer ].
	aRenderer array: [
		self collection do: [ :each |
			aRenderer value: [
				self encodeElement: each on: aRenderer ] ] ].
	(aRenderer document dotProperty: 'join').
	aRenderer arguments: [ 
		aRenderer string: '&' ]