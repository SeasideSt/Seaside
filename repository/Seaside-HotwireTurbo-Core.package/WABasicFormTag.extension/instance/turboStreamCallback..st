*Seaside-HotwireTurbo-Core
turboStreamCallback: aValuable

	self action:
		((self attributeAt: 'action') copy addField: (self storeCallback:
				  ((WATurboStreamCallback on: aValuable) context: canvas context)))
