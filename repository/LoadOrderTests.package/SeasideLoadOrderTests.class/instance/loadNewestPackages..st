load and test
loadNewestPackages: aList

	aList do: [:assoc |
		self
			loadNewestPackage: assoc value 
			from: assoc key.
	].
