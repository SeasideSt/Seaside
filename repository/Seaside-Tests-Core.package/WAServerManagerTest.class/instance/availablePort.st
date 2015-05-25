private
availablePort
	"This method should always return an unused port for the server manager"
	
	^ (manager adaptors collect: [ :each | each port ]) asSet max + 1
		
	
