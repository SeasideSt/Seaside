attributes-events
onEmptied: anObject
	"A media element whose networkState was previously not in the NETWORK_EMPTY state has just switched to that state (either because of a fatal error during load that's about to be reported, or because the load() method was invoked while the resource selection algorithm was already running)."

	self document scriptGenerator
		event: 'emptied'
		do: anObject
		on: self