querying
packages
	^ packages ifNil: [ packages := GRPackage packages sorted: [ :a :b | a name < b name ] ]