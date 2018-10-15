attributes-events
onLoadedData: anObject
	"The user agent can render the media data at the current playback position for the first time."

	self document scriptGenerator
		event: 'loadeddata'
		do: anObject
		on: self