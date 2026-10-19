events
done: anObject
	"A callback to be invoked when the request succeeds. Mirrors jqXHR.done()."

	self addDeferredCallback: anObject named: 'done'