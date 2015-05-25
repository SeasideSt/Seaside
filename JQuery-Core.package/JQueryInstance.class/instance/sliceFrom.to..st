filtering
sliceFrom: aStartInteger to: aStopInteger
	"Reduce the set of matched elements to a subset specified by a range of indices."
	
	self call: 'slice' with: aStartInteger with: aStopInteger