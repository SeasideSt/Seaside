Class {
	#name : #JQAutocompleteFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'packages'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #querying }
JQAutocompleteFunctionalTest >> packageNamesFor: aString [
	| filtered |
	filtered := self packages
		select: [ :each | each name includesSubstring: aString caseSensitive: false ].
	filtered size > 10
		ifTrue: [ filtered := filtered first: 10 ].
	^ filtered collect: [ :each | each name ]
]

{ #category : #querying }
JQAutocompleteFunctionalTest >> packages [
	^ packages ifNil: [ packages := GRPackage grPackages sorted: [ :a :b | a name < b name ] ]
]

{ #category : #rendering }
JQAutocompleteFunctionalTest >> renderContentOn: html [
	html label
		for: html nextId;
		with: 'Type a Seaside package name:'.
	html break.
	html textInput
		id: html lastId;
		script: (html jQuery this autocomplete
			sourceCallback: [ :term | self packageNamesFor: term ])
]

{ #category : #accessing }
JQAutocompleteFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQAutocompleteFunctionalTest >> title [
	^ 'Autocomplete'
]

{ #category : #accessing }
JQAutocompleteFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Autocomplete'
]
