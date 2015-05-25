initialization
initializeOn: aUserConfiguration
	self initialize.
	dialog := true.
	WASystemConfiguration clearAllDescriptions.
	configuration := aUserConfiguration.
	self buildGroups