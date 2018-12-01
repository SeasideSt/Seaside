Extension { #name : #WAFileLibraryTest }

{ #category : #'*seaside-tests-pharo-core' }
WAFileLibraryTest >> runCase [
	GRPlatform current doSilently:  [ super runCase ]
]
