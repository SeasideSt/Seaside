adding
addPathParameterAt: anIndex key: aKey
	"Add the path parameter aKey to the path element at anIndex."
	(self privatePathParameterMapAt: anIndex) at: aKey put: nil 