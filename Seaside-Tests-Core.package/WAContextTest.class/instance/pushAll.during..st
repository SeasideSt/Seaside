private
pushAll: aCollection during: aBlock
	^ aCollection isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [
			self requestContext
				push: aCollection first
				during: [ self pushAll: aCollection allButFirst during: aBlock ] ]