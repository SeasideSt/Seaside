accessing
key
	^ key ifNil: [ key := canvas callbacks store: WADispatchCallback new ]