Extension { #name : #Object }

{ #category : #'*Seaside-Core' }
Object >> encodeOn: aDocument [ 
	aDocument print: self greaseString
]

{ #category : #'*Seaside-Core' }
Object >> isConcatenatedHtmlAttributeValue [
	^ false
]

{ #category : #'*Seaside-Core' }
Object >> labelForSelector: aSymbol [
	^ aSymbol asCapitalizedPhrase
]

{ #category : #'*Seaside-Core' }
Object >> renderOn: aRenderer [
	"This method is called on all objects passed as an argument to the #render: method of a WARenderer subclass. Override this method to customize how objects render themselves. The default is the return value of #displayString.
	Subclasses of WAPainter (including Components) should override #renderContentOn: and #rendererClass instead."

	aRenderer text: self
]
