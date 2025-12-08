Extension { #name : 'WASubmitButtonTag' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WASubmitButtonTag >> turboStreamCallback: aValuable [ 

	self name: (self storeCallback: ((WATurboStreamCallback on: aValuable) context: canvas context))

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WASubmitButtonTag >> turboTarget: aString [

	self dataAttributeAt: 'turbo-frame' put: aString

]
