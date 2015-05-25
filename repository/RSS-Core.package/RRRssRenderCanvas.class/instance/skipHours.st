channel-optional
skipHours
	"A hint for aggregators telling them which hours they can skip.
	
	An XML element that contains up to 24 <hour> sub-elements whose value is a number between 0 and 23, representing a time in GMT, when aggregators, if they support the feature, may not read the channel on hours listed in the skipHours element. The hour beginning at midnight is hour zero."
	^ self tag: 'skipHours'