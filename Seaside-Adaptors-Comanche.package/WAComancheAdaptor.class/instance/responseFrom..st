converting
responseFrom: aRequestContext 
	| nativeResponse seasideResponse |
	seasideResponse := aRequestContext response.
	seasideResponse isCommitted ifTrue: [
		seasideResponse flush; close.
		^ HttpCommittedResponse new ].
	nativeResponse := HttpResponse new.
	seasideResponse headers keysAndValuesDo: [ :key :value | 
		key = 'Content-Type' 
			ifTrue: [ nativeResponse contentType: value greaseString ]
			ifFalse: [
				nativeResponse 
					fieldAt: key
					put: value greaseString ] ].
	self 
		convertCookiesFrom: seasideResponse
		to: nativeResponse.
	nativeResponse status: (HttpResponse statusSymbolFor: seasideResponse status).
	nativeResponse contents: seasideResponse stream contents readStream.
	^ nativeResponse