public
profile: aBlock
	start := TimeStamp now.
	tally := MessageTally new.
	tally reportOtherProcesses: false.
	^ tally spyEvery: 1 on: aBlock