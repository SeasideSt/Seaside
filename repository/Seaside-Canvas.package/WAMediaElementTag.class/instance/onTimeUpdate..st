attributes-events
onTimeUpdate: anObject
	"The current playback position changed as part of normal playback or in an especially interesting way, for example discontinuously."

	self document scriptGenerator
		event: 'timeupdate'
		do: anObject
		on: self