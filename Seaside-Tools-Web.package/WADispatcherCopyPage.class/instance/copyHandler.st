actions
copyHandler
	| newHandler |
	newHandler := self handler parent 
		register: self handler cloneHandler
		at: name.
	^ self answer: newHandler