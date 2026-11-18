events
undelegate: aSelectorString on: anEventString
	"Remove a handler from the event for all elements which match the current selector, now or in the future, based upon a specific set of root elements."
	self 
		greaseDeprecatedApi: 'JQueryInstance>>#undelegate:on:'
		details: 'Deprecated in jQuery 3. Prefer the #off... API.'.
	
	self off: anEventString selector: aSelectorString