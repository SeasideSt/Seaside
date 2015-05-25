load and test
doLoad
	self requestUserAndPassword.
	self askForTesting.
	self cacheRepositories.
	self groups do: [:aList | 
		self 
			loadPackages: aList;
			doTests;
			yourself.
	].
