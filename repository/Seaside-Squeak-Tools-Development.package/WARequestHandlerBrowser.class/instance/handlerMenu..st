handlers
handlerMenu: aMenu

	self handler ifNotNil: [:h |
		h isDispatcher ifTrue: [self handlerMenu: aMenu addAddHandlerMenuFor: h].
		h ~= self dispatcher ifTrue: [
			aMenu addList: #(-
				('Remove' handlerRemove 'Remove the handler from the dispatcher'))]].
	^aMenu