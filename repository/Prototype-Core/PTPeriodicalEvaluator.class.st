"
Periodically performs an AJAX request and gives you the ability to update multiple elements on the page with a single callback. Offers a mechanism for decay, which lets it trigger at widening intervals while the response is unchanged.
"
Class {
	#name : #PTPeriodicalEvaluator,
	#superclass : #PTEvaluator,
	#category : 'Prototype-Core-Ajax'
}

{ #category : #options }
PTPeriodicalEvaluator >> decay: aNumber [
	"This controls the rate at which the request interval grows when the response is unchanged. It is used as a multiplier on the current period (which starts at the original value of the frequency parameter). Every time a request returns an unchanged response text, the current period is multiplied by the decay. Therefore, the default value means regular requests (no change of interval). Values higher than one will yield growing intervals. Values below one are dangerous: the longer the response text stays the same, the more often you'll check, until the interval is so short your browser is left with no other choice than suicide. Note that, as soon as the response text does change, the current period resets to the original one."

	self options at: 'decay' put: aNumber
]

{ #category : #private }
PTPeriodicalEvaluator >> defaultArguments [
	"first arg seems required even though not being used"
	^ (Array with: '') , super defaultArguments
]

{ #category : #private }
PTPeriodicalEvaluator >> defaultPrototype [
	^ 'Ajax.PeriodicalUpdater'
]

{ #category : #options }
PTPeriodicalEvaluator >> frequency: aDuration [
	"Okay, this is not a frequency (e.g 0.5Hz), but a period (i.e. a number of seconds). Don't kill me, I didn't write this one! This is the minimum interval at which AJAX requests are made. You don't want to make it too short (otherwise you may very well end up with multiple requests in parallel, if they take longer to process and return), but you technically can provide a number below one, e.g. 0.75 second."

	self options at: 'frequency' put: aDuration
]

{ #category : #actions }
PTPeriodicalEvaluator >> start [
	"If you wish to re-enable it later, just call its start method."

	self call: 'start'
]

{ #category : #actions }
PTPeriodicalEvaluator >> stop [
	"You can pull the brake on a running PeriodicalUpdater by simply calling its stop method."

	self call: 'stop'
]
