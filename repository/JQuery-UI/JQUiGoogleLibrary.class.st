Class {
	#name : #JQUiGoogleLibrary,
	#superclass : #WAFileLibrary,
	#category : 'JQuery-UI-Libraries'
}

{ #category : #updating }
JQUiGoogleLibrary >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript
		url: 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js'
]
