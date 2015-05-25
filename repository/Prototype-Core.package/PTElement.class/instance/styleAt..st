styling-styles
styleAt: aString 
	"Returns the given CSS property value of element. property can be specified in either of its CSS or camelized form."
	
	self call: 'getStyle' with: aString