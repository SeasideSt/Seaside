Class {
	#name : 'JQAutocompleteFunctionalTest',
	#superclass : 'JQUiFunctionalTest',
	#instVars : [
		'packages',
		'countryNames',
		'selectedCountryName'
	],
	#category : 'JQuery-Tests-UI-Functional',
	#package : 'JQuery-Tests-UI',
	#tag : 'Functional'
}

{ #category : 'querying' }
JQAutocompleteFunctionalTest >> countryNames [ 
	
	^ countryNames ifNil: [ countryNames := self listOfCountryNames ]
]

{ #category : 'querying' }
JQAutocompleteFunctionalTest >> countryNamesFor: aString [
	| filtered |
	filtered := self countryNames
		select: [ :each | each includesSubstring: aString caseSensitive: false ].
	filtered size > 10
		ifTrue: [ filtered := filtered first: 10 ].
	^ filtered
]

{ #category : 'rendering' }
JQAutocompleteFunctionalTest >> renderContentOn: html [

	| showId |
	showId := html nextId.
	
	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a country name (no callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete sourceCallback: [ :term | self countryNamesFor: term ]) ].

	html paragraph: [
		html label
			for: html nextId;
			with: 'Type a country name (with callback):'.
		html break.
		html textInput
			id: html lastId;
			script: (html jQuery this autocomplete
					 search: [ :term | self countryNamesFor: term ]
					 labels: [ :countryName | countryName ]
					 callback: [ :val :s |
						 selectedCountryName := val.
						 s << (s jQuery id: showId) html: [ :r | self renderSelectedCountryNameOn: r ] ]).
		html break.
		html div
			id: showId;
			with: [ self renderSelectedCountryNameOn: html ] ]
]

{ #category : 'rendering' }
JQAutocompleteFunctionalTest >> renderSelectedCountryNameOn: html [

	html text: (selectedCountryName
			 ifNil: [ 'No selected country' ]
			 ifNotNil: [ selectedCountryName , ' was selected' ])
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
