events
unbind: aString
	"Remove a previously-attached event handler from the elements."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'unbind' with: aString