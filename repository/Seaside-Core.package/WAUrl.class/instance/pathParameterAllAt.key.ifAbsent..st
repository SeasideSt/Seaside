accessing
pathParameterAllAt: anIndex key: aKey ifAbsent: aZeroArgumentBlock
	"Answer all the paramters at path index anIndex with key aKey evaluation aZeroArgumentBlock if none is found."
	^ self
		privatePathParameterMapAt: anIndex
		ifPresentDo: [ :parameters |
			parameters allAt: aKey ifAbsent: aZeroArgumentBlock ]
		ifAbsent: aZeroArgumentBlock