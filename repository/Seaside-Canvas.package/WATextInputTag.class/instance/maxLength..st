attributes
maxLength: aNumber 
	"This attribute specifies the maximum number of characters the user may enter. This number may exceed the specified #size:, in which case the user agent should offer a scrolling mechanism. The default value for this attribute is an unlimited number."
	self attributes 
		at: 'maxlength'
		put: aNumber