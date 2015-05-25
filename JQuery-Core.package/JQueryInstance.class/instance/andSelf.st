chaining
andSelf
	"Add the previous set of elements on the stack to the current set."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#andSelf'
		details: 'Replaced in jQuery 1.9 with addBack. See http://jquery.com/upgrade-guide/1.9/'.	
	self call: 'addBack'