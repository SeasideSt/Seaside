*Seaside-HotwireTurbo
turboAction: aString
	(#('replace' 'advance') includes: aString) ifFalse: [ 
		self error. ].
	self dataAttributeAt: 'turbo-action' put: aString