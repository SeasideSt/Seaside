Class {
	#name : #SUAccordion,
	#superclass : #SUNavigation,
	#instVars : [
		'visible',
		'maxVisible'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUAccordion >> cssClass [
	^ 'accordion'
]

{ #category : #actions }
SUAccordion >> hide: anElement [
	self visible remove: anElement ifAbsent: [ ]
]

{ #category : #initialization }
SUAccordion >> initialize [
	super initialize.
	visible := OrderedCollection new.
	maxVisible := 1
]

{ #category : #testing }
SUAccordion >> isVisible: aComponent [
	^ self visible includes: aComponent
]

{ #category : #accessing }
SUAccordion >> maxVisible [
	^ maxVisible
]

{ #category : #accessing }
SUAccordion >> maxVisible: anInteger [
	maxVisible := anInteger
]

{ #category : #rendering }
SUAccordion >> renderBody: anElement index: anInteger visible: aBoolean on: html [
	(self isVisible: anElement)
		ifFalse: [ ^ self ].
	html definitionData
		id: (self uid: 'body' at: anInteger);
		style: (aBoolean ifFalse: [ 'display: none' ]);
		with: anElement
]

{ #category : #rendering }
SUAccordion >> renderHead: anElement index: anInteger on: html [
	html definitionTerm 
		id: (self uid: 'head' at: anInteger); 
		class: 'active' if: (self isVisible: anElement);
		with: [
			html anchor
				onClick: (html prototype evaluator
					callback: [ :script | self scriptToggle: anElement on: script ];
					return: false);
				callback: [ self toggle: anElement ];
				with: anElement label ]
]

{ #category : #rendering }
SUAccordion >> renderNavigationOn: html [ 
	html definitionList class: self cssClass; with: [
		items keysAndValuesDo: [ :index :element | 
			self renderHead: element index: index on: html.
			self renderBody: element index: index visible: true on: html ] ]
]

{ #category : #scripting }
SUAccordion >> scriptHide: anElement on: aScript [
	| index |
	index := self findIndex: anElement ifAbsent: [ ^ self ].
	aScript scriptaculous effect
		id: (self uid: 'body' at: index);
		onAfterFinish: (PTElement new
						id: (self uid: 'body' at: index); 
						remove);
		duration: 0.2;
		blindUp.
	aScript prototype element
		id: (self uid: 'head' at: index);
		removeClassName: 'active'
		
	

]

{ #category : #scripting }
SUAccordion >> scriptShow: anElement on: aScript [
	| index |
	index := self findIndex: anElement ifAbsent: [ ^ self ].
	aScript prototype element
		id: (self uid: 'head' at: index);
		insertAfter: [ :html | 
			self 
				renderBody: anElement index: index
				visible: false on: html ].
	aScript scriptaculous effect
		id: (self uid: 'body' at: index);
		duration: 0.2;
		blindDown.
	aScript prototype element
		id: (self uid: 'head' at: index);
		addClassName: 'active'
]

{ #category : #scripting }
SUAccordion >> scriptToggle: anElement on: aScript [
	| previous |
	previous := self visible copy.
	self toggle: anElement.
	(previous difference: self visible)
		do: [ :each | self scriptHide: each on: aScript ].
	(self visible difference: previous)
		do: [ :each | self scriptShow: each on: aScript ]
]

{ #category : #delegation }
SUAccordion >> show: anElement [
	self visible addLast: anElement.
	self maxVisible isNil ifFalse: [
		[ self maxVisible < self visible size ]
			whileTrue: [ self hide: self visible first ] ]
]

{ #category : #actions }
SUAccordion >> toggle: anElement [
	(self isVisible: anElement)
		ifTrue: [ self hide: anElement ]
		ifFalse: [ self show: anElement ]
]

{ #category : #accessing }
SUAccordion >> visible [
	^ visible
]
