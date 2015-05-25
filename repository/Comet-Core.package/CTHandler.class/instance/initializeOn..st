initialization
initializeOn: aPusher
	self initialize.
	id := WAKeyGenerator current 
		keyOfLength: 16.
	pusher := aPusher