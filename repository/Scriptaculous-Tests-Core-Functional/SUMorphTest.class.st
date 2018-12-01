Class {
	#name : #SUMorphTest,
	#superclass : #SUFunctionalTest,
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #rendering }
SUMorphTest >> renderContentOn: html [
	html div: [
		html textInput
			id: 'rules';
			style: 'width: 75%';
			value: 'margin-left: 120px; height: 140px; font-size: 20pt; width: 360px'.
		html submitButton
			onClick: (html scriptaculous effect
				morph;
				id: 'morph';
				style: (html scriptaculous formElement
					id: 'rules';
					value));
			text: 'Morph' ].
	self renderBox: 'morph' on: html
]
