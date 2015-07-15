accessing
at: aKey ifAbsent: aBlock
	| entry |
	entry := dictionary at: aKey ifAbsent: [ ^ aBlock value ].
	entry incrementCount.
	^ entry value