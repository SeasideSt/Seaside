events
onCreate: anObject
	"onCreate is only available to responders, as it wouldn't make a lot of sense to individual requests: you do know when your code creates them, don't you?"

	self optionAt: 'onCreate' put: anObject asFunction