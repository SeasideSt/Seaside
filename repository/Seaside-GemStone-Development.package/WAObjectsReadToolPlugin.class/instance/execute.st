actions
execute
	self isProfiling
		ifFalse: [ self session addFilter: self filter reset ]
		ifTrue: [
			self session removeFilter: self filter.
			self open: (WAObjectsReadTool on: self filter items) ]