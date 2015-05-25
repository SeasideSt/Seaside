deprecated
elementsBySelector: aString 
	"Takes an arbitrary number of CSS selectors (strings) and returns a document-order array of extended children of element that match any of them."
	self 
		greaseDeprecatedApi: 'PTElement>>#elementsBySelector:'
		details: 'As of Prototype 1.6, #elementsBySelector: has been deprecated in favor of the more concise #select:.'.
	^ self
		call: 'getElementsBySelector'
			with: aString;
		enumerator