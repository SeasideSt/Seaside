Extension { #name : 'WAComponent' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> renderLazyTurboFrameContentsOn: html [
	"Subclasses can override this to render the placeholder contents for a lazy-loaded turboframe decoration of themselves."
]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboCall: aComponent [

	aComponent addDecoration: (WATurboFrame newWithId: self turboframeDecoration id).
	^ self call: aComponent

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboShow: aComponent [

	^ self turboShow: aComponent onAnswer: [ :value | ]

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboShow: aComponent onAnswer: aBlock [

	aComponent addDecoration: (WATurboFrame newWithId: self turboframeDecoration id).
	^ self show: aComponent onAnswer: aBlock

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboframeDecoration [

	^ self decorations detect:[ :dec | dec isTurboFrame ] ifNone: [ nil ]

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WAComponent >> turboframeId [

	^ self turboframeDecoration id

]
