monticello
commitPackages: aCollectionOfPackages
	"Send changes from aCollectionOfPackages to the configured repository."
	
	"self commitPackages: self allDirtyPackages"
	"self commitPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each commit ]