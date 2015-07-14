enumerating
handlersDo: aBlock
	self keysAndHandlersDo: [ :key :value | aBlock value: value ]