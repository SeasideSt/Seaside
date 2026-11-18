events
delegate: aSelectorString on: anEventString data: aDataObject do: aHandlerObject
	"Compatibility wrapper for legacy #delegate:on:data:do:. Emits modern jQuery #on(event, selector, data, handler)."
	self
		greaseDeprecatedApi: 'JQueryInstance>>#delegate:on:data:do:'
		details: 'Deprecated in jQuery 3. Prefer the #on... API.'.

	self on: anEventString selector: aSelectorString data: aDataObject do: aHandlerObject