testing
crossPlatformPathFromArray: pathArray finalSlash: finalSlash
	| separator path|
	separator := GRPlatform current pathSeparator.
	
	path := String new.
	pathArray do: [:pathElement | 
		path := path, separator, pathElement ].

	finalSlash ifTrue: [ path:= path, separator]. 
	
	^ path
