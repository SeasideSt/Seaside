tests-callbacks
testImageCallback
	| key |
	key := registry store: (WAImageCallback on: [ log add: 1 ]).

	" an invalid callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key
				put: nil;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #().

	" a valid callback "
	self 
		should:  [
			self request: (WARequestFields new
				at: key , '.x'
				put: nil;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #(1)