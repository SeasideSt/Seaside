private
triggerCallback
	"Ensure that the callback triggers even if the browser does not submit a value."

	self requestContext request
		at: callback key
		ifAbsent: [ callback evaluateWithFieldValues: #() ]