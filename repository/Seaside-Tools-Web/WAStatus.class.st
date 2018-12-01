"
A WAStatus displays various information about state of this system.
"
Class {
	#name : #WAStatus,
	#superclass : #WAComponent,
	#instVars : [
		'navigation'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #'class initialization' }
WAStatus class >> initialize [
	(WAAdmin register: self asApplicationAt: 'status')
		addLibrary: WANavigationFiles
]

{ #category : #hooks }
WAStatus >> children [
	^ Array with: navigation
]

{ #category : #hooks }
WAStatus >> initialRequest: aRequest [ 
	super initialRequest: aRequest.
	self requestContext consumer nextIfPresentDo: [ :className | 
		navigation components do: [ :each | 
			"#greaseString is required because of Symbol <-> String comparison"
			each value class name greaseString = className ifTrue: [ navigation select: each key ] ] ]
]

{ #category : #initialization }
WAStatus >> initialize [
	super initialize.
	navigation := WASimpleNavigation new.
	WAStatusItem sortedConcreteSubinstances do: [ :each |
		each isSupported ifTrue: [
			navigation add: each label: each label ] ].
	navigation selectFirst
]

{ #category : #accessing }
WAStatus >> selected [
	^ navigation selectedComponent
]

{ #category : #updating }
WAStatus >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	self selected notNil 
		ifTrue: [ anHtmlRoot title: self selected title ]
]

{ #category : #updating }
WAStatus >> updateUrl: aUrl [
	super updateUrl: aUrl.
	self selected notNil 
		ifTrue: [ aUrl addToPath: self selected class name ]
]
