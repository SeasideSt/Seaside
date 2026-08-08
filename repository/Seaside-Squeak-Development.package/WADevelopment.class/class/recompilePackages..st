monticello
recompilePackages: aCollectionOfPackages
	"Recompile all packages aCollectionOfPackages."

	"self recompilePackages: self allDirtyPackages"
	"self recompilePackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each recompile ]