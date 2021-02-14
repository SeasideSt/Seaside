Extension { #name : #WAFileLibraryTest }

{ #category : #'*Seaside-Tests-Pharo-Core' }
WAFileLibraryTest >> runCase [
	GRPlatform current doSilently:  [ super performTest ]
]
