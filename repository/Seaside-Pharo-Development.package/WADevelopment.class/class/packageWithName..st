private
packageWithName: aString
	^ Smalltalk
		at: #RPackage ifPresent: [ :rPackage |
			rPackage organizer packageNamed: aString ]
		ifAbsent: [
			Smalltalk
				at: #PackageInfo ifPresent: [ :packageInfo |
				packageInfo named: aString ] ]