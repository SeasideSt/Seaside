enumerating
parentChildPairsDo: aTwoArgumentBlock
	"Evaluate the given two argument block for all the direct parent-child handler pairs in the handler chain up the receiver."
	self parent isNil ifFalse: [
		self parent parentChildPairsDo: aTwoArgumentBlock.
		aTwoArgumentBlock value: self parent value: self ]