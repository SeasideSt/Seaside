Class {
	#name : 'WATurboMultiCounter',
	#superclass : 'WAComponent',
	#instVars : [
		'counters',
		'totals'
	],
	#category : 'Seaside-HotwireTurbo-Examples',
	#package : 'Seaside-HotwireTurbo-Examples'
}

{ #category : 'testing' }
WATurboMultiCounter class >> canBeRoot [ 
	^ true
]

{ #category : 'initialization' }
WATurboMultiCounter class >> register [

	(WAAdmin register: self asApplicationAt: '/examples/hotwired/multicounter')
		addLibrary: JQDevelopmentLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation;
		preferenceAt: #renderPhaseContinuationClass put: WATurboRenderPhaseContinuation
]

{ #category : 'hooks' }
WATurboMultiCounter >> children [

	^ counters, { totals }
]

{ #category : 'private' }
WATurboMultiCounter >> createTotalsPresenter [

	^ (WAPluggablePresenter new block: [ :html | 
		html heading
			level: 1;
			with: (counters inject: 0 into:[ :total :c | c counter + total ]) ]) addDecoration: (WATurboFrame newWithId: 'id-total'); yourself
]

{ #category : 'initialization' }
WATurboMultiCounter >> initialize [

	super initialize.
	counters := (1 to: 5) collect: [ :each | 
		WATurboCounter new addDecoration: WATurboFrame new; yourself ].
	totals := self createTotalsPresenter
]

{ #category : 'rendering' }
WATurboMultiCounter >> renderContentOn: html [

	counters
		do: [ :each | html render: each ]
		separatedBy: [ html horizontalRule ].
	html
		horizontalRule;
		horizontalRule.
	html heading
		level: 3;
		with: 'Total:'.
	html render: totals.
	self renderTotalAssignmentFormOn: html
]

{ #category : 'rendering' }
WATurboMultiCounter >> renderTotalAssignmentFormOn: html [

	| theValue |
	html form
		turboAction: 'replace';
		turboStreamCallback: [ :ts | 
			ts replace: 'id-total' with: totals.
			counters do: [ :c | ts replaceComponent: c with: c ] ];
		with: [ 
			html textInput 
				callback: [ :value | theValue := value ].
			html submitButton
				callback: [ self setCountersTo: theValue ] ]
]

{ #category : 'actions' }
WATurboMultiCounter >> setCountersTo: aValue [

	| theValue |
	theValue := Integer readFrom: aValue ifFail: [ 0 ].
	counters do: [ :each | each counter: theValue ]
]

{ #category : 'hooks' }
WATurboMultiCounter >> states [

	^ #()
]

{ #category : 'hooks' }
WATurboMultiCounter >> updateRoot: aRoot [

	super updateRoot: aRoot.
	aRoot meta turboRefreshMethod: 'morph'.
	aRoot meta turboRefreshScroll: 'preserve'
]
