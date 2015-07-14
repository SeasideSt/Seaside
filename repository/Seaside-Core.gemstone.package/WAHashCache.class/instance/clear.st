public
clear
	self keysAndValuesDo: [ :key :value |
		self cacheEntryRemoved: value ].
	size := 0.
	keyTable atAllPut: nil.
	byAccessStart := nil.
	byAccessEnd := nil.
	byCreationStart := nil.
	byCreationEnd := nil