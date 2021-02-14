"
If you want to see these examples:

/config app:
- add a new application named ""tests""
- choose WAAllFunctionalTests as the root component

"
Class {
	#name : #WAAllFunctionalTests,
	#superclass : #WAComponent,
	#instVars : [
		'classes',
		'current'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #testing }
WAAllFunctionalTests class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WAAllFunctionalTests class >> description [
	^ 'Seaside Functional Test Suite'
]

{ #category : #initialization }
WAAllFunctionalTests class >> initialize [
	(WAAdmin register: self asApplicationAt: 'tests/functional')
		sessionClass: WAExpirySession
]

{ #category : #hooks }
WAAllFunctionalTests >> children [
	^ Array with: current contents
]

{ #category : #hooks }
WAAllFunctionalTests >> initialRequest: aRequest [ 
	super initialRequest: aRequest.
	self requestContext consumer nextIfPresentDo: [ :className | 
		classes do: [ :each | 
			"#greaseString is required because of Symbol <-> String comparison"
			each name greaseString = className ifTrue: [ self selected: each ] ] ]
]

{ #category : #initialization }
WAAllFunctionalTests >> initialize [
	super initialize.
	self initializeTests
]

{ #category : #initialization }
WAAllFunctionalTests >> initializeTests [
	classes := (WAPresenter allSubclasses select: [ :each | each isFunctionalTest ])
				asSortedCollection: [ :a :b | a name < b name ].
	current := WAValueHolder with: classes first new
]

{ #category : #actions }
WAAllFunctionalTests >> next [
	| nextIndex |
	nextIndex := self selectionIndex \\ classes size + 1.
	self selected: (classes at: nextIndex)
]

{ #category : #actions }
WAAllFunctionalTests >> previous [
	| nextIndex |
	nextIndex := (self selectionIndex + classes size - 2 \\ classes size) + 1.
	self selected: (classes at: nextIndex)
]

{ #category : #rendering }
WAAllFunctionalTests >> renderContentOn: html [
	html heading: self class description.
	html form: [
		html paragraph: [
			html anchor
				callback: [ self previous ];
				with: [ html html: '&larr;' ].
			html select
				list: classes;
				onChange: 'submit()';
				selected: self selected;
				labels: [ :value | value name ];
				callback: [ :value | self selected: value ].
			html anchor
				callback: [ self next ];
				with: [ html html: '&rarr;' ].
			html text: ' '; submitButton: 'Restart' ] ].
	html horizontalRule.
	html render: current contents
]

{ #category : #accessing }
WAAllFunctionalTests >> selected [
	^ current contents class
]

{ #category : #accessing }
WAAllFunctionalTests >> selected: aClass [
	current contents: aClass new.
	(current contents respondsTo: #parent:)
		ifTrue: [ current contents parent: self ]
]

{ #category : #private }
WAAllFunctionalTests >> selectionIndex [
	^ classes indexOf: self selected
]

{ #category : #hooks }
WAAllFunctionalTests >> states [
	^ Array with: current
]

{ #category : #updating }
WAAllFunctionalTests >> updateUrl: aUrl [
	super updateUrl: aUrl.
	"class name is a Symbol, using a String makes a big difference for WALotsaLinksFunctionalTest"
	aUrl addToPath: self selected name greaseString
]
