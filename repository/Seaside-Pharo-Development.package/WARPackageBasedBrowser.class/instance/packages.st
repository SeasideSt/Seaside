private
packages
	| rPackage |
	rPackage := Smalltalk at: #RPackage.
	^ ((rPackage respondsTo: #packageOrganizer)
		ifTrue: [ rPackage packageOrganizer ]
		ifFalse: [ rPackage organizer ]) packages