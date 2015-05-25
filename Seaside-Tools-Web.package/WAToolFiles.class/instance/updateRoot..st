updating
updateRoot: anHtmlRoot
	"This is very hacky and removes all styles and scripts that might have been added before. This is done because this library might be temporarily used in the context of an application that adds its own styles that we don't want at the moment a development tool is displayed."
	
	anHtmlRoot headElements: (anHtmlRoot headElements
		reject: [ :each | each isKindOf: WALinkElement ]).
	super updateRoot: anHtmlRoot