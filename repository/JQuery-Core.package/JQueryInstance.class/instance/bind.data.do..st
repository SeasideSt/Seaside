events
bind: aString data: aDataObject  do: anObject

	self 
		greaseDeprecatedApi: 'JQueryInstance>>#bind:data:do:'
		details: 'Deprecated in jQuery 3. Prefer the #on... API.'.
	
	self on: aString data: aDataObject do: anObject