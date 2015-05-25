deprecated
elementsByClassName: aString 
	"Fetches all of element's descendants which have a CSS class of className and returns them as an array of extended elements."
	self 
		greaseDeprecatedApi: 'PTElement>>#elementsByClassName:'
		details: 'As of Prototype 1.6, #elementsByClassName: has been deprecated in favor of the more concise #select:.'.
	^ self
		call: 'getElementsByClassName'
			with: aString;
		enumerator