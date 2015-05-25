actions
respond: aBlock
	"Evaluate aBlock with the current Response as a parameter and then signal a desire to end request processing and return the Response to the user agent."

	aBlock value: self response.
	self respond