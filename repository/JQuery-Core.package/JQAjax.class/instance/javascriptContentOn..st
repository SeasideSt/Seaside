printing
javascriptContentOn: aRenderer

	super javascriptContentOn: aRenderer.
	deferredCallbacks ifNil: [ ^ self ].
	deferredCallbacks do: [ :each | each value: aRenderer ]