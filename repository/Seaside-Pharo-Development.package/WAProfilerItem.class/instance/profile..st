public
profile: aBlock
	start := DateAndTime now.
	tally := MessageTally new.
	tally reportOtherProcesses: false.
	^ tally spyEvery: 1 on: aBlock