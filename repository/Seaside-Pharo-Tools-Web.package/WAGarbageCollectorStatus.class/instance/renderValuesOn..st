rendering
renderValuesOn: html 
	| incrementalGCs tenures parameters fullGCs fullGCTime incrementalGCTime |
	parameters := SmalltalkImage current getVMParameters.
	fullGCs := parameters at: 7.
	fullGCTime := parameters at: 8.
	incrementalGCs := parameters at: 9.
	incrementalGCTime := parameters at: 10.
	tenures := parameters at: 11.
	self 
		renderLabel: 'Full GCs'
		value: fullGCs
		value: (self printMilliSeconds: fullGCTime)
		value: (self printMilliSeconds: fullGCTime dividedBy: fullGCs)
		on: html.
	self 
		renderLabel: 'Incremental GCs'
		value: incrementalGCs
		value: (self printMilliSeconds: incrementalGCTime)
		value: (self printMilliSeconds: incrementalGCTime dividedBy: incrementalGCs)
		on: html.
	self 
		renderLabel: 'Tenures'
		value: tenures
		on: html.
	tenures isZero ifFalse: [
		self 
			renderLabel: 'Avg. GCs/tenure'
			value: (incrementalGCs / tenures) greaseInteger
			on: html ]