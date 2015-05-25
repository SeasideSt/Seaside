options
queue: aString
	"Sets queuing options. When used with a string, can be 'front' or 'end' or 'with-last' to queue the effect in the global effects queue at the beginning or end, or a queue parameter object that can have {position: 'front/end', scope: 'scope', limit:1}."

	self optionAt: 'queue' put: aString