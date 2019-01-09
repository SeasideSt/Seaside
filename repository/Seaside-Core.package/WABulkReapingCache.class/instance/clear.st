public
clear
	dictionary do: [ :value |
		self cacheEntryRemoved: value value ].
	dictionary removeAll