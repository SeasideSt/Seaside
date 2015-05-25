channel-optional
skipDays
	"A hint for aggregators telling them which days they can skip.
	
	An XML element that contains up to seven <day> sub-elements whose value is Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or Sunday. Aggregators may not read the channel during days listed in the skipDays element."
	^ self tag: 'skipDays'