options
easing: aString
	"The name of the easing effect that you want to use (plugin required). There are two built-in values, linear and swing."
	
	self optionAt: 'easing' put: aString
