Class {
	#name : 'WATurboFramePresenterGuide',
	#superclass : 'WAVisiblePresenterGuide',
	#instVars : [
		'id',
		'renderContext',
		'active'
	],
	#category : 'Seaside-HotwireTurbo-Core',
	#package : 'Seaside-HotwireTurbo-Core'
}

{ #category : 'accessing' }
WATurboFramePresenterGuide >> id: aString [

	id := aString
]

{ #category : 'initialization' }
WATurboFramePresenterGuide >> initialize [

	super initialize.
	active := false
]

{ #category : 'visiting' }
WATurboFramePresenterGuide >> shouldVisitNextPresenterOf: aDecoration [

	^ aDecoration isTurboFrame not and: [ aDecoration isDelegation not ]
]

{ #category : 'visiting' }
WATurboFramePresenterGuide >> visitDecoration: aDecoration [

	(aDecoration isTurboFrame and: [ id = aDecoration id ])
		ifTrue: [ 
			active := true.
			super visitDecoration: aDecoration.
			active := false ]
		ifFalse: [ super visitDecoration: aDecoration ]
]

{ #category : 'visiting' }
WATurboFramePresenterGuide >> visitPainter: aPainter [

	active ifTrue: [ self client visit: aPainter ]
]
