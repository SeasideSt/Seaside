Extension { #name : #WAFileLibraryTest }

{ #category : #'*Seaside-Tests-Pharo40-Core' }
WAFileLibraryTest >> runCase [
	GRPlatform current doSilently:  [ super performTest ]
]
