monticello
localPackageChanges: aCollectionOfPackages
	"Display the local changes of aCollectionOfPackages."
	
	"self localPackageChanges: self allDirtyPackages"
	"self localPackageChanges: self allPackages"
	
	| patches |
	patches := OrderedCollection new.
	(self gofersFor: aCollectionOfPackages)
		do: [ :each | patches addAll: each localChanges operations ].
	(MCPatch operations: patches)
		browse