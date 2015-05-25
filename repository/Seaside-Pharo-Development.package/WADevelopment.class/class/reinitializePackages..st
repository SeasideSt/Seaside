monticello
reinitializePackages: aCollectionOfPackages
	"Reinitializes all packages aCollectionOfPackages."

	"self reinitializePackages: self allDirtyPackages"
	"self reinitializePackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each reinitialize ]