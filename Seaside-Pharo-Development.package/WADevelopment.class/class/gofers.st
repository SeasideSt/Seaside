accessing
gofers
	"Answer a collection of gopher instances of all Seaside packages."
	"self gofers do: [ :each | each load; recompile ]"
	
	^ self gofersFor: self allGRPackages