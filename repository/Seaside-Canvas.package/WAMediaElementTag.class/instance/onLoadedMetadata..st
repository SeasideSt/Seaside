attributes-events
onLoadedMetadata: anObject
	"The user agent has just determined the duration and dimensions of the media resource and the text tracks are ready."

	self document scriptGenerator
		event: 'loadedmetadata'
		do: anObject
		on: self