attributes
align: aString
	"This attribute specifies the alignment of data and the justification of text in a cell. Possible values:
	
- left: Left-flush data/Left-justify text. This is the default value for table data.
- center: Center data/Center-justify text. This is the default value for table headers.
- right: Right-flush data/Right-justify text.
- justify: Double-justify text.
- char: Align text around a specific character. If a user agent doesn't support character alignment, behavior in - the presence of this value is unspecified."

	self attributes at: 'align' put: aString