attributes-events
onRateChange: anObject
	"Either the defaultPlaybackRate or the playbackRate attribute has just been updated."

	self document scriptGenerator
		event: 'ratechange'
		do: anObject
		on: self