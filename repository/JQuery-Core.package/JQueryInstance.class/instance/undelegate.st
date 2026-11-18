events
undelegate
	"Remove all delegated event handlers from the selected elements."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#undelegate'
		details: 'Deprecated in jQuery 3. Prefer the #off... API.'.
	
	self call: 'off' with: (JSStream on: 'undefined') with: '**'