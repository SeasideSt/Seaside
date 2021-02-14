Class {
	#name : #WARootFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WARootFunctionalTest >> renderContentOn: html [
	html text: 'body{font-size:12px;}'
]

{ #category : #update }
WARootFunctionalTest >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot style: 'body{font-size:12px;}'
]
