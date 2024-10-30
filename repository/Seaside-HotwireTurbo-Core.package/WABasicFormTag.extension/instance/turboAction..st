*Seaside-HotwireTurbo-Core
turboAction: aString

	(#('replace' 'advance') includes: aString) ifFalse: [ 
		self error: 'Argument for turboAction must be either ''replace'' or ''advance''.' ].
	self dataAttributeAt: 'turbo-action' put: aString