testing
testExpireAbsolute
	"
	max age: 4 sec
	
	put 1
	wait 2 sec
	put 2
	wait 4 sec
	
	1 should be expired
	2 should not be expired"
	| delay2 delay4 absent |
	cache := WABulkReapingCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 4
		maximumRelativeAge: 0
		overflowAction: WAHashCache signalError.
	delay2 := Delay forSeconds: 2.
	delay4 := Delay forSeconds: 4.
		
	cache at: 1 put: '1'.
	delay2 wait.
	cache at: 2 put: '2'.
	delay4 wait.
	self assert: cache reap = 1 description: 'should reap exactly one item'.
	
	"1 should be gone"
	absent := false.
	cache at: 1 ifAbsent: [ absent := true ].
	self assert: absent description: 'the oldest item should be gone'.
	
	"2 should still be there"
	self assert: (cache at: 2 ifAbsent: [ self assert: false ]) = '2' description: 'the newest item should not be gone'