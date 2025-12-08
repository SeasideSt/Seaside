"
I wrap a WACounter and render it.

My main purpose is to serve as a root component of an application that just renders a counter without <html>, <head> and <body>.
"
Class {
	#name : 'WAHeadlessCounter',
	#superclass : 'WAHeadlessComponent',
	#instVars : [
		'counter'
	],
	#category : 'Seaside-WebComponents-Examples',
	#package : 'Seaside-WebComponents-Examples'
}

{ #category : 'testing' }
WAHeadlessCounter class >> canBeRoot [
	^ true
]

{ #category : 'initialization' }
WAHeadlessCounter class >> initialize [
	| application |
	"register such that we do not have the developer tools"
	application := WAAdmin register: WAApplication at: 'examples/headless-counter' in: WAAdmin defaultDispatcher.
	application configuration addParent: WARenderLoopConfiguration instance.
	application
		rootClass: self;
		sessionClass: WASingleContinuationSession;
		preferenceAt: #renderPhaseContinuationClass put: WAFragmentRenderPhaseContinuation;
		preferenceAt: #actionPhaseContinuationClass put: WAWebComponentActionContinuation
]

{ #category : 'hooks' }
WAHeadlessCounter >> children [
	^ Array with: counter
]

{ #category : 'initialization' }
WAHeadlessCounter >> initialize [
	super initialize.
	counter := WACounter new
]

{ #category : 'rendering' }
WAHeadlessCounter >> renderContentOn: html [
	(html tag: 'style') with:
	'h1, a { font-family: monospace }
	'.
	html render: counter
]
