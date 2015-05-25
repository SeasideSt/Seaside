tests-callbacks
testUploadCallback
	| key file |
	key := registry store: (WAUploadCallback on: [ :v | log add: v ]).

	" nil uploads are ignored "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: nil;
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" string uploads are ignored "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: 'foo';
					yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" WAFile uploads are triggered "
	self 
		shouldnt: 
			[ self request: (WARequestFields new
					at: key
						put: (file := WAFile new);
					yourself) ]
		raise: WARenderNotification.
	self assertLog: (Array with: file)