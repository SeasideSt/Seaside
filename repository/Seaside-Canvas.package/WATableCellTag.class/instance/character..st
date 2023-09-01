attributes
character: aString
	"This attribute specifies a single character within a text fragment to act as an axis for alignment. The default value for this attribute is the decimal point character for the current language as set by the lang attribute. User agents are not required to support this attribute."
	self
		greaseDeprecatedApi: 'WATableCellTag>>character:'
		details: 'Not supported in html5. https://www.w3docs.com/learn-html/html-td-tag.html'.	
	self attributes at: 'char' put: aString