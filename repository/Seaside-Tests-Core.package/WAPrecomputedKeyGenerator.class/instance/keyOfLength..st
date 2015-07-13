public
keyOfLength: anInteger
	| key |
	key := keys at: current.
	current := current + 1.
	^ key