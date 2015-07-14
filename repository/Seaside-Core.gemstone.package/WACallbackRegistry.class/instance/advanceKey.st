accessing
advanceKey
	| key |
	key := self nextKey.
	self increaseKey.
	^ key