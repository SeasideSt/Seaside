testing
testSendUnregistered
	"
	max age: 1 sec
	
	put 1
	wait 2 sec
	
	1 should be expired and have received #unregistered"
	| delay value absent |
	cache := WAHashCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 1
		maximumRelativeAge: 0
		overflowAction: WAHashCache signalError.
	delay := Delay forSeconds: 2.
	
	value := WAObjectUnderstandingUnregistered new.
	self deny: value hasReceivedUnregistered.
	cache at: 1 put: value.
	delay wait.
	
	"1 should be gone"
	absent := false.
	cache at: 1 ifAbsent: [ absent := true ].
	self assert: absent.
	
	self assert: value hasReceivedUnregistered. 