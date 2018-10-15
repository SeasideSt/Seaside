attributes-events
onCueChange: anObject
	"One or more cues in the track have become active or stopped being active."

	self document scriptGenerator
		event: 'cuechange'
		do: anObject
		on: self