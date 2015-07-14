accessing
pathParameterAt: anIndex key: aKey ifAbsent: aZeroArgumentBlock
	"Answer the first paramter at path index anIndex with key aKey evaluation aZeroArgumentBlock if none is found."
	^ self
		privatePathParameterMapAt: anIndex
		ifPresentDo: [ :parameters |
			parameters at: aKey ifAbsent: aZeroArgumentBlock ]
		ifAbsent: aZeroArgumentBlock