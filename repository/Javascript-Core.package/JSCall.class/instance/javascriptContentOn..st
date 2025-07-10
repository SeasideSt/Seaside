printing
javascriptContentOn: aRenderer
	super javascriptContentOn: aRenderer.
	self name isEmptyOrNil ifFalse: [
		aRenderer document dotProperty: self name ].
	aRenderer arguments: [ 
		self argumentsDo: [ :each |
			aRenderer argument: each ] ]