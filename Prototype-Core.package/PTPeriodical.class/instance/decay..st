options
decay: aNumber
	"This controls the rate at which the request interval grows when the response is unchanged. It is used as a multiplier on the current period (which starts at the original value of the frequency parameter). Every time a request returns an unchanged response text, the current period is multiplied by the decay. Therefore, the default value means regular requests (no change of interval). Values higher than one will yield growing intervals. Values below one are dangerous: the longer the response text stays the same, the more often you'll check, until the interval is so short your browser is left with no other choice than suicide. Note that, as soon as the response text does change, the current period resets to the original one."

	self options at: 'decay' put: aNumber