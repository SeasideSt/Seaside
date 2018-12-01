Extension { #name : #Object }

{ #category : #'*seaside-core' }
Object >> encodeOn: aDocument [ 
	aDocument print: self greaseString
]

{ #category : #'*seaside-core-document' }
Object >> isConcatenatedHtmlAttributeValue [
	^ false
]

{ #category : #'*seaside-core' }
Object >> labelForSelector: aSymbol [
	^ aSymbol asCapitalizedPhrase
]

{ #category : #'*seaside-core' }
Object >> renderOn: aRenderer [
	"This method is called on all objects passed as an argument to the #render: method of a WARenderer subclass. Override this method to customize how objects render themselves. The default is the return value of #displayString.
	Subclasses of WAPainter (including Components) should override #renderContentOn: and #rendererClass instead."

	aRenderer text: self
]
