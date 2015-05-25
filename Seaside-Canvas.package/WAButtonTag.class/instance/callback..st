callbacks
callback: aNiladicValuable 
	aNiladicValuable argumentCount > 0 ifTrue: [ GRInvalidArgumentCount signal: 'Buttons expect a niladic callback.' ].
	self name: (self storeCallback: (WAActionCallback on: aNiladicValuable))