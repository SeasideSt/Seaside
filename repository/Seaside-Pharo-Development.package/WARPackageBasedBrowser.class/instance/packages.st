private
packages
	^ (Smalltalk hasClassNamed: #RPackage)
		ifTrue: [ 
			| rPackage |
			rPackage := Smalltalk at: #RPackage.
			((rPackage respondsTo: #packageOrganizer)
				ifTrue: [ rPackage packageOrganizer ]
				ifFalse: [ rPackage organizer ]) packages  ]
		ifFalse: [ PackageOrganizer default packages ]