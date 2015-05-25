coverage
authorCoverageFor: aCollectionOfPackages
	"Answer an ordered collection with the percentage of the author coverage within aCollectionOfPackages."
	"self authorCoverageFor: self allPackages"

	| authors |
	authors := Bag new.
	aCollectionOfPackages do: [ :package |
		(PackageInfo named: package name) methods
			do: [ :method | authors add: (method timeStamp copyUpTo: Character space) ] ].
	^ authors sortedCounts 
		collect: [ :each | each value -> ((100.0 / authors size * each key) roundTo: 0.1) ]