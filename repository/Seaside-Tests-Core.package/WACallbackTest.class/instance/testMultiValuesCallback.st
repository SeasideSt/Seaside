tests-callbacks
testMultiValuesCallback
	| key key1 key2 dict |
	dict := Dictionary new.
	key1 := '1'.
	key2 := '2'.
	dict at: key1 greaseInteger put: '1a'.
	dict at: key2 greaseInteger put: '2a'.
	key := registry store: (WAMultipleValuesCallback
				on: [ :v | log := v ]
				values: dict).

	"an empty callback"
	self
		shouldnt: [
			self request: (WARequestFields new
				at: key put: nil;
				yourself) ]
		raise: WARenderNotification.
	self assert: log isEmpty.
	
	" another empty callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key put: '';
				yourself) ]
		raise: WARenderNotification.
	self assert: log isEmpty.
	
	" the first callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key put: key1;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #( '1a' ).
	
	" the second callback "
	self 
		shouldnt: [
			self request: (WARequestFields new
				at: key add: key1;
				at: key add: key2;
				yourself) ]
		raise: WARenderNotification.
	self assertLog: #('1a' '2a' )

