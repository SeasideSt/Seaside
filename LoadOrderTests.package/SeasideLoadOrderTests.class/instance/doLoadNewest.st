load and test
doLoadNewest
	self askForTesting.
	self cacheRepositories.
	self groups do: [:aList | 
		self 
			loadNewestPackages: aList;
			doTests;
			yourself.
	].
