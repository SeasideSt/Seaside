instance creation
unregister: aConfiguration
	"Removes aConfiguration from the list of known configurations."
	
	^ instances remove: aConfiguration ifAbsent: [ nil ]