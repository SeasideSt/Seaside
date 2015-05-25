attributes
columns: anInteger 
	"This attribute specifies the visible width in average character widths. User agents may wrap visible text lines to keep long lines visible without the need for scrolling."
	self attributes 
		at: 'cols'
		put: anInteger