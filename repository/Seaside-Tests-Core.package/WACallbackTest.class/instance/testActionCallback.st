tests-callbacks
testActionCallback
	| key1 key2 |
	key1 := registry store: (WAActionCallback on: [ log add: 1 ]).
	key2 := registry store: (WAActionCallback on: [ log add: 2 ]).

	" trigger first callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key1
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 ).

	" trigger second callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key2
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(2 ).

	" first callback has priority "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key2
						put: nil;
					at: key1
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 ).

	" first callback is only triggered once "
	self 
		should: 
			[ self request: (WARequestFields new
					at: key1
						put: nil;
					at: key1
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1 )