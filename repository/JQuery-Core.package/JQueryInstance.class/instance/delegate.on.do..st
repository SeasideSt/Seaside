events
delegate: aSelectorString on: anEventString do: aHandlerObject
	"Compatibility wrapper for legacy #delegate:on:do:. Emits modern jQuery #on(event, selector, handler)."
	self
		greaseDeprecatedApi: 'JQueryInstance>>#delegate:on:do:'
		details: 'Deprecated in jQuery 3. Prefer the #on... API.'.

	self on: anEventString selector: aSelectorString do: aHandlerObject