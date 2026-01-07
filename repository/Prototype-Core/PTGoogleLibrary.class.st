Class {
	#name : 'PTGoogleLibrary',
	#superclass : 'WAFileLibrary',
	#category : 'Prototype-Core-Libraries',
	#package : 'Prototype-Core',
	#tag : 'Libraries'
}

{ #category : 'updating' }
PTGoogleLibrary >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript
		url: 'https://ajax.googleapis.com/ajax/libs/prototype/1.7.3.0/prototype.js'
]
