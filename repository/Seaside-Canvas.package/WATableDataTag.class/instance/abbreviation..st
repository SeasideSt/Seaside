attributes
abbreviation: aString
	"This attribute should be used to provide an abbreviated form of the cell's content, and may be rendered by user agents when appropriate in place of the cell's content. Abbreviated names should be short since user agents may render them repeatedly. For instance, speech synthesizers may render the abbreviated headers relating to a particular cell before rendering that cell's content."
	self
		greaseDeprecatedApi: 'WATableDateTag>>abbreviation:'
		details: 'Use text that begins in an unambiguous and terse manner, and include any more elaborate text after that. https://www.w3docs.com/learn-html/html-td-tag.html'.		
	self attributes at: 'abbr' put: aString