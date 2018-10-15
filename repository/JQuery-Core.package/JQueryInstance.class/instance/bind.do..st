events
bind: aString do: anObject 

	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'bind' with: aString with: anObject asFunction