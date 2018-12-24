events
undelegate
	"Remove a handler from the event for all elements which match the current selector, now or in the future, based upon a specific set of root elements."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'undelegate'