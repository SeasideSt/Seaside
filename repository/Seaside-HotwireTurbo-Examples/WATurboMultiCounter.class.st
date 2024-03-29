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

	(WAAdmin register: self asApplicationAt: '/examples/turbo/multicounter')
		addLibrary: JQDevelopmentLibrary;
		preferenceAt: #actionPhaseContinuationClass put: WATurboCallbackProcessingActionContinuation
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
	counters := (1 to: 5) collect: [ :each | WATurboCounter new addDecoration: WATurboFrame new; yourself ].
	totals := self createTotalsPresenter
]

{ #category : 'rendering' }
WATurboMultiCounter >> renderContentOn: html [

	self renderTurboScriptOn: html.
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
		turboStreamCallback: [ :ts | ts replace: 'id-total' with: totals ];
		with: [ 
			html textInput 
				callback: [ :value | theValue := value ].
			html submitButton
				callback: [ self setCountersTo: theValue ] ]
]

{ #category : 'rendering' }
WATurboMultiCounter >> renderTurboScriptOn: html [

	html script 
		type: 'module';
		"with:'import hotwiredTurbo from ''https://cdn.skypack.dev/@hotwired/turbo'';'"
		with: 'import * as Turbo from ''',(WATurboFileLibrary / #turboes2017esmJs) greaseString,''';'

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
