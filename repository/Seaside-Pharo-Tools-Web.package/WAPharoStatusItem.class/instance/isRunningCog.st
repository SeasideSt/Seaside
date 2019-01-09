private
isRunningCog
	^ (self vm respondsTo: #isRunningCog) and: [ self vm isRunningCog ]