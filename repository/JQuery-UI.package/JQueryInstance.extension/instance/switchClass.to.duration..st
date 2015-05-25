*jquery-ui-transitions
switchClass: firstClassString to: secondClassString duration: aDurationOrString
	"Switches from the class defined in the first argument to the class defined as second argument, using a optional transition."
	
	self call: 'switchClass' with: firstClassString with: secondClassString with: aDurationOrString