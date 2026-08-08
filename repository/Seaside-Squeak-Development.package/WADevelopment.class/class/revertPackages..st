monticello
revertPackages: aCollectionOfPackages
	"Restore pristine working copies of aCollectionOfPackages."

	"self revertPackages: self allDirtyPackages"
	"self revertPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each revert ]