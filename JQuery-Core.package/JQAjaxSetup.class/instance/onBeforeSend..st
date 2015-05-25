events
onBeforeSend: anObject
	"A pre-callback to modify the XMLHttpRequest object before it is sent. Use this to set custom headers etc. The XMLHttpRequest is passed as the only argument."
	
	self optionAt: 'beforeSend' put: anObject asFunction