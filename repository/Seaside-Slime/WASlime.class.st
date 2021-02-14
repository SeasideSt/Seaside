Class {
	#name : #WASlime,
	#superclass : #Object,
	#classInstVars : [
		'brushSelectors',
		'callbackSelectors',
		'attributeSelectors'
	],
	#category : 'Seaside-Slime'
}

{ #category : #accessing }
WASlime class >> attributeSelectors [
	^ attributeSelectors ifNil: [ attributeSelectors := self findAttributeSelectors ]
]

{ #category : #accessing }
WASlime class >> brushSelectors [
	^ brushSelectors ifNil: [ brushSelectors := self findBrushSelectors ]
]

{ #category : #accessing }
WASlime class >> callbackSelectors [
	^ callbackSelectors ifNil: [ callbackSelectors := self findCallbackSelectors ]
]

{ #category : #testing }
WASlime class >> class: aClass includesBehaviorNamed: aSymbol [
	"In order to avoid static dependencies to classes, we do this check by name."

	^ (Smalltalk includesKey: aSymbol) and: [ aClass includesBehavior: (Smalltalk at: aSymbol) ]
]

{ #category : #private }
WASlime class >> findAttributeSelectors [
	| matcher result |
	matcher := RBParseTreeSearcher new.
	matcher
		matchesAnyOf: #(
			'self addClass: `@value'
			'self addStyle: `@value'
			'self addMedia: `@value'
			'self attributeAt: `@key put: `@value'
			'self attributeAt: `@key ifAbsentPut: `@block'
			'self attributes at: `@key put: `@value'
			'self attributes at: `@key ifAbsentPut: `@block'
			'self attributes at: `@key append: `@value'
			'self attributes at: `@key append: `@value separator: `@separator' )
		do: [ :context :node | true ].
	result := IdentitySet new.
	(self findClasses: #WABrush) , (self findClasses: #WAHtmlElement) do: [ :class | 
		class methodDictionary keysAndValuesDo: [ :selector :method | 
			(matcher executeTree: method parseTree initialAnswer: false) 
				ifTrue: [ result add: selector ] ] ].
	#(callback: enabled: labels:)
		do: [ :each | result add: each ].
	^ result
]

{ #category : #private }
WASlime class >> findBrushSelectors [
	| matcher result |
	matcher := RBParseTreeSearcher new.
	matcher
		matchesAnyMethodOf: #(
			'`selector ^ self tag: `#tag'
			'`selector ^ self brush: `@obj'
			'`selector: `aBlock self `selector with: `aBlock'
			'`selector ^ `class on: self' )
		do: [ :context :node | true ].
	result := IdentitySet new.
	(self findClasses: #WACanvas) do: [ :class | 
		class methodDictionary keysAndValuesDo: [ :selector :method | 
			(matcher executeTree: method parseTree initialAnswer: false) 
				ifTrue: [ result add: selector ] ] ].
	^ result
]

{ #category : #private }
WASlime class >> findCallbackSelectors [
	^ #(callback: callback:json: callback:value: callback:passengers: callbackAccordion: callbackDraggable: callbackDroppable: callbackResizable: callbackSlider: callbackSortable: callbackTabs: defaultAction: html: respond: script: text: triggerArgument:callback: triggerAutocompleter: triggerInPlaceEditor: triggerPassenger: triggerSliderCallback: triggerSortable:callback: triggerTree:callback: multipleValuesCallback:) asIdentitySet
]

{ #category : #private }
WASlime class >> findClasses: aSymbol [
	| class |
	class := Smalltalk classNamed: aSymbol.
	^ class isNil 
		ifTrue: [ #() ]
		ifFalse: [ class withAllSubclasses asArray ]
	
]

{ #category : #initialization }
WASlime class >> initialize [
	GRPlatform current addToStartUpList: self
]

{ #category : #testing }
WASlime class >> isBrushSelector: aString [
	Symbol 
		hasInterned: aString
		ifTrue: [ :symbol | ^ self brushSelectors includes: symbol ].
	^ false
]

{ #category : #testing }
WASlime class >> isCallbackSelector: aString [ 
	Symbol 
		hasInterned: aString
		ifTrue: [ :symbol | ^ self callbackSelectors includes: symbol ].
	^ false
]

{ #category : #testing }
WASlime class >> isWithinCallback: aNode [
	| parent |
	parent := aNode parent 
		ifNil: [ ^ false ].
	(aNode isBlock 
		and: [ parent isMessage 
		and: [ self callbackSelectors includes: parent selector ] ])
			ifTrue: [ ^ true ].
	^ self isWithinCallback: parent
]

{ #category : #initialization }
WASlime class >> startUp [
	brushSelectors := callbackSelectors := attributeSelectors := nil
]
