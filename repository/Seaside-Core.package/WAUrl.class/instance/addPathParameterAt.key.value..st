adding
addPathParameterAt: anIndex key: aKey value: aValue
	"Add the path parameter aKey with aKey to the path element at anIndex."
	(self privatePathParameterMapAt: anIndex) at: aKey add: aValue 