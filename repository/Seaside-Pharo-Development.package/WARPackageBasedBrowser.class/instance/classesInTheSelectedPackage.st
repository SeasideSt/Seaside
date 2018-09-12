private
classesInTheSelectedPackage

	^ selectedPackage
		ifNil:[ #() ]
		ifNotNil:[ selectedPackage classes ]