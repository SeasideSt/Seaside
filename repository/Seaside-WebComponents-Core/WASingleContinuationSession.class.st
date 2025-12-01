"
I am a session that stores only a single continuation. I am usesful for cases where state snapshots are not used.
"
Class {
	#name : 'WASingleContinuationSession',
	#superclass : 'WASession',
	#category : 'Seaside-WebComponents-Core',
	#package : 'Seaside-WebComponents-Core'
}

{ #category : 'initialization' }
WASingleContinuationSession >> createContinuationCache [
	^ WASingleElementCache new
]
