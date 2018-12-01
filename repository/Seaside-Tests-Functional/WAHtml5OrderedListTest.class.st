Class {
	#name : #WAHtml5OrderedListTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'reversed',
		'start',
		'type'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #initialization }
WAHtml5OrderedListTest >> initialize [
	super initialize.
	reversed := true.
	start := 2.
	type := $I
]

{ #category : #accessing }
WAHtml5OrderedListTest >> items [
	^ #(
		'If Request-URI is an absoluteURI, the host is part of the Request-URI. Any Host header field value in the request MUST be ignored.'
		'If the Request-URI is not an absoluteURI, and the request includes a Host header field, the host is determined by the Host header field value.'
		'If the host as determined by rule 1 or 2 is not a valid host on the server, the response MUST be a 400 (Bad Request) error message.'
	)
]

{ #category : #rendering }
WAHtml5OrderedListTest >> renderConfigurationOn: html [
	html form: [ 
		html paragraph: [
			
			self renderTypeOn: html.
			html space.
			self renderStartOn: html.
			html space.
			self renderReversedOn: html.
			html space.
			html submitButton ] ]
]

{ #category : #rendering }
WAHtml5OrderedListTest >> renderContentOn: html [
	self renderConfigurationOn: html.
	self renderListOn: html
]

{ #category : #rendering }
WAHtml5OrderedListTest >> renderListOn: html [
	html orderedList
		reversed: reversed;
		start: start;
		type: type;
		with: [
			self items do: [ :each |
				html listItem: each ] ]
]

{ #category : #rendering }
WAHtml5OrderedListTest >> renderReversedOn: html [
			
	html checkbox
		id: html nextId;
		value: reversed;
		callback: [ :value | reversed := value ].
	html space.
	html label
		for: html lastId;
		with: 'reversed'
]

{ #category : #rendering }
WAHtml5OrderedListTest >> renderStartOn: html [
	html label
		for: html nextId;
		with: 'start:'.
	html space.
	html numberInput
		value: start;
		callback: [ :value |  [ start := value greaseInteger ] on: Error do: [ :e | "ignore" nil ] ]
]

{ #category : #rendering }
WAHtml5OrderedListTest >> renderTypeOn: html [
	html label
		for: html nextId;
		with: 'type:'.
	html space.
	html select
		id: html lastId;
		list: self types;
		selected: type;
		labels: [ :s | self typesDictionary at: s ];
		callback: [ :value | type:= value ]
]

{ #category : #accessing }
WAHtml5OrderedListTest >> types [
	^ '1aAiI'
]

{ #category : #accessing }
WAHtml5OrderedListTest >> typesDictionary [
	^ Dictionary new
		add: $1 -> 'decimal';
		add: $a -> 'lower-alpha';
		add: $A -> 'upper-alpha';
		add: $i -> 'lower-roman';
		add: $I -> 'upper-roman';
		yourself
]
