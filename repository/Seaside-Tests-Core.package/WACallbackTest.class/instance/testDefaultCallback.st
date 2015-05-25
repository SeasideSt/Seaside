tests-callbacks
testDefaultCallback
	| keyValue keySave keyDefault |
	keyValue := registry store: (WAValueCallback on: [ :v | log add: v ]).
	keySave := registry store: (WAActionCallback on: [ log add: 'save' ]).
	keyDefault := registry store: (WADefaultActionCallback on: [ log add: 'default' ]).

	" a save callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keySave
						put: nil;
					at: keyDefault
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('a' 'save' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyDefault
						put: nil;
					at: keySave
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('b' 'save' ).

	" a default callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keyDefault
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('a' 'default' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyDefault
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('b' 'default' )