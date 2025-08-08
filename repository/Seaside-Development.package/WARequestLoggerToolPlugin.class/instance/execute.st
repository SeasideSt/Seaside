actions
execute
	self isLogging
		ifFalse: [ self session addFilter: self filter "reset" ]
		ifTrue: [
			self session removeFilter: self filter.
			self open: (WARequestLogTool on: self logger log) ]