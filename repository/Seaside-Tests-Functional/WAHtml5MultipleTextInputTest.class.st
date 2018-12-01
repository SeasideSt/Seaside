Class {
	#name : #WAHtml5MultipleTextInputTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'emails'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAHtml5MultipleTextInputTest >> renderContentOn: html [
	self renderEmailsOn: html.
	self renderFormOn: html
]

{ #category : #rendering }
WAHtml5MultipleTextInputTest >> renderEmailsOn: html [
	emails isNil ifTrue: [ ^ self ].
	html unorderedList
		list: emails
]

{ #category : #rendering }
WAHtml5MultipleTextInputTest >> renderFormOn: html [
	html form: [
		html label: [
			html text: 'CC: '.
			html emailInput
				listId: 'contacts';
				multipleValuesCallback: [ :values |
					emails := values ] ].
		html datalist id: 'contacts'; with:  [
			html option: 'hedral@damowmow.com'.
			html option: 'pillar@example.com'.
			html option: 'astrophy@cute.example'.
			html option: 'astronomy@science.example.org' ].
		html submitButton ]
]
