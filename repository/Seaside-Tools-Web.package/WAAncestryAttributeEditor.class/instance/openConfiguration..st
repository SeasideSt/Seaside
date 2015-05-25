actions
openConfiguration: aConfiguration 
	aConfiguration isNil ifFalse: [
		aConfiguration isShared ifTrue: [
			self show: aConfiguration configurationComponent ] ]