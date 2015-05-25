attributes
size: aNumber 
	"This attribute tells the user agent the initial width of the widget. The width is given in pixels except when type attribute has the value 'text' or 'password'. In that case, its value refers to the (integer) number of characters."
	self attributes 
		at: 'size'
		put: aNumber