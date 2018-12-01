Class {
	#name : #JQDialogFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQDialogFunctionalTest >> renderContentOn: html [
	self renderWindowOn: html.
	self renderLightboxOn: html
]

{ #category : #utilities }
JQDialogFunctionalTest >> renderDialog: aString on: html [
	html paragraph: [ html text: 'This is a '; text: aString; text: '.' ]
]

{ #category : #rendering }
JQDialogFunctionalTest >> renderLightboxOn: html [
	| id |
	html div
		id: (id := html nextId);
		script: (html jQuery new dialog
			html: JQCounterFunctionalTest new;
			title: 'Lightbox Dialog';
			resizable: false;
			modal: true).
	html submitButton
		onClick: (html jQuery id: id) dialog open;
		with: 'Open Lightbox'
]

{ #category : #rendering }
JQDialogFunctionalTest >> renderWindowOn: html [
	| id |
	html div
		id: (id := html nextId);
		script: (html jQuery new dialog
			title: 'Vegetables';
			autoOpen: false;
			addButton: 'Close' do: html jQuery new dialog close);
		with: [ html unorderedList list: self vegetables ].
	html submitButton
		onClick: (html jQuery id: id) dialog open;
		with: 'Open Window'.
	html submitButton
		onClick: (html jQuery id: id) dialog close;
		with: 'Close Window'
]

{ #category : #accessing }
JQDialogFunctionalTest >> selectors [
	^ #(renderWindowOn: renderLightboxOn:)
]

{ #category : #accessing }
JQDialogFunctionalTest >> title [
	^ 'Dialog Widget'
]

{ #category : #accessing }
JQDialogFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Dialog'
]
