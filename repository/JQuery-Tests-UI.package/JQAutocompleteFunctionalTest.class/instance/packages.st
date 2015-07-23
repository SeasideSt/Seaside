querying
packages
	^ packages ifNil: [ packages := GRPackage grPackages sorted: [ :a :b | a name < b name ] ]