*jquery-ui-transitions
toggleClass: aString duration: aDurationOrString
	"Adds the specified class if it is not present, removes the specified class if it is present, using a optional transition."
	
	self call: 'toggleClass' with: aString with: aDurationOrString