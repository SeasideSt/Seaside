enumerating
monthsAndLengthsDo: aTwoArgumentBlock
	| count last |
	count := 0.
	last := nil.
	self
		datesDo: [ :each |
			count := count + 1.
			last := each ]
		separatedBy: [
			aTwoArgumentBlock value: last month value: count.
			count := 0 ]