private
ifResetPossible: aBlock
	self response resetIfPossible ifTrue: [
		aBlock value ]