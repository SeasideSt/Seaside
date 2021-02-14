Class {
	#name : #SUAutocompleterTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'text'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #rendering }
SUAutocompleterTest >> renderContentOn: html [
	| textId |
	textId := html nextId.
	html paragraph: 'Start to type a Smalltalk class-name:'.
	html div: [
		html textInput
			id: textId;
			size: 30;
			value: text;
			callback: [ :value | text := value ].
		html div
			class: 'autocomplete';
			script: (html scriptaculous autocompleter
				element: textId;
				onSelected: (html scriptaculous request
					triggerFormElement: textId);
				on: #renderListOn:for: of: self) ]
]

{ #category : #rendering }
SUAutocompleterTest >> renderListOn: html for: aString [
	| items |
	items := Smalltalk allClasses select: [ :each | each name includesSubstring: aString caseSensitive: false ].
	html unorderedList list: (items first: (items size min: 10))
]

{ #category : #hooks }
SUAutocompleterTest >> style [
	^ 'div.autocomplete {
	position: absolute;
	background-color: white;
	border: 1px solid #888;
	margin: 0px;
	padding: 0px;
	z-index: 1000;
}
div.autocomplete ul, div.autocomplete ul li {
	list-style-type: none;
	line-height: 1.7;
	margin: 0px;
	padding: 0px;
}
div.autocomplete ul li.selected {
	background-color: #ffb;
}'
]
