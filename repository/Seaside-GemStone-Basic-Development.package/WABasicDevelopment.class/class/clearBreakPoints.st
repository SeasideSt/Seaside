breakpoints
clearBreakPoints

	self breakPointLocations do: [:ar |
		Smalltalk at: (ar at: 1) ifPresent: [:cl | 
			((cl perform: (ar at: 3)) compiledMethodAt: (ar at: 2)) clearBreakAtStepPoint: 1]]