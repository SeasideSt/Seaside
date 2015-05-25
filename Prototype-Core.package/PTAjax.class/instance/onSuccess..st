events
onSuccess: anObject
	"Invoked when a request completes and its status code is undefined or belongs in the 2xy family. This is skipped if a code-specific callback is defined, and happens before onComplete."

	self optionAt: 'onSuccess' put: anObject asFunction