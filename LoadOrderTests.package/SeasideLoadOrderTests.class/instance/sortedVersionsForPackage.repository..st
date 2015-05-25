private
sortedVersionsForPackage: aName repository: repo 
	| sortedVersions | 
	sortedVersions := ((versions at: repo ifAbsent: [#()]) select: [:versionName | | parts |
							parts := (aName occurrencesOf: $-) + 1.
							(versionName beginsWith: aName) and: [parts = (versionName occurrencesOf: $-) ] ])
								asSortedCollection: [:a :b | (a copyAfterLast: $.) asNumber <= (b copyAfterLast: $.) asNumber].
	sortedVersions isEmpty ifTrue: [self inform: 'No Version for ' , aName , ' found!'. ^#() ].
	^sortedVersions