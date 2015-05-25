private
performCallback: anObject
	self hasCallback ifTrue: [ callbackBlock value: anObject ]