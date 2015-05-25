load and test
loadPackages: aList

	Transcript cr.
	aList do: [:assoc |
		self
			loadPackage: assoc value 
			from: assoc key.
	].
