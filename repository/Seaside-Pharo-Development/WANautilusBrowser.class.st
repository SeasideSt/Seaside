"
A WANautilusBrowser is an implementation of Browser using Nautilus.

Instance Variables
	nautilus:		<Nautilus>

nautilus
	- the nautilus instance to delegate to

"
Class {
	#name : #WANautilusBrowser,
	#superclass : #WAObject,
	#instVars : [
		'nautilus',
		'selectedMessageCategory',
		'dependent'
	],
	#category : 'Seaside-Pharo-Development-Core'
}

{ #category : #accessing }
WANautilusBrowser >> addDependent: anObject [
	dependent := anObject
]

{ #category : #private }
WANautilusBrowser >> changed: aParameter [
	dependent isNil ifFalse: [ dependent update: aParameter ]
]

{ #category : #accessing }
WANautilusBrowser >> classList [
	^ (self classesInTheSelectedPackage
		collect: [ :each | each name ])
		sorted
]

{ #category : #accessing }
WANautilusBrowser >> classListIndex [
	^ (self classesInTheSelectedPackage
		sorted: [ :a :b | a name <= b name ])
		indexOf: nautilus selectedClass
]

{ #category : #accessing }
WANautilusBrowser >> classListIndex: anInteger [
	nautilus selectedClass: ((self classesInTheSelectedPackage
		sorted: [ :a :b | a name <= b name ])
		at: anInteger).
	self clearMessageAndProtoclSelection.
	self changed: #classListIndex
]

{ #category : #private }
WANautilusBrowser >> classesInTheSelectedPackage [

	^ nautilus selectedPackage
		ifNil:[ { } ]
		ifNotNil:[ nautilus selectedPackage classes ]
]

{ #category : #private }
WANautilusBrowser >> clearMessageAndProtoclSelection [
	nautilus selectedMethod: nil.
	selectedMessageCategory := nil
]

{ #category : #accessing }
WANautilusBrowser >> contents [
	^ nautilus showComment
		ifTrue: [ 
			self selectedClass isNil
				ifTrue: [ '' ]
				ifFalse: [
					"class comment"
					nautilus selectedClass organization comment ] ]
		ifFalse: [ 
			nautilus selectedMethod isNil
				ifTrue: [
					self selectedClass isNil
						ifTrue: [ '' ]
						ifFalse: [
							selectedMessageCategory isNil
								ifTrue: [
									"class definition"
									self selectedClass definition ]
								ifFalse: [
									"method template"
									self selectedClass sourceCodeTemplate ] ] ]
				ifFalse: [
					"method source code"
					nautilus selectedMethod sourceCode ] ]
]

{ #category : #accessing }
WANautilusBrowser >> contents: input notifying: aController [
	^ nautilus showComment
		ifTrue: [
			nautilus selectedClass organization comment: input.
			true ]
		ifFalse: [
			(self selectedMessageName isNil and: [ selectedMessageCategory isNil ])
				ifTrue: [
					"compile a class"
					nautilus selectedClass subclassDefinerClass
						evaluate: input
						notifying: aController
						logged: true ]
				ifFalse: [
					"compile a method"
					 (self selectedClass
						compile: input
						classified: self protocolForSelectedMethod
						notifying: aController) isSymbol ] ]
]

{ #category : #actions }
WANautilusBrowser >> indicateClassMessages [
	nautilus showInstance: false.
	nautilus showComment: false.
	self clearMessageAndProtoclSelection.
	self changed: #show
]

{ #category : #actions }
WANautilusBrowser >> indicateInstanceMessages [
	nautilus showInstance: true.
	nautilus showComment: false.
	self clearMessageAndProtoclSelection.
	self changed: #show
]

{ #category : #initialization }
WANautilusBrowser >> initialize [
	super initialize.
	nautilus := (Smalltalk at: #Nautilus) new
]

{ #category : #accessing }
WANautilusBrowser >> messageCategoryList [
	| all categories unclassified |
	all := #'-- all --'. "AllProtocol defaultName is fucked in Pharo 2.0"
	self selectedClass isNil
		ifTrue: [ ^ Array with: all ].
	categories := self selectedClass organization categories.
	categories first = all ifFalse: [ "all is only in 3.0+"
		categories := (Array with: all), categories ].
	unclassified := (Smalltalk at: #Protocol) defaultName. "#unclassified only in 3.0+"
	^ (categories includes: unclassified)
		ifTrue: [
			"'-- all --', 'as yet unclassified', rest sorted alphabetically"
			(Array
				with: categories first
				with: unclassified),
			(categories allButFirst copyWithout: unclassified) sorted ]
		ifFalse: [
			"'-- all --', rest sorted alphabetically"
			(Array with: categories first),
			categories allButFirst sorted ]
]

{ #category : #accessing }
WANautilusBrowser >> messageCategoryListIndex [
	^ self messageCategoryList indexOf: selectedMessageCategory
]

{ #category : #accessing }
WANautilusBrowser >> messageCategoryListIndex: anInteger [
	selectedMessageCategory := self messageCategoryList at: anInteger.
	nautilus selectedMethod: nil.
	self changed: #messageCategoryListIndex
]

{ #category : #accessing }
WANautilusBrowser >> messageList [
	^ (selectedMessageCategory isNil
		ifTrue: [
			self selectedClass isNil
				ifTrue: [ #() ]
				ifFalse: [ self selectedClass selectors ] ]
		ifFalse: [
			| organization organizer |
			organization := self selectedClass organization.
			organizer := (organization respondsTo: #protocolOrganizer) "Only in Pharo 3.0+"
				ifTrue: [ organization protocolOrganizer ]
				ifFalse: [
					| classOrganization |
					classOrganization := Smalltalk globals class name hasClassNamed: 'ClassOrganization'.
					(classOrganization importFrom: self selectedClass organization) protocolOrganizer ].
			organizer methodsInProtocolNamed: selectedMessageCategory ]) sorted
]

{ #category : #accessing }
WANautilusBrowser >> messageListIndex [
	^ nautilus selectedMethod isNil
		ifTrue: [ 0 ]
		ifFalse: [ self messageList indexOf: nautilus selectedMethod selector ]
]

{ #category : #accessing }
WANautilusBrowser >> messageListIndex: anInteger [
	nautilus selectedMethod: self selectedClass >> (self messageList at: anInteger).
	self changed: #messageListIndex
]

{ #category : #accessing }
WANautilusBrowser >> metaClassIndicated [
	^ nautilus showInstance
]

{ #category : #actions }
WANautilusBrowser >> plusButtonHit [
	nautilus showComment: true.
	self clearMessageAndProtoclSelection.
	self changed: #show
]

{ #category : #accessing }
WANautilusBrowser >> protocolForSelectedMethod [
	| selectedMessageName |
	selectedMessageName := self selectedMessageName.
	selectedMessageName isNil ifTrue: [ 
		^ selectedMessageCategory ifNil: [ #'-- all --' ] "AllProtocol defaultName is fucked in Pharo 2.0" ].
	^ (self selectedClass >> selectedMessageName asSymbol) category
]

{ #category : #accessing }
WANautilusBrowser >> removeDependent: anObject [
	dependent := nil
]

{ #category : #private }
WANautilusBrowser >> selectedClass [
	| selectedClass |
	selectedClass := nautilus selectedClass.
	(selectedClass notNil and: [ nautilus showInstance not ]) ifTrue: [ 
		selectedClass := selectedClass theMetaClass ].
	^ selectedClass
]

{ #category : #accessing }
WANautilusBrowser >> selectedMessageName [
	^ nautilus selectedMethod isNil
		ifTrue: [ nil ]
		ifFalse: [ nautilus selectedMethod selector ]
]

{ #category : #accessing }
WANautilusBrowser >> setClass: aClass selector: aSelector [
	nautilus setClass: aClass selector: aSelector 
]

{ #category : #accessing }
WANautilusBrowser >> systemCategoryList [
	^ (nautilus packages
		collect: [ :each | each packageName ])
		sorted
]

{ #category : #accessing }
WANautilusBrowser >> systemCategoryListIndex [
	^ (nautilus packages
		sorted: [ :a :b | a packageName <= b packageName ])
		indexOf: nautilus selectedPackage
]

{ #category : #accessing }
WANautilusBrowser >> systemCategoryListIndex: anInteger [
	nautilus selectedPackage: ((nautilus packages
		sorted: [ :a :b | a packageName <= b packageName ]) at: anInteger).
	nautilus selectedClass: nil.
	self clearMessageAndProtoclSelection.
	self changed: #systemCategoryListIndex
]
