parent/child
register: aRequestHandler at: aKey
	^ self cache at: aKey put: (aRequestHandler setParent: self; yourself)