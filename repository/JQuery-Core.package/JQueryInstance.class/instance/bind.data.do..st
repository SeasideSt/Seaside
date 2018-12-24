events
bind: aString data: aDataObject  do: anObject

	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:do:'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-bind-and-delegate'.
	
	self call: 'bind' with: aString with: aDataObject with: anObject asFunction