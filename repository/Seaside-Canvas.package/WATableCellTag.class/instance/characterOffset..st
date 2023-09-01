attributes
characterOffset: anInteger
	"When present, this attribute specifies the offset to the first occurrence of the alignment character on each line. If a line doesn't include the alignment character, it should be horizontally shifted to end at the alignment position."
	self
		greaseDeprecatedApi: 'WATableCellTag>>characterOffset:'
		details: 'Not supported in html5. https://www.w3docs.com/learn-html/html-td-tag.html'.	
	self attributes at: 'charoff' put: anInteger