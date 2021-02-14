"
I am an implementation of Browser using RPackage and reflection.
"
Class {
	#name : #WARPackageBasedBrowser,
	#superclass : #WAObject,
	#instVars : [
		'showComment',
		'showInstance',
		'selectedPackage',
		'selectedClass',
		'selectedMessageCategory',
		'dependent',
		'selectedMethod'
	],
	#category : 'Seaside-Pharo-Development-Core'
}

{ #category : #accessing }
WARPackageBasedBrowser >> addDependent: anObject [
	dependent := anObject
]

{ #category : #private }
WARPackageBasedBrowser >> changed: aParameter [
	dependent isNil ifFalse: [ dependent update: aParameter ]
]

{ #category : #accessing }
WARPackageBasedBrowser >> classList [
	^ (self classesInTheSelectedPackage
		collect: [ :each | each name ])
		sorted
]

{ #category : #accessing }
WARPackageBasedBrowser >> classListIndex [
	^ (self classesInTheSelectedPackage
		sorted: [ :a :b | a name <= b name ])
		indexOf: selectedClass
]

{ #category : #accessing }
WARPackageBasedBrowser >> classListIndex: anInteger [
	selectedClass := ((self classesInTheSelectedPackage
		sorted: [ :a :b | a name <= b name ])
		at: anInteger).
	self clearMessageAndProtoclSelection.
	self changed: #classListIndex
]

{ #category : #private }
WARPackageBasedBrowser >> classesInTheSelectedPackage [

	^ selectedPackage
		ifNil:[ #() ]
		ifNotNil:[ selectedPackage classes ]
]

{ #category : #private }
WARPackageBasedBrowser >> clearMessageAndProtoclSelection [
	selectedMethod := nil.
	selectedMessageCategory := nil
]

{ #category : #accessing }
WARPackageBasedBrowser >> contents [
	^ showComment
		ifTrue: [ 
			self selectedClass isNil
				ifTrue: [ '' ]
				ifFalse: [
					"class comment"
					selectedClass organization comment ] ]
		ifFalse: [ 
			selectedMethod isNil
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
					selectedMethod sourceCode ] ]
]

{ #category : #accessing }
WARPackageBasedBrowser >> contents: input notifying: aController [
	^ showComment
		ifTrue: [
			selectedClass organization comment: input.
			true ]
		ifFalse: [
			(self selectedMessageName isNil and: [ selectedMessageCategory isNil ])
				ifTrue: [
					"compile a class"
					selectedClass subclassDefinerClass
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
WARPackageBasedBrowser >> indicateClassMessages [
	showInstance := false.
	showComment := false.
	self clearMessageAndProtoclSelection.
	self changed: #show
]

{ #category : #actions }
WARPackageBasedBrowser >> indicateInstanceMessages [
	showInstance := true.
	showComment := false.
	self clearMessageAndProtoclSelection.
	self changed: #show
]

{ #category : #initialization }
WARPackageBasedBrowser >> initialize [
	super initialize.
	showComment := false.
	showInstance := true
]

{ #category : #accessing }
WARPackageBasedBrowser >> messageCategoryList [
	| all categories unclassified |
	all := #'-- all --'. "AllProtocol defaultName is fucked in Pharo 2.0"
	self selectedClass isNil
		ifTrue: [ ^ Array with: all ].
	categories := self selectedClass organization categories.
	(categories notEmpty and: [ categories first = all ]) ifFalse: [ "all is only in 3.0+"
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
WARPackageBasedBrowser >> messageCategoryListIndex [
	^ self messageCategoryList indexOf: selectedMessageCategory
]

{ #category : #accessing }
WARPackageBasedBrowser >> messageCategoryListIndex: anInteger [
	selectedMessageCategory := self messageCategoryList at: anInteger.
	selectedMethod := nil.
	self changed: #messageCategoryListIndex
]

{ #category : #accessing }
WARPackageBasedBrowser >> messageList [
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
WARPackageBasedBrowser >> messageListIndex [
	^ selectedMethod isNil
		ifTrue: [ 0 ]
		ifFalse: [ self messageList indexOf: selectedMethod selector ]
]

{ #category : #accessing }
WARPackageBasedBrowser >> messageListIndex: anInteger [
	selectedMethod := self selectedClass >> (self messageList at: anInteger).
	self changed: #messageListIndex
]

{ #category : #accessing }
WARPackageBasedBrowser >> metaClassIndicated [
	^ showInstance
]

{ #category : #private }
WARPackageBasedBrowser >> packages [
	^ (Smalltalk at: #RPackage) organizer packages
]

{ #category : #private }
WARPackageBasedBrowser >> parentOfClass: aClass [
	"I can answer an RPackage or an RPackageTag, depending on the presence of Tags in package. 
	 This is an UI optimization to not show a tree RPackage->RPackageTag when there is just 
	 one tag in package, named in the same way as his parent"	

	| package tag |
	
	package := aClass package.
	tag := package classTagForClass: aClass.
	
	^ (((tag name = package name) and: [ package classTags size <= 1 ]) or: [ tag isNil ])
		ifTrue: [ package ]
		ifFalse: [ tag ]
]

{ #category : #actions }
WARPackageBasedBrowser >> plusButtonHit [
	showComment := true.
	self clearMessageAndProtoclSelection.
	self changed: #show
]

{ #category : #accessing }
WARPackageBasedBrowser >> protocolForSelectedMethod [
	| selectedMessageName |
	selectedMessageName := self selectedMessageName.
	selectedMessageName isNil ifTrue: [ 
		^ selectedMessageCategory ifNil: [ #'-- all --' ] "AllProtocol defaultName is fucked in Pharo 2.0" ].
	^ (self selectedClass >> selectedMessageName asSymbol) category
]

{ #category : #accessing }
WARPackageBasedBrowser >> removeDependent: anObject [
	dependent := nil
]

{ #category : #private }
WARPackageBasedBrowser >> selectedClass [
	| class |
	class := selectedClass.
	(class notNil and: [ showInstance not ]) ifTrue: [ 
		class := class theMetaClass ].
	^ class
]

{ #category : #accessing }
WARPackageBasedBrowser >> selectedMessageName [
	^ selectedMethod isNil
		ifTrue: [ nil ]
		ifFalse: [ selectedMethod selector ]
]

{ #category : #accessing }
WARPackageBasedBrowser >> setClass: aClass selector: aSelector [
	| method protocol |
	method := aClass methodDict at: aSelector ifAbsent: [ nil ].
	protocol := method ifNil: [ nil ] ifNotNil: [ method protocol ].
	selectedPackage := self parentOfClass: aClass.
	selectedClass := aClass.
	showInstance := aClass isMeta not.
	selectedMessageCategory := protocol.
	selectedMethod := method
]

{ #category : #accessing }
WARPackageBasedBrowser >> systemCategoryList [
	^ (self packages
		collect: [ :each | each packageName ])
		sorted
]

{ #category : #accessing }
WARPackageBasedBrowser >> systemCategoryListIndex [
	^ (self packages
		sorted: [ :a :b | a packageName <= b packageName ])
		indexOf: selectedPackage
]

{ #category : #accessing }
WARPackageBasedBrowser >> systemCategoryListIndex: anInteger [
	selectedPackage := ((self packages
		sorted: [ :a :b | a packageName <= b packageName ]) at: anInteger).
	selectedClass := nil.
	self clearMessageAndProtoclSelection.
	self changed: #systemCategoryListIndex
]
