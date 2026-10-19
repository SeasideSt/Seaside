ajax
ajaxPrefilter: anObject
	"Handle custom Ajax options or modify existing options before each request is sent."

	self call: 'ajaxPrefilter' with: anObject