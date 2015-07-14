cache reaping
reapHandlerCache: aHandler dispatchers: dispatchers
	| expired |
	
	expired := 0.
	(aHandler isApplication or: [ aHandler isSession ])
		ifTrue: [
			expired :=  aHandler cache gemstoneReap.
			aHandler sessionsDo: [:session | expired := expired + session continuations gemstoneReap ]]
		ifFalse: [
			aHandler isDispatcher 
				ifTrue: [ dispatchers add: aHandler ]].
	^expired