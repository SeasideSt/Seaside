tests-callbacks
testCancelCallback
	| keyValue keySave keyCancel |
	keyValue := registry store: (WAValueCallback on: [ :v | log add: v ]).
	keySave := registry store: (WAActionCallback on: [ log add: 'save' ]).
	keyCancel := registry store: (WACancelActionCallback on: [ log add: 'cancel' ]).

	" a save callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keySave
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('a' 'save' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keySave
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('b' 'save' ).

	" a cancel callback "
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyValue
						put: 'a';
					at: keyCancel
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('cancel' ).
	self 
		should: 
			[ self request: (WARequestFields new
					at: keyCancel
						put: nil;
					at: keyValue
						put: 'b';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #('cancel' )