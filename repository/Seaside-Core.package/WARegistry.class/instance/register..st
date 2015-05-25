parent/child
register: aRequestHandler
	^ self cache store: (aRequestHandler setParent: self; yourself)