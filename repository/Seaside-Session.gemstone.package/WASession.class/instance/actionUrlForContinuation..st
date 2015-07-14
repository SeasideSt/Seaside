accessing
actionUrlForContinuation: aContinuation
	^ self actionUrlForKey: (continuations store: (aContinuation setParent: self; yourself))