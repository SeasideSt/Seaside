Extension { #name : 'WAButtonTag' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WAButtonTag >> turboStreamCallback: aValuable [ 

	self name: (self storeCallback: ((WATurboStreamCallback on: aValuable) context: canvas context))

]
