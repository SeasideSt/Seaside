attributes-events
onVolumeChange: anObject
	"Either the volume attribute or the muted attribute has changed. Fired after the relevant attribute's setter has returned."

	self document scriptGenerator
		event: 'volumechange'
		do: anObject
		on: self