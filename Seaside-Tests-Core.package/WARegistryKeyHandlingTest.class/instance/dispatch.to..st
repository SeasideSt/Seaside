private
dispatch: aRequestContext to: aRegistry
	registrySize := aRegistry cache size.
	self assert: aRequestContext consumer next = self registryName.
	[ aRegistry handle: aRequestContext ]
		on: WAResponseNotification
		do: [ :n | ].
		
	^ aRequestContext response