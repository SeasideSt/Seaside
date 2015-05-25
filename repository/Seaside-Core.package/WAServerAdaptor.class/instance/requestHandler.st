accessing
requestHandler
	"We don't set the instance variable here, if nil, because the default
	request handler may change over time and we want to keep using
	the current default if the user hasn't specified one."
	^ requestHandler ifNil: [ self defaultRequestHandler ]