Extension { #name : #WAFileLibraryTest }

{ #category : #'*seaside-tests-pharo20-core' }
WAFileLibraryTest >> runCase [
	GRPlatform current doSilently:  [ super performTest ]
]
