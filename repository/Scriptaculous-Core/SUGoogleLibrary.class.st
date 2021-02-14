Class {
	#name : #SUGoogleLibrary,
	#superclass : #WAFileLibrary,
	#category : 'Scriptaculous-Core-Libraries'
}

{ #category : #updating }
SUGoogleLibrary >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript
		url: 'https://ajax.googleapis.com/ajax/libs/scriptaculous/1.9.0/scriptaculous.js'


]
