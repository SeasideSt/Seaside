Class {
	#name : 'JQUiGoogleLibrary',
	#superclass : 'WAFileLibrary',
	#category : 'JQuery-UI-Libraries',
	#package : 'JQuery-UI',
	#tag : 'Libraries'
}

{ #category : 'updating' }
JQUiGoogleLibrary >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript
		url: 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js'
]
