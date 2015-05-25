instance creation
named: aString
	"Answer a shared configuration with the given name aString or answer a newly created one."
	
	^ instances
		detect: [ :each | each name = aString ]
		ifNone: [
			instances add: (self basicNew
				initializeWithName: aString;
				yourself) ]