monticello
loadPackages: aCollectionOfPackages
	"Load the latest version of aCollectionOfPackages."

	"self loadPackages: self allDirtyPackages"
	"self loadPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each load ]