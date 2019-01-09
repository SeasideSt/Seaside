*seaside-gemstone-core
upToAndSkipThroughAll: aCollection 
	"Needed for Seaside ports to other dialects where #upToAll: may have
	different semantics"
	| res |
	res := self upToAll: aCollection.
	self atEnd ifFalse: [ self skip: aCollection size ].
	^res