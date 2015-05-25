parent/child
unregister
	"Unregister this request handler from its parent handler."
	
	parent notNil ifTrue: [ parent unregister: self ]