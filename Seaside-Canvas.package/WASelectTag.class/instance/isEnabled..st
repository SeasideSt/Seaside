testing
isEnabled: anObject
	"Test if anObject is enabled."

 	^ enabledBlock isNil or: [ enabledBlock value: anObject ]