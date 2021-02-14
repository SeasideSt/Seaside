Extension { #name : #WAFileLibraryTest }

{ #category : #'*Seaside-Tests-Squeak-Core' }
WAFileLibraryTest >> runCase [
	GRPlatform current doSilently:  [ super runCase ]
]
