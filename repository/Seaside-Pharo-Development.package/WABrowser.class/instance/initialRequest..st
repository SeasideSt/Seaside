hooks
initialRequest: aRequest
	| theClass |
	super initialRequest: aRequest.
	aRequest fields at: 'class' ifPresent: [ :className |
		Smalltalk at: className asSymbol ifPresent: [ :class |
			theClass := (aRequest fields includesKey: 'meta')
				ifTrue: [ class class ]
				ifFalse: [ class ].
			self model setClass: theClass selector: nil.
			aRequest fields at: 'method' ifPresent: [ :selector |
				self model setClass: theClass selector: selector asSymbol ] ] ]