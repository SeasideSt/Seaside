Class {
	#name : #JQAjaxFunctionalTest,
	#superclass : #JQFunctionalTest,
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #rendering }
JQAjaxFunctionalTest >> renderContentOn: html [
	html code id: #logger; with: DateAndTime now.
	html paragraph: [
		html submitButton
			onClick: (html jQuery ajax
				script: [ :s | s << (s jQuery: #logger) html: DateAndTime now ]);
			with: 'Replace'.
		html submitButton
			onClick: (html jQuery ajax
				script: [ :s | s << (s jQuery: #logger) prepend: DateAndTime now ]);
			with: 'Prepend'.
		html submitButton
			onClick: (html jQuery ajax
				script: [ :s | s << (s jQuery: #logger) append: DateAndTime now ]);
			with: 'Append' ]
]

{ #category : #accessing }
JQAjaxFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQAjaxFunctionalTest >> title [
	^ 'Ajax and DOM Manipulation'
]
