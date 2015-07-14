public
clear
	dictionary valuesDo: [ :value |
		self cacheEntryRemoved: value value ].
	dictionary removeAll