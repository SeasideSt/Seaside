events
onFailure: anObject
	"Invoked when a request completes and its status code exists but is not in the 2xy family. This is skipped if a code-specific callback is defined, and happens before onComplete."

	self optionAt: 'onFailure' put: anObject asFunction