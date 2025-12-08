Class {
	#name : 'JQGoogleLibrary',
	#superclass : 'WAFileLibrary',
	#category : 'JQuery-Core-Libraries',
	#package : 'JQuery-Core',
	#tag : 'Libraries'
}

{ #category : 'updating' }
JQGoogleLibrary >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript
		url: 'https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'
]
