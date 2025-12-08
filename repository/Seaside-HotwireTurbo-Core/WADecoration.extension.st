Extension { #name : 'WADecoration' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WADecoration >> isTurboFrame [

	^ false

]

{ #category : '*Seaside-HotwireTurbo-Core' }
WADecoration >> renderLazyTurboFrameContentsOn: html [

	self next renderLazyTurboFrameContentsOn: html
]
