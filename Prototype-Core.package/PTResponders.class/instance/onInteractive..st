events
onInteractive: anObject
	"(Not guaranteed) Triggered whenever the requester receives a part of the response (but not the final part), should it be sent in several packets."

	self optionAt: 'onInteractive' put: anObject asFunction