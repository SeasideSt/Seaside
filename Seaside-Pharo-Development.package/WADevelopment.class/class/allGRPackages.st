accessing-packages
allGRPackages
	"Answer all Seaside related packages sorted alphabetically."
	
	^ GRPackage grPackages sorted: [ :a :b | a name < b name ]