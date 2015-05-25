tests-callbacks
testDispatchCallback
	| key key1 key2 |
	key := registry store: WADispatchCallback new.
	key1 := registry store: (WAValueCallback on: 
			[ :v | log add: 1; add: v ]).
	key2 := registry store: (WAValueCallback on: 
			[ :v | log add: 2; add: v ]).

	" an empty callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" another empty callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: '';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" the first callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: key1;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 '' ).

	" the second callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: key2;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(2 '' ).
	
	" a double callback "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key put: key2;
					at: key put: key2;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(2 '' )