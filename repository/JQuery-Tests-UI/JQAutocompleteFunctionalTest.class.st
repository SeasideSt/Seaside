Class {
	#name : 'JQAutocompleteFunctionalTest',
	#superclass : 'JQUiFunctionalTest',
	#instVars : [
		'packages',
		'selectedPackageName'
	],
	#category : 'JQuery-Tests-UI-Functional',
	#package : 'JQuery-Tests-UI',
	#tag : 'Functional'
}

{ #category : 'querying' }
JQAutocompleteFunctionalTest >> packageNamesFor: aString [
	| filtered |
	filtered := self packages
		select: [ :each | each name includesSubstring: aString caseSensitive: false ].
	filtered size > 10
		ifTrue: [ filtered := filtered first: 10 ].
	^ filtered collect: [ :each | each name ]
]

{ #category : 'querying' }
JQAutocompleteFunctionalTest >> packages [
	^ packages ifNil: [ packages := GRPackage grPackages sorted: [ :a :b | a name < b name ] ]
]

{ #category : 'rendering' }
JQAutocompleteFunctionalTest >> renderContentOn: html [

	| showId |
	showId := html nextId.
	
	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a Seaside package name (no callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete sourceCallback: [ :term |
						 self packageNamesFor: term ]) ].

	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a Seaside package name (with callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete
					 search: [ :term | self packageNamesFor: term ]
					 labels: [ :packagename | packagename ]
					 callback: [ :val :s |
						 selectedPackageName := val.
						 s << (s jQuery id: showId) html: [ :r | self renderSelectedPackageNameOn: r ] ]).
		html break.
		html div
			id: showId;
			with: [ self renderSelectedPackageNameOn: html ] ]
]

{ #category : 'rendering' }
JQAutocompleteFunctionalTest >> renderSelectedPackageNameOn: html [

	html text: (selectedPackageName
			 ifNil: [ 'No package name selected' ]
			 ifNotNil: [ selectedPackageName , ' was selected' ])
]

{ #category : 'accessing' }
JQAutocompleteFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : 'accessing' }
JQAutocompleteFunctionalTest >> title [
	^ 'Autocomplete'
]

{ #category : 'accessing' }
JQAutocompleteFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Autocomplete'
]
