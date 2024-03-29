Extension { #name : 'WABasicFormTag' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WABasicFormTag >> turboStreamCallback: aValuable [

	self action:
		((self attributeAt: 'action') copy addField: (self storeCallback:
				  ((WATurboStreamCallback on: aValuable) context: canvas context)))

]
