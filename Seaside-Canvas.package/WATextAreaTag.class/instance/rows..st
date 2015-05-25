attributes
rows: anInteger 
	"This attribute specifies the number of visible text lines. If more are entered, the widget scrolls."
	self attributes 
		at: 'rows'
		put: anInteger