private
hasSession: aRequestContext
	| handler key |
	handler := self handler.
	key := handler trackingStrategy keyFromContext: aRequestContext.
	^ key notNil and: [
		"make sure the session is not expired"
		(handler cache at: key ifAbsent: [ nil ]) notNil ]