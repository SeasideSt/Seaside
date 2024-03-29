Extension { #name : 'WAComponent' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboCall: aComponent [

	aComponent addDecoration: (WATurboFrame newWithId: self turboframeDecoration id).
	^ self call: aComponent

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboframeDecoration [

	^ self decorations detect:[ :dec | dec isTurboFrame ] ifNone: [ nil ]

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboframeId [

	^ self turboframeDecoration id

]
