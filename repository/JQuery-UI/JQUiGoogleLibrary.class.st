Class {
	#name : #JQUiGoogleLibrary,
	#superclass : #WAFileLibrary,
	#category : 'JQuery-UI-Libraries'
}

{ #category : #updating }
JQUiGoogleLibrary >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript
		url: 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js'
]
