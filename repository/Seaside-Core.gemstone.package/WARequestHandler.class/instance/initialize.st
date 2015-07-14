initialization
initialize
	super initialize.
	configuration := self defaultConfiguration.
	filter := WAValueHolder with: self