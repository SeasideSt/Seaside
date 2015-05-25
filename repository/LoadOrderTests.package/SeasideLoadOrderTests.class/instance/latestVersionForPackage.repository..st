private
latestVersionForPackage: aName repository: repo
	| sortedVersions |
	sortedVersions := self sortedVersionsForPackage: aName repository: repo.
	^sortedVersions isEmpty
		ifTrue: [nil]
		ifFalse: [sortedVersions last]