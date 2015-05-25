public
mapArgumentsWithElements: anStringArray parameters: aDictionary into: anArray
	1 to: self argumentCount do: [ :index |
		anArray at: index put: (anStringArray at: index) ]