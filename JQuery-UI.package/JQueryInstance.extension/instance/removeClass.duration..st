*jquery-ui-transitions
removeClass: aString duration: aDurationOrString
	"Removes the specified class from the set of matched elements with a optional transition."
	
	self call: 'removeClass' with: aString with: aDurationOrString