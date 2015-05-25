callbacks
callback: aNiladicValuable 
	aNiladicValuable argumentCount > 0 ifTrue: [ GRInvalidArgumentCount signal: 'Anchors expect a niladic callback.' ].
	self url addField: (self storeCallback: (WAActionCallback on: aNiladicValuable))