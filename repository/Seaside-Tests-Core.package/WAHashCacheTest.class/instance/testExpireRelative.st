testing
testExpireRelative
	"
	max age: 3 sec
	
	put 1
	put 2
	wait 2 sec
	access 1
	wait 2 sec
	
	1 should not be expired
	2 should be expired"
	| delay absent |
	cache := WAHashCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 0
		maximumRelativeAge: 3
		overflowAction: WAHashCache signalError.
	delay := Delay forSeconds: 2.
		
	cache at: 1 put: '1'.
	cache at: 2 put: '2'.
	delay wait.	
	cache at: 1 ifAbsent: [ self assert: false ].
	delay wait.
	
	"1 should still be there"
	self assert: (cache at: 1 ifAbsent: [ self assert: false ]) = '1'.
	
	"2 should be gone"
	absent := false.
	cache at: 2 ifAbsent: [ absent := true ].
	self assert: absent