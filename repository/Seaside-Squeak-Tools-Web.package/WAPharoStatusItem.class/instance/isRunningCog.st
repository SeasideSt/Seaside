private
isRunningCog
	^ (self image respondsTo: #isRunningCog) and: [ self image isRunningCog ]