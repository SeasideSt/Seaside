private
classesInTheSelectedPackage

	^ nautilus selectedPackage
		ifNil:[ { } ]
		ifNotNil:[ nautilus selectedPackage classes ]