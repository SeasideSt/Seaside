events
fail: anObject
	"A callback to be invoked when the request fails. Mirrors jqXHR.fail()."

	self addDeferredCallback: anObject named: 'fail'