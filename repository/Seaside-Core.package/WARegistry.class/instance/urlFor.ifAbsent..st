accessing
urlFor: aRequestHandler ifAbsent: absentBlock
	"Return the URL for the given request handler. If the handler is not registered, return
	the result of absentBlock.
	This URL will include the handler's key; if you don't want this, use #url instead."

	| key url |
	key := self keyFor: aRequestHandler ifAbsent: [ ^ absentBlock value ].
	url := self url.
	self trackingStrategy addKey: key toUrl: url.
	^ url