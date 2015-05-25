tests-callbacks
testValueCallback
	| key1 key2 |
	key1 := registry store: (WAValueCallback on: 
			[ :v | log add: 1; add: v ]).
	key2 := registry store: (WAValueCallback on: 
			[ :v | log add: 2; add: v ]).

	" a single value callback with nil "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 '' ).

	" a single value callback with an empty string "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: '';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 '' ).

	" a single value callback with a string "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: 'foo';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'foo' ).

	" a single value callback with a filled collection "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 add: 'foo';
					at: key1 add: 'bar';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'foo' ).

	" two callbacks in order "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key1 put: 'b';
					at: key2 put: 'c';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'b' 2 'c' ).

	" two callbacks not in order "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key2 put: 'c';
					at: key1 put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 'b' 2 'c' )