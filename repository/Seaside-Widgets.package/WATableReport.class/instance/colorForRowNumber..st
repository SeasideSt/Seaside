private
colorForRowNumber: aNumber
	^ rowColors at: ((aNumber - 1 // rowPeriod) \\ rowColors size) + 1 ifAbsent: [ '#fff' ]