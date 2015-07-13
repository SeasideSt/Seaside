private
sweepIncrementally
	| now |
	now := Time totalSeconds.
	
	"absolute timeout sweep"
	maximumAbsoluteAge > 0 ifTrue: [
		self sweep: byCreationStart maximumAge: maximumAbsoluteAge now: now ].
	
	"relative timeout sweep"
	maximumRelativeAge > 0 ifTrue: [
		self sweep: byAccessStart maximumAge: maximumRelativeAge now: now ]