"
An abstract component that renders an exception stack with temporary variables. Platforms should implement a concrete subclass and register that subclass when it is loaded.

By default this class renders only the top few stack frames, but offers the option to render all. It also offers the option to open a debugger in the image or to proceed with the execution and answers true and false, respectively.


"
Class {
	#name : #WAWalkback,
	#superclass : #WAComponent,
	#instVars : [
		'exception',
		'limit'
	],
	#classVars : [
		'Current'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #registration }
WAWalkback class >> current [
	^ Current
]

{ #category : #registration }
WAWalkback class >> current: aWalkbackClass [
	Current := aWalkbackClass
]

{ #category : #'instance creation' }
WAWalkback class >> exception: anException [
	^ self basicNew initializeWithException: anException; yourself
]

{ #category : #registration }
WAWalkback class >> select [
	self current: self
]

{ #category : #registration }
WAWalkback class >> unselect [
	(self current = self) ifTrue: [ self current: nil ]
]

{ #category : #private }
WAWalkback >> canAnswer [
	^ self decorations anySatisfy: [ :each |
		each isKindOf: WAAnswerHandler ]
]

{ #category : #actions }
WAWalkback >> debug [
	 self answer: true
]

{ #category : #private }
WAWalkback >> debugActionField [
	^ '_debugAction'
]

{ #category : #'accessing-url' }
WAWalkback >> debugUrl [
	^ self urlForDebugAction: '_debug'
]

{ #category : #accessing }
WAWalkback >> defaultLimit [
	"The default number of frames to display in the walkback."
	
	^ 5
]

{ #category : #accessing }
WAWalkback >> exception [
	^ exception
]

{ #category : #accessing }
WAWalkback >> exceptionDescription [
	"Return a short string describing the exception."

	^ String streamContents: [ :stream |
		| e |
		e := self exception.
		stream nextPutAll: e class name.
		e messageText isNil ifFalse: [
			stream nextPutAll: ': '; nextPutAll: e messageText ] ]
]

{ #category : #accessing }
WAWalkback >> frameCount [
	"Return the number of frames or contexts in the walkback."
	
	self subclassResponsibility
]

{ #category : #'accessing-url' }
WAWalkback >> fullStackUrl [
	^ self urlForDebugAction: '_fullStack'
]

{ #category : #initialization }
WAWalkback >> initializeWithException: anException [
	self initialize.
	exception := anException
]

{ #category : #accessing }
WAWalkback >> limit [
	"The maximum number of frames to display."

	^ limit ifNil: [ limit := self defaultLimit min: self frameCount ]
]

{ #category : #accessing }
WAWalkback >> limit: anInteger [
	limit := anInteger
]

{ #category : #actions }
WAWalkback >> proceed [
	 self answer: false
]

{ #category : #'accessing-url' }
WAWalkback >> proceedUrl [
	^ self urlForDebugAction: '_proceed'
]

{ #category : #rendering }
WAWalkback >> renderAnsweringToolsOn: html [
	html anchor
		callback: [ self debug ];
		title: 'Open a debugger in your IDE and block until you hit "Proceed"';
		with: 'Debug'.
	self exception isResumable ifTrue: [
		html space.
		html anchor
			callback: [ self proceed ];
			with: 'Proceed' ].
	self limit < self frameCount ifTrue: [
		html space.
		html anchor
			callback: [ self showFullStack ];
			with: 'Full Stack' ]
]

{ #category : #rendering }
WAWalkback >> renderContentOn: html [
	self renderHeadingOn: html.
	self renderToolsOn: html.
	self renderExceptionOn: html.
	self renderStackOn: html
]

{ #category : #rendering }
WAWalkback >> renderExceptionOn: html [
	| problems |
	problems := self exception seasidePossibleCauses.
	problems isEmpty ifTrue: [ ^ self ].
	html heading level: 3; with: 'Possible Causes'.
	html unorderedList list: problems
]

{ #category : #rendering }
WAWalkback >> renderHeadingOn: html [
	html heading level: 1; with: 'Seaside Walkback'.
	html heading level: 2; with: self exceptionDescription
]

{ #category : #rendering }
WAWalkback >> renderNotAnsweringToolsOn: html [
	html anchor
		url: self debugUrl;
		title: 'Open a debugger in your IDE and block until you hit "Proceed"';
		with: 'Debug'.
	self exception isResumable ifTrue: [
		html space.
		html anchor
			url: self proceedUrl;
			with: 'Proceed' ].
	self limit < self frameCount ifTrue: [
		html space.
		html anchor
			url: self fullStackUrl;
			with: 'Full Stack' ]
]

{ #category : #rendering }
WAWalkback >> renderStackOn: html [
	"Render the walkback itself"
	
	self subclassResponsibility
]

{ #category : #rendering }
WAWalkback >> renderToolsOn: html [
	html paragraph: [
		"Ok, this is hack. This component can either be #call:ed or #render:ed directly (in which case it isn't really a component).
		This it to be used in cases where you can't #call: (eg in the render phase). In that case we just render links without #callback:s.
		However this doesn't work always either (eg. in a POST) so in these cases we #call:."
		self canAnswer
			ifTrue: [ self renderAnsweringToolsOn: html ]
			ifFalse: [ self renderNotAnsweringToolsOn: html ] ]
]

{ #category : #actions }
WAWalkback >> showFullStack [
	self limit: self frameCount
]

{ #category : #updating }
WAWalkback >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self exceptionDescription.
	anHtmlRoot bodyAttributes addClass: 'walkback'.
	WAToolFiles default updateRoot: anHtmlRoot
]

{ #category : #private }
WAWalkback >> urlForDebugAction: aString [
	| copy |
	copy := self requestContext request url copy.
	"We don't use #withField:value: or #addField:value: because we want to replace existing fields, not add to them.
	For example _fullStack may already be present and we want to set _debug."
	copy queryFields at: self debugActionField put: aString.
	^ copy
]
