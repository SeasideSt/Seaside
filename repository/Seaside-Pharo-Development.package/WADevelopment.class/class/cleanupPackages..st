monticello
cleanupPackages: aCollectionOfPackages
	"Cleanup the packages of aCollectionOfPackages."

	"self cleanupPackages: self allDirtyPackages"
	"self cleanupPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each cleanup ]