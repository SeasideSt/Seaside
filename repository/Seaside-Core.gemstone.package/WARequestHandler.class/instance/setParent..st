parent/child
setParent: aRequestHandler
	parent notNil ifTrue: [ parent unregister: self ].
	parent := aRequestHandler