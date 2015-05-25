attributes
sourceLanguage: aString
	"The srclang attribute gives the language of the text track data. The value must be a valid BCP 47 language tag. This attribute must be present if the element's kind attribute is in the subtitles state."
	self attributeAt: 'srclang' put: aString