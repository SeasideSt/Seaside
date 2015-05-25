actions
handlerRemove

	self handler ifNotNil: [:h |
		h ~= self dispatcher ifTrue: [
			h parent unregister: h.
			self handler: nil.
			self changed: #rootHandlers]].
 
