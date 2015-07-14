*seaside-gemstone-core
gemstoneReap
	"Iterate through the cache and remove objects that have expired."

	"In GemStone, this method is performed by a separate maintenance VM, 
	 so we are already in transaction (assumed to be running in #autoBegin 
	 transactionMode) and do not have to worry about acquiring the TransactionMutex.
	Since we are using reducedConflict dictionaries in the first place, we will remove the keys
	and values from the existing dictionaries without using the mutex."

	| expired count platform |
	expired := OrderedCollection new.
	objectsByKey associationsDo: 
			[ :assoc | 
			(self expiryPolicy 
				isExpiredUpdating: assoc value
				key: assoc key) 
				ifTrue: [  
					self 
						notifyRemoved: assoc value
						key: assoc key.
					expired add:  assoc ]].
	count := 0.
	platform := GRPlatform current.
	expired do: [:assoc | 
		count := count + 1.
		objectsByKey removeKey: assoc key.
		keysByObject removeKey: assoc value ifAbsent: [].
		(count \\ 100 == 0) ifTrue: [ platform doCommitTransaction ]].
	count ~~ 0 ifTrue: [ platform doCommitTransaction ].
	^expired size