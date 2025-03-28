*Seaside-HotwireTurbo-Core
turboStreamCallback: aValuable

	self dataAttributeAt: 'turbo-stream' put: true.
	self url addField: (self storeCallback: ((WATurboStreamCallback on: aValuable) context: canvas context))